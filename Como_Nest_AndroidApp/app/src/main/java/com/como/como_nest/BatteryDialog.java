package com.como.como_nest;

import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RadioButton;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

public class BatteryDialog extends DialogFragment {

    private static final String TAG = "BatteryDialog";

    public static Button btnBat1;
    public static Button btnBat2;
    private Button btnClose;
    public static RadioButton radioButtonBat1_25;
    public static RadioButton radioButtonBat1_50;
    public static RadioButton radioButtonBat1_75;
    public static RadioButton radioButtonBat1_100;
    public static RadioButton radioButtonBat2_25;
    public static RadioButton radioButtonBat2_50;
    public static RadioButton radioButtonBat2_75;
    public static RadioButton radioButtonBat2_100;

    public static boolean openedDialog = false;




    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_battery, container, false);

        btnBat1 = view.findViewById(R.id.btnBat1Set);
        btnBat2 = view.findViewById(R.id.btnBat2Set);
        btnClose = view.findViewById(R.id.btnClose);

        radioButtonBat1_25 = view.findViewById(R.id.rbBat1_25);
        radioButtonBat1_50 = view.findViewById(R.id.rbBat1_50);
        radioButtonBat1_75 = view.findViewById(R.id.rbBat1_75);
        radioButtonBat1_100 = view.findViewById(R.id.rbBat1_100);

        radioButtonBat2_25 = view.findViewById(R.id.rbBat2_25);
        radioButtonBat2_50 = view.findViewById(R.id.rbBat2_50);
        radioButtonBat2_75 = view.findViewById(R.id.rbBat2_75);
        radioButtonBat2_100 = view.findViewById(R.id.rbBat2_100);

        openedDialog = true;


        radioButtonBat1_25.setEnabled(false);
        radioButtonBat1_50.setEnabled(false);
        radioButtonBat1_75.setEnabled(false);
        radioButtonBat1_100.setEnabled(false);

        radioButtonBat2_25.setEnabled(false);
        radioButtonBat2_50.setEnabled(false);
        radioButtonBat2_75.setEnabled(false);
        radioButtonBat2_100.setEnabled(false);





/*
        if(MainActivity.boatBattery1){
            BatteryDialog.btnBat1.setBackgroundColor(Color.YELLOW);
        }
        else{
            BatteryDialog.btnBat1.setBackgroundColor(Color.GRAY);
        }

        if(MainActivity.boatBattery2){
            BatteryDialog.btnBat2.setBackgroundColor(Color.YELLOW);
        }
        else{
            BatteryDialog.btnBat2.setBackgroundColor(Color.GRAY);
        }

 */


        btnClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openedDialog = false;
                getDialog().dismiss();
            }
        });

        return view;
    }
}
