using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ComoNestJoystickCalibration
{
    public partial class Form1 : Form
    {

        public SerialPort serialPort = new SerialPort();

        long calAdcAvg;
        long calDutyF;
        int calDuty;

        int lLimit;
        int rLimit;
        int dir;

        int setLLimit;
        int setRLimit;
        int setDir;
        int difference;

        public Form1()
        {
            InitializeComponent();

            try
            {
                serialPort.DataBits = 8;
                serialPort.Parity = Parity.None;
                serialPort.StopBits = StopBits.One;
                serialPort.BaudRate = 115200;
                serialPort.PortName = Properties.Settings.Default.PortSave;

                serialPort.Handshake = Handshake.None;
                serialPort.RtsEnable = true;

                serialPort.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);

                serialPort.ReadTimeout = 500;
                serialPort.WriteTimeout = 500;

                serialPort.Open();
                textBoxPort.Text = "Port is open";
                textBoxPort.ForeColor = Color.SeaGreen;
                comboBoxPort.Text = Properties.Settings.Default.PortSave;

                //cbPort.DropDownStyle = ComboBoxStyle.DropDownList;

                textBoxPort.Text = "Port is open";
                textBoxPort.ForeColor = Color.SeaGreen;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Set COM Port");
                textBoxPort.Text = "Port is closed";
                textBoxPort.ForeColor = Color.Maroon;

                textBoxPort.Text = "Port is closed";
                textBoxPort.ForeColor = Color.Maroon;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string a = Application.StartupPath;

            try
            {
                string[] ArrayComPortsNames = null;
                int index = -1;
                comboBoxPort.Items.Clear();

                ArrayComPortsNames = SerialPort.GetPortNames();
                string ComPortName = null;

                do
                {
                    index += 1;
                    comboBoxPort.Items.Add(ArrayComPortsNames[index]);

                }
                while (!((ArrayComPortsNames[index] == ComPortName) || (index == ArrayComPortsNames.GetUpperBound(0))));
            }
            catch (Exception)
            {
                MessageBox.Show("Nothing is plugin");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (serialPort.IsOpen == true)
                {
                    serialPort.Close();
                    textBoxPort.Text = "Port is closed";
                    textBoxPort.ForeColor = Color.Maroon;

                    textBoxPort.Text = "Port is closed";
                    textBoxPort.ForeColor = Color.Maroon;
                }
                else
                {
                    serialPort.DataBits = 8;
                    serialPort.Parity = Parity.None;
                    serialPort.StopBits = StopBits.One;
                    serialPort.BaudRate = 115200;
                    serialPort.PortName = comboBoxPort.Text;

                    serialPort.Handshake = Handshake.None;
                    serialPort.RtsEnable = true;

                    serialPort.ReadTimeout = 500;
                    serialPort.WriteTimeout = 500;

                    serialPort.Open();
                    textBoxPort.Text = "Port is open";
                    textBoxPort.ForeColor = Color.SeaGreen;

                    textBoxPort.Text = "Port is open";
                    textBoxPort.ForeColor = Color.SeaGreen;

                    Properties.Settings.Default.PortSave = comboBoxPort.Text;
                    Properties.Settings.Default.Save();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Choose COM Port");
            }
        }


        private bool startReceivingData = false;
        private uint bytes_counter = 0;
        private byte[] receivedBytes = new byte[18];
        private uint length_received_bytes = 0;



        public void DataReceivedHandler(
                       object sender,
                       SerialDataReceivedEventArgs e)
        {
            try
            {
                SerialPort sp = (SerialPort)sender;
                int length = sp.BytesToRead;
                byte[] buf = new byte[length];
                sp.Read(buf, 0, length);

                Console.WriteLine("");

                for (int i = 0; i < buf.Length; i++)
                {
                    Console.Write("[" + bytes_counter.ToString() + "]" + buf[i].ToString("X") + " ");

                    if ((buf[0] == 0x21) && !startReceivingData)
                    {
                        startReceivingData = true;
                        bytes_counter = 0;
                        length_received_bytes = 0;
                        for (int z = 0; z < 18; z++)
                        {
                            receivedBytes[z] = 0;
                        }
                    }

                    else if ((buf[i] == 0x3B) && (startReceivingData == true))
                    {
                        startReceivingData = false;
                        receivedBytes[bytes_counter] = buf[i];
                        bytes_counter = 0;



                        if ((receivedBytes[0] == 0x21) && (receivedBytes[1] == 0x51) && (receivedBytes[16] == 0x3B))
                        {
                            

                            calAdcAvg = (receivedBytes[2] << 16) + (receivedBytes[3] << 8) + (receivedBytes[4]);
                            calDutyF = (receivedBytes[5] << 16) + (receivedBytes[6] << 8) + (receivedBytes[7]);
                            calDuty = receivedBytes[8];

                            lLimit = (receivedBytes[9] << 8) + receivedBytes[10];
                            rLimit = (receivedBytes[11] << 8) + receivedBytes[12];
                            dir = receivedBytes[13];

                            difference = (receivedBytes[14] << 8) + receivedBytes[15];

                        }

                        


                        for (int z = 0; z < 18; z++)
                        {
                            receivedBytes[z] = 0;
                        }



                    }

                    if (startReceivingData)
                    {
                        receivedBytes[bytes_counter] = buf[i];
                        if ((receivedBytes[0] == 0x21))
                        {
                            bytes_counter++;
                        }
                        else
                        {
                            startReceivingData = false;
                            bytes_counter = 0;
                            length_received_bytes = 0;
                            for (int z = 0; z < 18; z++)
                            {
                                receivedBytes[z] = 0;
                            }
                        }

                        if (bytes_counter >= 17)
                        {
                            startReceivingData = false;
                            bytes_counter = 0;
                            length_received_bytes = 0;
                            for (int z = 0; z < 18; z++)
                            {
                                receivedBytes[z] = 0;
                            }
                        }



                    }


                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception Receive: - " + ex.ToString());
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            
            try
            {
                textBoxADCAverageRead.Text = (((float)calAdcAvg) / ((float)100)).ToString();
                textBoxDutyF.Text = (((float)calDutyF) / ((float)100)).ToString();
                textBoxDuty.Text = calDuty.ToString();

                textBoxLeftLimit.Text = lLimit.ToString();
                textBoxRightLimit.Text = rLimit.ToString();
                textBoxDir.Text = dir.ToString();

                textBoxDifference.Text = difference.ToString();

                if (serialPort.IsOpen)
                {
                    byte[] dataForSend = new byte[6];
                    byte[] data1 = new byte[6];

                    dataForSend[0] = 0x21;
                    dataForSend[1] = 0x41;
                    dataForSend[2] = 0x30;
                    dataForSend[3] = 0x30;
                    dataForSend[4] = 0x30;
                    dataForSend[5] = 0x3B;


                    data1[0] = Convert.ToByte(dataForSend[0]);
                    data1[1] = Convert.ToByte(dataForSend[1]);    // adresa
                    data1[2] = Convert.ToByte(dataForSend[2]);   //naredba

                    data1[3] = Convert.ToByte(dataForSend[3]);
                    data1[4] = Convert.ToByte(dataForSend[4]);



                    data1[5] = Convert.ToByte(dataForSend[5]);

                    serialPort.Write(data1, 0, data1.Length);
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void buttonSetLeft_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textBoxSetLeftLimit.Text) && int.TryParse(textBoxSetLeftLimit.Text, out setLLimit) && (setLLimit >= 1 && setLLimit <= 4095))
            {
                byte[] dataForSend = new byte[6];
                byte[] data1 = new byte[6];



                dataForSend[0] = 0x21;
                dataForSend[1] = 0x42;
                dataForSend[2] = Convert.ToByte((setLLimit >> 8) & 0xFF);
                dataForSend[3] = Convert.ToByte(setLLimit & 0xFF);
                dataForSend[4] = 0x30;
                dataForSend[5] = 0x3B;


                data1[0] = Convert.ToByte(dataForSend[0]);
                data1[1] = Convert.ToByte(dataForSend[1]);    // adresa
                data1[2] = Convert.ToByte(dataForSend[2]);   //naredba

                data1[3] = Convert.ToByte(dataForSend[3]);
                data1[4] = Convert.ToByte(dataForSend[4]);



                data1[5] = Convert.ToByte(dataForSend[5]);

                serialPort.Write(data1, 0, data1.Length);

            }
            else
            {
                MessageBox.Show("Invalid Left Limit Value");
            }
            

        }

        private void buttonSetRight_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(textBoxSetRightLimit.Text) && int.TryParse(textBoxSetRightLimit.Text, out setRLimit) && (setRLimit >= 1 && setRLimit <= 4095))
            {
                byte[] dataForSend = new byte[6];
                byte[] data1 = new byte[6];



                dataForSend[0] = 0x21;
                dataForSend[1] = 0x43;
                dataForSend[2] = Convert.ToByte((setRLimit >> 8) & 0xFF);
                dataForSend[3] = Convert.ToByte(setRLimit & 0xFF);
                dataForSend[4] = 0x30;
                dataForSend[5] = 0x3B;


                data1[0] = Convert.ToByte(dataForSend[0]);
                data1[1] = Convert.ToByte(dataForSend[1]);    // adresa
                data1[2] = Convert.ToByte(dataForSend[2]);    //naredba

                data1[3] = Convert.ToByte(dataForSend[3]);
                data1[4] = Convert.ToByte(dataForSend[4]);



                data1[5] = Convert.ToByte(dataForSend[5]);

                serialPort.Write(data1, 0, data1.Length);

            }
            else
            {
                MessageBox.Show("Invalid Right Limit Value");
            }

        }

        private void buttonSetDir_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(numericUpDown1.Value.ToString()) && int.TryParse(numericUpDown1.Value.ToString(), out setDir) && (setDir >= 0 && setDir <= 1))
            {
                byte[] dataForSend = new byte[6];
                byte[] data1 = new byte[6];



                dataForSend[0] = 0x21;
                dataForSend[1] = 0x44;
                dataForSend[2] = Convert.ToByte(setDir & 0xFF);
                dataForSend[3] = 0x30;
                dataForSend[4] = 0x30;
                dataForSend[5] = 0x3B;


                data1[0] = Convert.ToByte(dataForSend[0]);
                data1[1] = Convert.ToByte(dataForSend[1]);    // adresa
                data1[2] = Convert.ToByte(dataForSend[2]);    //naredba

                data1[3] = Convert.ToByte(dataForSend[3]);
                data1[4] = Convert.ToByte(dataForSend[4]);



                data1[5] = Convert.ToByte(dataForSend[5]);

                serialPort.Write(data1, 0, data1.Length);

            }
            else
            {
                MessageBox.Show("Invalid Right Limit Value");
            }

        }
    }
}
