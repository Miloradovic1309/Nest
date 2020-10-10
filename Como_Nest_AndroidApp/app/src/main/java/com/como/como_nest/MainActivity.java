package com.como.como_nest;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;
import androidx.viewpager.widget.ViewPager;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.bottomnavigation.LabelVisibilityMode;
import com.ittianyu.bottomnavigationviewex.BottomNavigationViewEx;

import java.util.ArrayList;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = "MainActivity";
    private SectionsStatePagerAdapter mSectionsStatePagerAdapter;
    private LockableViewPager mViewPager;
    private BottomNavigationViewEx bottomNavigationViewEx;




    public static BluetoothAdapter mBluetoothAdapter;
    public static BluetoothConnectionService mBluetoothConnection;
    private static final UUID MY_UUID_INSECURE =
            UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");

    BluetoothDevice mBTDevice;

    public ArrayList<BluetoothDevice> mBTDevices = new ArrayList<>();


    int boatGear = 0;
    public static int boatWheel = 150;
    public static boolean boatInteriorLight = false;
    public static boolean boatNavigationLight = false;
    public static boolean boatControlTaken = false;
    public static boolean stationConnected = false;
    public static boolean boatConnected = false;

    public static boolean boatBattery1 = false;
    public static boolean boatBattery2 = false;

    public static int boatBattery1Level = 0;
    public static int boatBattery2Level = 0;



    public static boolean boatSpeedTurtle = false;
    public static boolean boatSpeedRabbit = false;
    public static boolean boatSpeedLeopard = false;
    public static int boatSpeed = 0;




    public static SQLiteDatabase eventsDB;

    String boatName;
    int boatAddress;






    public void clickBtnILight(View view){
        ControlFragment.statusByte = ControlFragment.statusByte | 0x02;
    }

    public void clickBtnNLight(View view){
        ControlFragment.statusByte = ControlFragment.statusByte | 0x04;
    }

    public void clickBtn1Set(View view){
        ControlFragment.statusByte = ControlFragment.statusByte | 0x08;
        ControlFragment.statusByte = ControlFragment.statusByte & 0xEF;
    }

    public void clickBtn2Set(View view){
        ControlFragment.statusByte = ControlFragment.statusByte | 0x10;
        ControlFragment.statusByte = ControlFragment.statusByte & 0xF7;
    }



    public void clickImgSpeedTurtle(View view){
        ControlFragment.statusGear = ControlFragment.statusGear & 0xC7;
        ControlFragment.statusGear = ControlFragment.statusGear | 0x08;
    }

    public void clickImgSpeedRabbit(View view){
        ControlFragment.statusGear = ControlFragment.statusGear & 0xC7;
        ControlFragment.statusGear = ControlFragment.statusGear | 0x10;
    }

    public void clickImgSpeedLeopard(View view){
        ControlFragment.statusGear = ControlFragment.statusGear & 0xC7;
        ControlFragment.statusGear = ControlFragment.statusGear | 0x20;
    }

    public void clickBtn1(View view){
        ControlFragment.statusGear = 1;
    }
    public void clickBtn2(View view){
        ControlFragment.statusGear = 2;
    }
    public void clickBtn3(View view){
        ControlFragment.statusGear = 3;
    }
    public void clickBtnN(View view){
        ControlFragment.statusGear = 4;
    }
    public void clickBtnR(View view){
        ControlFragment.statusGear = 5;
    }




    public void clickBtnDisconnect(View view){
        Log.d(TAG, "clickBtnDisconnect: ");
        mBluetoothConnection.resetConnection();

        BluetoothConnectionService.bluetoothConnected = false;



        /*

        Log.d(TAG, "enableDisableBT: disabling BT.");
        mBluetoothAdapter.disable();

        IntentFilter BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
        registerReceiver(mBroadcastReceiver1, BTIntent);

        Log.d(TAG, "enableDisableBT: enabling BT.");
        Intent enableBTIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
        startActivity(enableBTIntent);

        BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
        registerReceiver(mBroadcastReceiver1, BTIntent);

         */




        /*
        if (mBluetoothAdapter == null) {
            Log.d(TAG, "enableDisableBT: Does not have BT capabilities.");
        }
        if (!mBluetoothAdapter.isEnabled()) {
            Log.d(TAG, "enableDisableBT: enabling BT.");
            Intent enableBTIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivity(enableBTIntent);

            IntentFilter BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
            registerReceiver(mBroadcastReceiver1, BTIntent);
        }
        if (mBluetoothAdapter.isEnabled()) {
            Log.d(TAG, "enableDisableBT: disabling BT.");
            mBluetoothAdapter.disable();

            IntentFilter BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
            registerReceiver(mBroadcastReceiver1, BTIntent);
        }

         */
    }







    /**********************************************************************************************************************/
    /*
    Broadcasters
     */
    /**********************************************************************************************************************/

    // Create a BroadcastReceiver for ACTION_FOUND
    private final BroadcastReceiver mBroadcastReceiver1 = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            // When discovery finds a device
            if (action.equals(mBluetoothAdapter.ACTION_STATE_CHANGED)) {
                final int state = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE, mBluetoothAdapter.ERROR);

                switch (state) {
                    case BluetoothAdapter.STATE_OFF:
                        Log.d(TAG, "mBroadcastReceiver1: STATE OFF");
                        break;
                    case BluetoothAdapter.STATE_TURNING_OFF:
                        Log.d(TAG, "mBroadcastReceiver1: STATE TURNING OFF");
                        break;
                    case BluetoothAdapter.STATE_ON:
                        Log.d(TAG, "mBroadcastReceiver1: STATE ON");
                        break;
                    case BluetoothAdapter.STATE_TURNING_ON:
                        Log.d(TAG, "mBroadcastReceiver1: STATE TURNING ON");
                        break;
                }
            }
        }
    };

    /**
     * Broadcast Receiver for changes made to bluetooth states such as:
     * 1) Discoverability mode on/off or expire.
     */
    private final BroadcastReceiver mBroadcastReceiver2 = new BroadcastReceiver() {

        @Override
        public void onReceive(Context context, Intent intent) {
            final String action = intent.getAction();

            if (action.equals(BluetoothAdapter.ACTION_SCAN_MODE_CHANGED)) {

                int mode = intent.getIntExtra(BluetoothAdapter.EXTRA_SCAN_MODE, BluetoothAdapter.ERROR);

                switch (mode) {
                    //Device is in Discoverable Mode
                    case BluetoothAdapter.SCAN_MODE_CONNECTABLE_DISCOVERABLE:
                        Log.d(TAG, "mBroadcastReceiver2: Discoverability Enabled.");
                        break;
                    //Device not in discoverable mode
                    case BluetoothAdapter.SCAN_MODE_CONNECTABLE:
                        Log.d(TAG, "mBroadcastReceiver2: Discoverability Disabled. Able to receive connections.");
                        break;
                    case BluetoothAdapter.SCAN_MODE_NONE:
                        Log.d(TAG, "mBroadcastReceiver2: Discoverability Disabled. Not able to receive connections.");
                        break;
                    case BluetoothAdapter.STATE_CONNECTING:
                        Log.d(TAG, "mBroadcastReceiver2: Connecting....");
                        break;
                    case BluetoothAdapter.STATE_CONNECTED:
                        Log.d(TAG, "mBroadcastReceiver2: Connected.");
                        break;
                }

            }
        }
    };


    /**
     * Broadcast Receiver for listing devices that are not yet paired
     * -Executed by btnDiscover() method.
     */
    private BroadcastReceiver mBroadcastReceiver3 = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            final String action = intent.getAction();
            Log.d(TAG, "onReceive: ACTION FOUND.");

            if (action.equals(BluetoothDevice.ACTION_FOUND)) {
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                mBTDevices.add(device);
                Log.d(TAG, "onReceive: " + device.getName() + ": " + device.getAddress());
                //mDeviceListAdapter = new DeviceListAdapter(context, R.layout.device_adapter_view, mBTDevices);
                //lvNewDevices.setAdapter(mDeviceListAdapter);
            }
        }
    };

    /**
     * Broadcast Receiver that detects bond state changes (Pairing status changes)
     */
    private final BroadcastReceiver mBroadcastReceiver4 = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            final String action = intent.getAction();

            if (action.equals(BluetoothDevice.ACTION_BOND_STATE_CHANGED)) {
                BluetoothDevice mDevice = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                //3 cases:
                //case1: bonded already
                if (mDevice.getBondState() == BluetoothDevice.BOND_BONDED) {
                    Log.d(TAG, "BroadcastReceiver: BOND_BONDED.");
                    //inside BroadcastReceiver4
                    mBTDevice = mDevice;
                }
                //case2: creating a bone
                if (mDevice.getBondState() == BluetoothDevice.BOND_BONDING) {
                    Log.d(TAG, "BroadcastReceiver: BOND_BONDING.");
                }
                //case3: breaking a bond
                if (mDevice.getBondState() == BluetoothDevice.BOND_NONE) {
                    Log.d(TAG, "BroadcastReceiver: BOND_NONE.");
                }
            }
        }
    };


    /************************************************************************************************/
    /************************************************************************************************/
    /************************************************************************************************/









    @Override
    protected void onDestroy() {
        Log.d(TAG, "onDestroy: called.");
        super.onDestroy();
        try {
            unregisterReceiver(mBroadcastReceiver1);
            unregisterReceiver(mBroadcastReceiver2);
            unregisterReceiver(mBroadcastReceiver3);
            unregisterReceiver(mBroadcastReceiver4);
            //mBluetoothAdapter.cancelDiscovery();
        }
        catch(Exception e){

        }
    }




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);





        try{
            eventsDB = this.openOrCreateDatabase("newBoats", MODE_PRIVATE, null);
            eventsDB.execSQL("CREATE TABLE IF NOT EXISTS newBoats (name VARCHAR, address INTEGER(4))");



        }
        catch (Exception e){
            e.printStackTrace();
            Log.d(TAG, "sql: prekid");
        }



        mViewPager = findViewById(R.id.container);
        // setup the pager
        setupViewPager(mViewPager);

        bottomNavigationViewEx = findViewById(R.id.bottomNavViewBar);

        bottomNavigationViewEx.enableAnimation(false);
        bottomNavigationViewEx.enableShiftingMode(false);
        bottomNavigationViewEx.enableItemShiftingMode(false);
        bottomNavigationViewEx.setLabelVisibilityMode(LabelVisibilityMode.LABEL_VISIBILITY_UNLABELED);


        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));

        //Broadcasts when bond state changes (ie:pairing)
        IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_BOND_STATE_CHANGED);
        registerReceiver(mBroadcastReceiver4, filter);

        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();



        if (!mBluetoothAdapter.isEnabled()) {
            Log.d(TAG, "enableDisableBT: enabling BT.");
            Intent enableBTIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivity(enableBTIntent);

            IntentFilter BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
            registerReceiver(mBroadcastReceiver1, BTIntent);
        }












        bottomNavigationViewEx.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                Menu menu = bottomNavigationViewEx.getMenu();
                MenuItem item;
                switch (menuItem.getItemId()) {
                    case R.id.ic_home:
                        setViewPager(0);
                        menu = bottomNavigationViewEx.getMenu();
                        item = menu.getItem(0);
                        menuItem.setChecked(true);
                        break;
                    case R.id.ic_control:
                        setViewPager(1);
                        menu = bottomNavigationViewEx.getMenu();
                        item = menu.getItem(1);
                        menuItem.setChecked(true);
                        break;
                }
                return false;
            }
        });



    }












    //create method for starting connection
