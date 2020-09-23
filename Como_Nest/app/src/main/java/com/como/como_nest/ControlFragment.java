package com.como.como_nest;

import android.graphics.Color;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import me.tankery.lib.circularseekbar.CircularSeekBar;

public class ControlFragment extends Fragment {

    private static final String TAG = "ControlFragment";


    CountDownTimer countDownTimer;

    int command = 0;

    int wheelDirection = 150;
    int wheelDir = 100;

    boolean[] arrayConnectedToStation = new boolean[]{false, false, false, false, false, false, false};
    public static boolean boolConnectedToStation = false;
    boolean connectedToStation = false;

    public static int statusByte = 0x00;
    public static int statusGear = 0x00;

    boolean[] arrayTouchTakeControl = new boolean[]{false, false, false, false, false};
    public static boolean bitTakeControl = false;


    // Widgets
    public static Button btnBat;
    public static Button btnSat;
    public static Button btnTakeControl;

    public static Button btnGear1;
    public static Button btnGear2;
    public static Button btnGear3;
    public static Button btnGearN;
    public static Button btnGearR;
    public static ImageView btnILight;
    public static ImageView btnNLight;

    public static TextView tvBoatWheel;

    public static CircularSeekBar circularSeekBarWheel;

    public static ImageView propeler;

    public static byte[] addrOfBoat = new byte[2];

