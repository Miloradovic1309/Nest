package com.como.como_nest;

import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

public class SpeedDialog extends DialogFragment {

    public static ImageView imgSpeedTurtle;
    public static ImageView imgSpeedRabbit;
    public static ImageView imgSpeedLeopard;
    private Button btnSpeedClose;

    public static boolean openedSpeedDialog = false;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_speed, container, false);

        imgSpeedTurtle = view.findViewById(R.id.speedTurtle);
        imgSpeedRabbit = view.findViewById(R.id.speedRabbit);
        imgSpeedLeopard = view.findViewById(R.id.speedLeopard);
        btnSpeedClose = view.findViewById(R.id.btnSpeedClose);

        openedSpeedDialog = true;






        btnSpeedClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openedSpeedDialog = false;
                getDialog().dismiss();
            }
        });









        return view;
    }
}