//***remember the conncction will fail and app will crash if you haven't paired first
    public static void startConnection(BluetoothDevice mBTDevice) {
        startBTConnection(mBTDevice, MY_UUID_INSECURE);
    }
    /**
     * starting chat service method
     */
    public static void startBTConnection(BluetoothDevice device, UUID uuid) {
        Log.d(TAG, "startBTConnection: Initializing RFCOM Bluetooth Connection.");


            mBluetoothConnection.startClient(device, uuid);


    }


    /**
     * This method is required for all devices running API23+
     * Android must programmatically check the permissions for bluetooth. Putting the proper permissions
     * in the manifest is not enough.
     * <p>
     * NOTE: This will only execute on versions > LOLLIPOP because it is not needed otherwise.
     */
    private void checkBTPermissions() {
        if (Build.VERSION.SDK_INT > Build.VERSION_CODES.LOLLIPOP) {
            int permissionCheck = this.checkSelfPermission("Manifest.permission.ACCESS_FINE_LOCATION");
            permissionCheck += this.checkSelfPermission("Manifest.permission.ACCESS_COARSE_LOCATION");
            if (permissionCheck != 0) {

                this.requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION}, 1001); //Any number
            }
        } else {
            Log.d(TAG, "checkBTPermissions: No need to check permissions. SDK version < LOLLIPOP.");
        }
    }





    /*
    Broadcast receiver
     */
    private boolean startReceivingData = false;
    private int bytes_counter = 0;
    private int[] receivedBytes = new int[15];
    private int length_received_bytes = 0;
    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //String text = intent.getStringExtra("theMessage");
            /*messages.append(text + '\n');
            incomingMessage = text;
            Log.d(TAG, "onReceiveText: " + text);
            */
            String strBytes = "";
            int[] buf = intent.getIntArrayExtra("theBytes");

            for (int i = 0; i < buf.length; i++) {
                strBytes = strBytes + " " + String.format("%02X", (buf[i]));
            }

            Log.d(TAG, "Input bytes: " + strBytes);


            for (int i = 0; i < buf.length; i++) {
                if ((buf[i] == 0x21) && (!startReceivingData)) {
                    startReceivingData = true;
                    bytes_counter = 0;
                    length_received_bytes = 0;
                    for (int z = 0; z < 15; z++) {
                        receivedBytes[z] = 0;
                    }
                } else if ((buf[i] == 0x3B) && (startReceivingData == true)
                        && (bytes_counter + 1 == length_received_bytes)) {

                    startReceivingData = false;
                    receivedBytes[bytes_counter] = Integer.valueOf(buf[i]);
                    bytes_counter = 0;
                    length_received_bytes = 0;

                    if ((receivedBytes[0] == 0x21) && (receivedBytes[1] == 0x25)
                            && (receivedBytes[2] == 0x30) && (receivedBytes[4] == 0xC0) && (receivedBytes[9] == 0x3B)) {


                        boatWheel = receivedBytes[5];
                        boatGear = receivedBytes[6] & 0x07;
                        boatSpeed = (receivedBytes[6] >> 3) & 0x07;
                        boatInteriorLight = (receivedBytes[7] & 0x02) > 0;
                        boatNavigationLight = (receivedBytes[7] & 0x04) > 0;
                        boatConnected = (receivedBytes[7] & 0x20) > 0;
                        boatControlTaken = (receivedBytes[7] & 0x01) > 0;

                        boatBattery1 = (receivedBytes[7] & 0x08) > 0;
                        boatBattery2 = (receivedBytes[7] & 0x10) > 0;

                        ControlFragment.tvBoatWheel.setText(String.valueOf(boatWheel));

                        ControlFragment.propeler.setRotation((((float)boatWheel - 50f) - 100f) * 0.45f);

                        if((boatSpeed & 0x01) == 0x01){
                            ControlFragment.btnSat.setBackgroundResource(R.drawable.ic_control_turtle_custom);
                        }
                        else if((boatSpeed & 0x02) == 0x02){
                            ControlFragment.btnSat.setBackgroundResource(R.drawable.ic_control_rabbit_custom);
                        }
                        else if((boatSpeed & 0x04) == 0x04){
                            ControlFragment.btnSat.setBackgroundResource(R.drawable.ic_control_leopard_custom);
                        }
                        else{
                            ControlFragment.btnSat.setBackgroundResource(R.drawable.ic_sat_custom);
                        }

                        if(SpeedDialog.openedSpeedDialog) {
                            if((boatSpeed & 0x01) == 0x01){
                                SpeedDialog.imgSpeedTurtle.setBackgroundResource(R.color.colorBackgroundStart);
                                SpeedDialog.imgSpeedRabbit.setBackgroundResource(R.color.colorBlack);
                                SpeedDialog.imgSpeedLeopard.setBackgroundResource(R.color.colorBlack);
                            }
                            else if((boatSpeed & 0x02) == 0x02){
                                SpeedDialog.imgSpeedTurtle.setBackgroundResource(R.color.colorBlack);
                                SpeedDialog.imgSpeedRabbit.setBackgroundResource(R.color.colorBackgroundStart);
                                SpeedDialog.imgSpeedLeopard.setBackgroundResource(R.color.colorBlack);
                            }
                            else if((boatSpeed & 0x04) == 0x04){
                                SpeedDialog.imgSpeedTurtle.setBackgroundResource(R.color.colorBlack);
                                SpeedDialog.imgSpeedRabbit.setBackgroundResource(R.color.colorBlack);
                                SpeedDialog.imgSpeedLeopard.setBackgroundResource(R.color.colorBackgroundStart);
                            }

                        }

                        if(BatteryDialog.openedDialog){
                            if(boatBattery1){
                                BatteryDialog.btnBat1.setBackgroundColor(getResources().getColor(R.color.colorCirclePointer));
                            }
                            else{
                                BatteryDialog.btnBat1.setBackgroundColor(Color.GRAY);
                            }

                            if(boatBattery2){
                                BatteryDialog.btnBat2.setBackgroundColor(getResources().getColor(R.color.colorCirclePointer));
                            }
                            else{
                                BatteryDialog.btnBat2.setBackgroundColor(Color.GRAY);
                            }

                            boatBattery1Level = receivedBytes[8] & 0x07;
                            boatBattery2Level = (receivedBytes[8]>>3) & 0x07;

                            switch (boatBattery1Level){
                                case 0:
                                    BatteryDialog.radioButtonBat1_25.setChecked(false);
                                    BatteryDialog.radioButtonBat1_50.setChecked(false);
                                    BatteryDialog.radioButtonBat1_75.setChecked(false);
                                    BatteryDialog.radioButtonBat1_100.setChecked(false);
                                    break;
                                case 1:
                                    BatteryDialog.radioButtonBat1_25.setChecked(true);
                                    BatteryDialog.radioButtonBat1_50.setChecked(false);
                                    BatteryDialog.radioButtonBat1_75.setChecked(false);
                                    BatteryDialog.radioButtonBat1_100.setChecked(false);
                                    break;
                                case 2:
                                    BatteryDialog.radioButtonBat1_25.setChecked(true);
                                    BatteryDialog.radioButtonBat1_50.setChecked(true);
                                    BatteryDialog.radioButtonBat1_75.setChecked(false);
                                    BatteryDialog.radioButtonBat1_100.setChecked(false);
                                    break;
                                case 3:
                                    BatteryDialog.radioButtonBat1_25.setChecked(true);
                                    BatteryDialog.radioButtonBat1_50.setChecked(true);
                                    BatteryDialog.radioButtonBat1_75.setChecked(true);
                                    BatteryDialog.radioButtonBat1_100.setChecked(false);
                                    break;
                                case 4:
                                    BatteryDialog.radioButtonBat1_25.setChecked(true);
                                    BatteryDialog.radioButtonBat1_50.setChecked(true);
                                    BatteryDialog.radioButtonBat1_75.setChecked(true);
                                    BatteryDialog.radioButtonBat1_100.setChecked(true);
                                    break;
                            }

                            switch (boatBattery2Level){
                                case 0:
                                    BatteryDialog.radioButtonBat2_25.setChecked(false);
                                    BatteryDialog.radioButtonBat2_50.setChecked(false);
                                    BatteryDialog.radioButtonBat2_75.setChecked(false);
                                    BatteryDialog.radioButtonBat2_100.setChecked(false);
                                    break;
                                case 1:
                                    BatteryDialog.radioButtonBat2_25.setChecked(true);
                                    BatteryDialog.radioButtonBat2_50.setChecked(false);
                                    BatteryDialog.radioButtonBat2_75.setChecked(false);
                                    BatteryDialog.radioButtonBat2_100.setChecked(false);
                                    break;
                                case 2:
                                    BatteryDialog.radioButtonBat2_25.setChecked(true);
                                    BatteryDialog.radioButtonBat2_50.setChecked(true);
                                    BatteryDialog.radioButtonBat2_75.setChecked(false);
                                    BatteryDialog.radioButtonBat2_100.setChecked(false);
                                    break;
                                case 3:
                                    BatteryDialog.radioButtonBat2_25.setChecked(true);
                                    BatteryDialog.radioButtonBat2_50.setChecked(true);
                                    BatteryDialog.radioButtonBat2_75.setChecked(true);
                                    BatteryDialog.radioButtonBat2_100.setChecked(false);
                                    break;
                                case 4:
                                    BatteryDialog.radioButtonBat2_25.setChecked(true);
                                    BatteryDialog.radioButtonBat2_50.setChecked(true);
                                    BatteryDialog.radioButtonBat2_75.setChecked(true);
                                    BatteryDialog.radioButtonBat2_100.setChecked(true);
                                    break;
                            }

                        }






                        if(boatInteriorLight){
                            ControlFragment.btnILight.setSelected(true);
                        }
                        else{
                            ControlFragment.btnILight.setSelected(false);
                        }

                        if(boatNavigationLight){
                            ControlFragment.btnNLight.setSelected(true);
                        }
                        else{
                            ControlFragment.btnNLight.setSelected(false);
                        }

                        switch(boatGear){
                            case 1:
                                ControlFragment.btnGear1.setSelected(true);
                                ControlFragment.btnGear2.setSelected(false);
                                ControlFragment.btnGear3.setSelected(false);
                                ControlFragment.btnGearN.setSelected(false);
                                ControlFragment.btnGearR.setSelected(false);
                                break;
                            case 2:
                                ControlFragment.btnGear1.setSelected(false);
                                ControlFragment.btnGear2.setSelected(true);
                                ControlFragment.btnGear3.setSelected(false);
                                ControlFragment.btnGearN.setSelected(false);
                                ControlFragment.btnGearR.setSelected(false);
                                break;
                            case 3:
                                ControlFragment.btnGear1.setSelected(false);
                                ControlFragment.btnGear2.setSelected(false);
                                ControlFragment.btnGear3.setSelected(true);
                                ControlFragment.btnGearN.setSelected(false);
                                ControlFragment.btnGearR.setSelected(false);
                                break;
                            case 4:
                                ControlFragment.btnGear1.setSelected(false);
                                ControlFragment.btnGear2.setSelected(false);
                                ControlFragment.btnGear3.setSelected(false);
                                ControlFragment.btnGearN.setSelected(true);
                                ControlFragment.btnGearR.setSelected(false);
                                break;
                            case 5:
                                ControlFragment.btnGear1.setSelected(false);
                                ControlFragment.btnGear2.setSelected(false);
                                ControlFragment.btnGear3.setSelected(false);
                                ControlFragment.btnGearN.setSelected(false);
                                ControlFragment.btnGearR.setSelected(true);
                                break;
                            default:
                                ControlFragment.btnGear1.setSelected(false);
                                ControlFragment.btnGear2.setSelected(false);
                                ControlFragment.btnGear3.setSelected(false);
                                ControlFragment.btnGearN.setSelected(false);
                                ControlFragment.btnGearR.setSelected(false);
                                break;

                        }

                        if(boatConnected){
                            //HomeFragment.tvConnectToBoat.setText("Connected to the boat");
                            //HomeFragment.tvConnectToBoat.setTextColor(getResources().getColor(R.color.colorDarkGreen));
                            HomeFragment.ivConnectToBoat.setSelected(true);

                        }
                        else{
                            //HomeFragment.tvConnectToBoat.setText("Not connected to the boat");
                            //HomeFragment.tvConnectToBoat.setTextColor(Color.RED);
                            HomeFragment.ivConnectToBoat.setSelected(false);
                            ControlFragment.tvBoatWheel.setText("NaN");
                            ControlFragment.btnGear1.setSelected(false);
                            ControlFragment.btnGear2.setSelected(false);
                            ControlFragment.btnGear3.setSelected(false);
                            ControlFragment.btnGearN.setSelected(false);
                            ControlFragment.btnGearR.setSelected(false);
                            ControlFragment.btnILight.setSelected(false);
                            ControlFragment.btnNLight.setSelected(false);

                            ControlFragment.btnSat.setBackgroundResource(R.drawable.ic_sat_custom);

                            if(BatteryDialog.openedDialog) {
                                MainActivity.boatBattery1Level = 0;
                                MainActivity.boatBattery2Level = 0;
                                BatteryDialog.btnBat1.setBackgroundColor(Color.GRAY);
                                BatteryDialog.btnBat2.setBackgroundColor(Color.GRAY);
                                BatteryDialog.radioButtonBat1_25.setChecked(false);
                                BatteryDialog.radioButtonBat1_50.setChecked(false);
                                BatteryDialog.radioButtonBat1_75.setChecked(false);
                                BatteryDialog.radioButtonBat1_100.setChecked(false);
                                BatteryDialog.radioButtonBat2_25.setChecked(false);
                                BatteryDialog.radioButtonBat2_50.setChecked(false);
                                BatteryDialog.radioButtonBat2_75.setChecked(false);
                                BatteryDialog.radioButtonBat2_100.setChecked(false);
                            }

                            if(SpeedDialog.openedSpeedDialog){
                                SpeedDialog.imgSpeedTurtle.setBackgroundResource(R.color.colorBlack);
                                SpeedDialog.imgSpeedRabbit.setBackgroundResource(R.color.colorBlack);
                                SpeedDialog.imgSpeedLeopard.setBackgroundResource(R.color.colorBlack);
                                MainActivity.boatSpeed = 0;
                            }
                        }

                        ControlFragment.boolConnectedToStation = true;





                    }

                }


                if (startReceivingData) {
                    receivedBytes[bytes_counter] = Integer.valueOf(buf[i]);
                    bytes_counter++;

                    if (bytes_counter == 5) {
                        switch (receivedBytes[4]) {
                            case 0xC0:
                                length_received_bytes = 10;
                                break;

                        }

                    }

                    if (bytes_counter > 13) {
                        bytes_counter = 0;
                        length_received_bytes = 0;
                        startReceivingData = false;
                        for (int z = 0; z < 15; z++) {
                            receivedBytes[z] = 0;
                        }
                    }

                }


            }


        }
    };




















    private void setupViewPager(LockableViewPager viewPager){
        SectionsStatePagerAdapter adapter = new SectionsStatePagerAdapter(getSupportFragmentManager());
        adapter.addFragment(new HomeFragment(), "HomeFragment");
        adapter.addFragment(new ControlFragment(), "ControlFragment");

        viewPager.setSwipeable(false);
        viewPager.setAdapter(adapter);

    }

    public void setViewPager(int fragmentNumber){
        mViewPager.setCurrentItem(fragmentNumber);
    }




}


