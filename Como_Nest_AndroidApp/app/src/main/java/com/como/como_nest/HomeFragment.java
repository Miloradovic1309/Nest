package com.como.como_nest;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.textclassifier.ConversationActions;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import java.util.ArrayList;
import java.util.Set;

public class HomeFragment extends Fragment {

    private static final String TAG = "HomeFragment";

    private ListView lVParedDevices;
    private ArrayAdapter aAdapter;

    private ListView lvBoatAddresses;


    public BluetoothDevice bt_Device;
    public ArrayList<BluetoothDevice> al_bt_Devices = new ArrayList<>();

    public static ArrayList<Boats> boats = new ArrayList<Boats>();
    public static ArrayList<String> boatsText = new ArrayList<String>();

    //Widgets
    TextView tvPairedDevice;
   // public static TextView tvConnectToStation;
   // public static TextView tvConnectToBoat;
    public static ImageView ivConnectToStation;
    public static ImageView ivConnectToBoat;
    RelativeLayout rlAddressesControl;
    Button btnAddAddress;
    Button btnDeleteAddress;


    public static Button btnDisconnect;
    public static Button btnConnect;
    public static Button btnGetPairedDevices;

    Boats boat;
    int boatPosition;

    ArrayAdapter adapter;



    private void readFromDatabase(){
        try {


            Cursor cursor = MainActivity.eventsDB.rawQuery("SELECT * FROM newBoats", null);
            int nameIndex = cursor.getColumnIndex("name");
            int addressIndex = cursor.getColumnIndex("address");

            cursor.moveToFirst();

            boats.clear();
            boatsText.clear();

            while (cursor != null) {

                String boatName = cursor.getString(nameIndex);
                int boatAddress = cursor.getInt(addressIndex);

                boats.add(new Boats(boatName, boatAddress));
                boatsText.add("Name: " + boatName + "\n" + "Address: " + boatAddress);

                Log.d(TAG, "onCreateView: Name: " + boatName + "\n" + "Address: " + boatAddress);

                cursor.moveToNext();
            }
            Log.d(TAG, "onCreateView: proslo");
        }
        catch (Exception e){
            Log.d(TAG, "onCreateView: desilo se");
        }

        ArrayAdapter adapter = new ArrayAdapter(getActivity().getBaseContext(), R.layout.layout_listview_of_paired_devices, boatsText);
        lvBoatAddresses.setAdapter(adapter);
    }




    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.home_fragment, container, false);

        btnGetPairedDevices = view.findViewById(R.id.btnGetPairedDevices);
        btnConnect = view.findViewById(R.id.btnConnect);
        tvPairedDevice = view.findViewById(R.id.tvPairedDevice);
        //tvConnectToStation = view.findViewById(R.id.tvConnectToStation);
        //tvConnectToBoat = view.findViewById(R.id.tvConnectToBoat);
        ivConnectToStation = view.findViewById(R.id.ivConnectToStation);
        ivConnectToBoat = view.findViewById(R.id.ivConnectToBoat);


        lVParedDevices = view.findViewById(R.id.deviceList);

        rlAddressesControl = view.findViewById(R.id.rlAddressesControl);

        btnAddAddress = view.findViewById(R.id.btnAddAddress);
        btnDeleteAddress = view.findViewById(R.id.btnDeleteAddress);

        lvBoatAddresses = view.findViewById(R.id.lvBoatAddresses);

        btnDisconnect = view.findViewById(R.id.btnDisconnect);


        readFromDatabase();







        btnAddAddress.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "onClick: ");
                NewAddressDialog dialog = new NewAddressDialog();

                dialog.setTargetFragment(HomeFragment.this, 1);
                dialog.show(getFragmentManager(), "MyCustomDialog");
            }
        });

        btnDeleteAddress.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                try {

                    String sqlCommand = "DELETE FROM newBoats WHERE name = \'" + boat.getNamee() + "\'" + " AND address = " + boat.getAddress();
                    MainActivity.eventsDB.execSQL(sqlCommand);

                    readFromDatabase();

                    ControlFragment.addrOfBoat[0] = 0x00;
                    ControlFragment.addrOfBoat[1] = 0x00;
                }
                catch(Exception e){

                }
            }
        });


        lvBoatAddresses.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                view.setSelected(true);

                boat = boats.get(position);
                boatPosition = position;

                ControlFragment.addrOfBoat[0] = (byte)(((boat.getAddress() + 0x3F) >> 8) & 0xFF);
                ControlFragment.addrOfBoat[1] = (byte)((boat.getAddress() + 0x3F) & 0xFF);

                ControlFragment.tvAddressBoat.setText(String.valueOf(boat.getAddress()));

                for (int i = 0; i < lvBoatAddresses.getChildCount(); i++) {
                    lvBoatAddresses.getChildAt(i).setBackgroundResource(0);
                }
                lvBoatAddresses.getChildAt(position).setBackgroundResource(R.color.colorBackgroundStart);


            }
        });



        btnConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(MainActivity.mBluetoothAdapter.isEnabled()) {
                    try {
                        //MainActivity.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
                        MainActivity.startConnection(bt_Device);

                        lVParedDevices.setVisibility(View.GONE);
                        rlAddressesControl.setVisibility(View.VISIBLE);

                    } catch (Exception e) {
                        Toast.makeText(getContext(), "Get paired device first", Toast.LENGTH_SHORT).show();
                    }
                }
                else{
                    Toast.makeText(getContext(), "Turn On Bluetooth first", Toast.LENGTH_SHORT).show();
                }
            }
        });


        btnGetPairedDevices.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(MainActivity.mBluetoothAdapter.isEnabled()) {
                    if (MainActivity.mBluetoothAdapter == null) {
                        Toast.makeText(getActivity().getBaseContext(), "Bluetooth Not Supported", Toast.LENGTH_SHORT).show();
                    } else {
                        if(lVParedDevices.getVisibility() == View.GONE) {
                            lVParedDevices.setVisibility(View.VISIBLE);
                            rlAddressesControl.setVisibility(View.GONE);

                            Set<BluetoothDevice> pairedDevices = MainActivity.mBluetoothAdapter.getBondedDevices();
                            ArrayList list = new ArrayList();
                            if (pairedDevices.size() > 0) {
                                for (BluetoothDevice device : pairedDevices) {
                                    String devicename = device.getName();
                                    String macAddress = device.getAddress();
                                    list.add("Name: " + devicename + "\n" + "MAC Address: " + macAddress);
                                    al_bt_Devices.add(device);
                                }

                                aAdapter = new ArrayAdapter(getActivity().getBaseContext(), R.layout.layout_listview_of_paired_devices, list);
                                lVParedDevices.setAdapter(aAdapter);
                            }
                        }
                        else{
                            lVParedDevices.setVisibility(View.GONE);
                            rlAddressesControl.setVisibility(View.VISIBLE);
                        }
                    }
                }else{
                    Toast.makeText(getContext().getApplicationContext(), "Turn On Bluetooth", Toast.LENGTH_SHORT).show();
                }
            }
        });



        lVParedDevices.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                view.setSelected(true);


                //first cancel discovery because its very memory intensive.
                MainActivity.mBluetoothAdapter.cancelDiscovery();

                Log.d(TAG, "onItemClick: You Clicked on a device.");
                String deviceName = al_bt_Devices.get(position).getName();
                String deviceAddress = al_bt_Devices.get(position).getAddress();

                Log.d(TAG, "onItemClick: deviceName = " + deviceName);
                Log.d(TAG, "onItemClick: deviceAddress = " + deviceAddress);

                //create the bond.
                //NOTE: Requires API 17+? I think this is JellyBean
                if (Build.VERSION.SDK_INT > Build.VERSION_CODES.JELLY_BEAN_MR2) {
                    Log.d(TAG, "Trying to pair with " + deviceName);
                    al_bt_Devices.get(position).createBond();

                    bt_Device = al_bt_Devices.get(position);
                    tvPairedDevice.setText("Name: " + bt_Device.getName() + '\n' + "MAC Address: " + bt_Device.getAddress());
                    MainActivity.mBluetoothConnection = new BluetoothConnectionService(getContext());
                }

                lVParedDevices.setVisibility(View.GONE);
                rlAddressesControl.setVisibility(View.VISIBLE);

            }
        });







        return view;
    }



}
