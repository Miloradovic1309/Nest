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

namespace ComoBoatsNestAddressing
{
    public partial class Form1 : Form
    {
        SerialPort serialPort = new SerialPort();
        public Form1()
        {
            InitializeComponent();

            try
            {
                serialPort.DataBits = 8;
                serialPort.Parity = Parity.None;
                serialPort.StopBits = StopBits.One;
                serialPort.BaudRate = 9600;
                serialPort.PortName = Properties.Settings.Default.PortSave;

                serialPort.Handshake = Handshake.None;
                serialPort.RtsEnable = true;

                //serialPort.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);

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

        private void buttonPort_Click(object sender, EventArgs e)
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
                    serialPort.BaudRate = 9600;
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

        private void buttonSetAddress_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] dataForSend = new byte[5];
                byte[] data1 = new byte[5];

                int address;

                address = 0x3F + Convert.ToInt32(numericUpDownAddress.Value);

                dataForSend[0] = Convert.ToByte(address >> 8);
                dataForSend[1] = Convert.ToByte(address);
                dataForSend[2] = 0X3D;
                dataForSend[3] = 0x17;
                dataForSend[4] = 0xC4;


                data1[0] = Convert.ToByte(dataForSend[0]);
                data1[1] = Convert.ToByte(dataForSend[1]);    // adresa
                data1[2] = Convert.ToByte(dataForSend[2]);   //naredba

                data1[3] = Convert.ToByte(dataForSend[3]);
                data1[4] = Convert.ToByte(dataForSend[4]);




                serialPort.Write(data1, 0, data1.Length);
            }
            catch(Exception ex)
            {
                MessageBox.Show("First, open the port");
            }
        }
    }
}