    public static TextView tvAddressBoat;











    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.control_fragment, container, false);

        btnGear1 = view.findViewById(R.id.btnGear1);
        btnGear2 = view.findViewById(R.id.btnGear2);
        btnGear3 = view.findViewById(R.id.btnGear3);
        btnGearR = view.findViewById(R.id.btnGearR);
        btnGearN = view.findViewById(R.id.btnGearN);
        btnBat = view.findViewById(R.id.btnBat);
        btnSat = view.findViewById(R.id.btnSat);
        btnTakeControl = view.findViewById(R.id.btnTakeControl);
        circularSeekBarWheel = view.findViewById(R.id.circularSeekBar);
        btnNLight = view.findViewById(R.id.btnNLight);
        btnILight = view.findViewById(R.id.btnILight);
        tvBoatWheel = view.findViewById(R.id.boatwheel);

        propeler = view.findViewById(R.id.ivPropeler);
        tvAddressBoat = view.findViewById(R.id.tvAddressBoat);


        tvBoatWheel.setVisibility(View.INVISIBLE);


        addrOfBoat[0] = 0x00;
        addrOfBoat[1] = 0x00;

        propeler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                circularSeekBarWheel.setProgress(100);
                wheelDir = 100;
                wheelDirection = wheelDir + 50;
            }
        });


        btnBat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "onClick: ");
                BatteryDialog dialog = new BatteryDialog();

                dialog.setTargetFragment(ControlFragment.this, 1);
                dialog.show(getFragmentManager(), "MyCustomDialog");

            }
        });

        btnSat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "onClick: ");
                SpeedDialog dialog = new SpeedDialog();

                dialog.setTargetFragment(ControlFragment.this, 1);
                dialog.show(getFragmentManager(), "MyCustomDialog");

            }
        });




        tvBoatWheel.setText(Integer.toString(wheelDirection));
        //seekBarDirection.setMin(50);
        circularSeekBarWheel.setMax(200);
        circularSeekBarWheel.setProgress(100);

        circularSeekBarWheel.setOnSeekBarChangeListener(new CircularSeekBar.OnCircularSeekBarChangeListener() {
            @Override
            public void onProgressChanged(CircularSeekBar circularSeekBar, float progress, boolean fromUser) {

                if(fromUser){
                    wheelDir= Math.round(progress) ;
                    wheelDirection = wheelDir + 50;
                    //tvBoatWheel.setText(Integer.toString(wheelDirection));
                }

            }

            @Override
            public void onStopTrackingTouch(CircularSeekBar seekBar) {

            }

            @Override
            public void onStartTrackingTouch(CircularSeekBar seekBar) {

            }
        });



        countDownTimer = new CountDownTimer(20000, 500) {
            @Override
            public void onTick(long millisUntilFinished) {



                if(BluetoothConnectionService.bluetoothConnected){
                    HomeFragment.btnConnect.setEnabled(false);
                    HomeFragment.btnGetPairedDevices.setEnabled(false);
                    HomeFragment.btnDisconnect.setEnabled(true);
                }
                else{
                    HomeFragment.btnConnect.setEnabled(true);
                    HomeFragment.btnGetPairedDevices.setEnabled(true);
                    HomeFragment.btnDisconnect.setEnabled(false);
                }



                if(MainActivity.mBluetoothAdapter.isEnabled() && MainActivity.mBluetoothConnection != null && BluetoothConnectionService.bluetoothConnected) {

                    if (btnTakeControl.isPressed()) {
                        bitTakeControl = true;
                    } else {
                        bitTakeControl = false;
                    }

                    for (int i = 0; i < 4; i++) {
                        arrayTouchTakeControl[i] = arrayTouchTakeControl[i + 1];
                    }
                    arrayTouchTakeControl[4] = bitTakeControl;

                    if (arrayTouchTakeControl[0] | arrayTouchTakeControl[1] | arrayTouchTakeControl[2] | arrayTouchTakeControl[3]| arrayTouchTakeControl[4]) {
                        statusByte = statusByte | 0x01;
                    } else {
                        statusByte = statusByte & 0xFE;
                    }
                    bitTakeControl = false;


                    if (command == 0) {
                        byte[] bytes = new byte[10];
                        bytes[0] = (byte) 0x21;
                        bytes[1] = (byte) 0x30;
                        bytes[2] = (byte) 0x25;
                        bytes[3] = (byte) addrOfBoat[0];
                        bytes[4] = (byte) addrOfBoat[1];
                        bytes[5] = (byte) 0xC0;
                        bytes[6] = (byte) wheelDirection;
                        bytes[7] = (byte) statusGear;
                        bytes[8] = (byte) statusByte;
                        bytes[9] = (byte) 0x3B;

                        try {
                            MainActivity.mBluetoothConnection.write(bytes);
                        }
                        catch (Exception e){
                            BluetoothConnectionService.bluetoothConnected = false;
                            MainActivity.mBluetoothConnection.resetConnection();
                        }

                        statusByte = 0x00;
                        statusGear = 0x00;
                    }


                    for (int i = 0; i < arrayConnectedToStation.length - 1; i++) {
                        arrayConnectedToStation[i] = arrayConnectedToStation[i + 1];
                    }

                    arrayConnectedToStation[arrayConnectedToStation.length - 1] = boolConnectedToStation;

                    boolConnectedToStation = false;

                    for (int i = 0; i < arrayConnectedToStation.length; i++) {
                        if (arrayConnectedToStation[i]) {
                            connectedToStation = true;
                            break;
                        } else {
                            connectedToStation = false;
                        }
                    }

                    if (connectedToStation) {
                        //HomeFragment.tvConnectToStation.setText("Connected to the station");
                        //HomeFragment.tvConnectToStation.setTextColor(getResources().getColor(R.color.colorDarkGreen));

                        HomeFragment.ivConnectToStation.setSelected(true);

                    } else {
                        /*HomeFragment.tvConnectToBoat.setText("Not connected to the boat");
                        HomeFragment.tvConnectToStation.setText("Not connected to the station");
                        HomeFragment.tvConnectToBoat.setTextColor(Color.RED);
                        HomeFragment.tvConnectToStation.setTextColor(Color.RED);*/
                        HomeFragment.ivConnectToStation.setSelected(false);
                        HomeFragment.ivConnectToBoat.setSelected(false);
                        tvBoatWheel.setText("NaN");
                        btnGear1.setSelected(false);
                        btnGear2.setSelected(false);
                        btnGear3.setSelected(false);
                        btnGearN.setSelected(false);
                        btnGearR.setSelected(false);
                        btnILight.setSelected(false);
                        btnNLight.setSelected(false);

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
                }
                else{

                    /*HomeFragment.tvConnectToBoat.setText("Not connected to the boat");
                    HomeFragment.tvConnectToStation.setText("Not connected to the station");
                    HomeFragment.tvConnectToBoat.setTextColor(Color.RED);
                    HomeFragment.tvConnectToStation.setTextColor(Color.RED);*/
                    HomeFragment.ivConnectToStation.setSelected(false);
                    HomeFragment.ivConnectToBoat.setSelected(false);
                    tvBoatWheel.setText("NaN");
                    btnGear1.setSelected(false);
                    btnGear2.setSelected(false);
                    btnGear3.setSelected(false);
                    btnGearN.setSelected(false);
                    btnGearR.setSelected(false);
                    btnILight.setSelected(false);
                    btnNLight.setSelected(false);
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



            }

            @Override
            public void onFinish() {
                this.start();

            }
        }.start();











        return view;
    }
}
