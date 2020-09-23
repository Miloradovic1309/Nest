package com.como.como_nest;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

public class NewAddressDialog extends DialogFragment {



    public static EditText etName;
    public static EditText etAddress;

    public static Button btnOk;
    public static Button btnCancel;


    public static boolean openedDialog = false;



    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_newaddress, container, false);

        etName = view.findViewById(R.id.editTextName);
        etAddress = view.findViewById(R.id.editTextAddress);

        btnOk = view.findViewById(R.id.btnOk);
        btnCancel = view.findViewById(R.id.btnCancel);



        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(!etName.getText().toString().equals("") && !etAddress.getText().toString().equals("")) {

                    try {
                        String boatName = etName.getText().toString();
                        int boatAddress = Integer.parseInt(etAddress.getText().toString());


                        HomeFragment.boats.add(new Boats(boatName, boatAddress));
                        HomeFragment.boatsText.add("Name: " + boatName + "\n" + "Address: " + boatAddress);

                        String databaseStringCommand = "INSERT INTO newBoats (name, address) VALUES (\'" + boatName + "\'," + boatAddress + ")";

                        MainActivity.eventsDB.execSQL(databaseStringCommand);
                        getDialog().dismiss();
                    }
                    catch (Exception e){
                        Toast.makeText(getContext(), "Wrong input!", Toast.LENGTH_SHORT).show();
                    }
                }
                else{
                    Toast.makeText(getContext(), "Wrong input!", Toast.LENGTH_SHORT).show();
                }

            }
        });

        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openedDialog = false;
                getDialog().dismiss();
            }
        });



        return view;
    }



}
