namespace ComoNestJoystickCalibration
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.comboBoxPort = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.labelComoBoats = new System.Windows.Forms.Label();
            this.labelADCAverageRead = new System.Windows.Forms.Label();
            this.textBoxADCAverageRead = new System.Windows.Forms.TextBox();
            this.textBoxDutyF = new System.Windows.Forms.TextBox();
            this.labelDutyFloat = new System.Windows.Forms.Label();
            this.textBoxDuty = new System.Windows.Forms.TextBox();
            this.labelDutyInt = new System.Windows.Forms.Label();
            this.buttonSetLeft = new System.Windows.Forms.Button();
            this.buttonSetRight = new System.Windows.Forms.Button();
            this.textBoxPort = new System.Windows.Forms.TextBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxLeftLimit = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxRightLimit = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBoxDir = new System.Windows.Forms.TextBox();
            this.textBoxSetLeftLimit = new System.Windows.Forms.TextBox();
            this.textBoxSetRightLimit = new System.Windows.Forms.TextBox();
            this.buttonSetDir = new System.Windows.Forms.Button();
            this.textBoxDifference = new System.Windows.Forms.TextBox();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.SuspendLayout();
            // 
            // comboBoxPort
            // 
            this.comboBoxPort.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.comboBoxPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBoxPort.FormattingEnabled = true;
            this.comboBoxPort.Location = new System.Drawing.Point(711, 12);
            this.comboBoxPort.Name = "comboBoxPort";
            this.comboBoxPort.Size = new System.Drawing.Size(193, 33);
            this.comboBoxPort.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(711, 52);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(193, 75);
            this.button1.TabIndex = 1;
            this.button1.Text = "Open/Close Port";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // labelComoBoats
            // 
            this.labelComoBoats.AutoSize = true;
            this.labelComoBoats.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelComoBoats.Location = new System.Drawing.Point(12, 28);
            this.labelComoBoats.Name = "labelComoBoats";
            this.labelComoBoats.Size = new System.Drawing.Size(618, 46);
            this.labelComoBoats.TabIndex = 2;
            this.labelComoBoats.Text = "ComoBoats Joystick Calibration";
            // 
            // labelADCAverageRead
            // 
            this.labelADCAverageRead.AutoSize = true;
            this.labelADCAverageRead.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelADCAverageRead.Location = new System.Drawing.Point(11, 136);
            this.labelADCAverageRead.Name = "labelADCAverageRead";
            this.labelADCAverageRead.Size = new System.Drawing.Size(230, 36);
            this.labelADCAverageRead.TabIndex = 3;
            this.labelADCAverageRead.Text = "ADC Avg Read";
            // 
            // textBoxADCAverageRead
            // 
            this.textBoxADCAverageRead.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxADCAverageRead.Location = new System.Drawing.Point(291, 131);
            this.textBoxADCAverageRead.Name = "textBoxADCAverageRead";
            this.textBoxADCAverageRead.ReadOnly = true;
            this.textBoxADCAverageRead.Size = new System.Drawing.Size(203, 45);
            this.textBoxADCAverageRead.TabIndex = 4;
            // 
            // textBoxDutyF
            // 
            this.textBoxDutyF.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxDutyF.Location = new System.Drawing.Point(291, 182);
            this.textBoxDutyF.Name = "textBoxDutyF";
            this.textBoxDutyF.ReadOnly = true;
            this.textBoxDutyF.Size = new System.Drawing.Size(203, 34);
            this.textBoxDutyF.TabIndex = 6;
            // 
            // labelDutyFloat
            // 
            this.labelDutyFloat.AutoSize = true;
            this.labelDutyFloat.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDutyFloat.Location = new System.Drawing.Point(12, 185);
            this.labelDutyFloat.Name = "labelDutyFloat";
            this.labelDutyFloat.Size = new System.Drawing.Size(130, 29);
            this.labelDutyFloat.TabIndex = 5;
            this.labelDutyFloat.Text = "Duty Float";
            // 
            // textBoxDuty
            // 
            this.textBoxDuty.Font = new System.Drawing.Font("Microsoft Sans Serif", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxDuty.ForeColor = System.Drawing.Color.MidnightBlue;
            this.textBoxDuty.Location = new System.Drawing.Point(291, 443);
            this.textBoxDuty.Name = "textBoxDuty";
            this.textBoxDuty.ReadOnly = true;
            this.textBoxDuty.Size = new System.Drawing.Size(203, 75);
            this.textBoxDuty.TabIndex = 8;
            // 
            // labelDutyInt
            // 
            this.labelDutyInt.AutoSize = true;
            this.labelDutyInt.Font = new System.Drawing.Font("Microsoft Sans Serif", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelDutyInt.ForeColor = System.Drawing.Color.MidnightBlue;
            this.labelDutyInt.Location = new System.Drawing.Point(5, 446);
            this.labelDutyInt.Name = "labelDutyInt";
            this.labelDutyInt.Size = new System.Drawing.Size(244, 69);
            this.labelDutyInt.TabIndex = 7;
            this.labelDutyInt.Text = "Duty Int";
            // 
            // buttonSetLeft
            // 
            this.buttonSetLeft.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetLeft.Location = new System.Drawing.Point(582, 238);
            this.buttonSetLeft.Name = "buttonSetLeft";
            this.buttonSetLeft.Size = new System.Drawing.Size(190, 34);
            this.buttonSetLeft.TabIndex = 9;
            this.buttonSetLeft.Text = "Set\r\nLeft";
            this.buttonSetLeft.UseVisualStyleBackColor = true;
            this.buttonSetLeft.Click += new System.EventHandler(this.buttonSetLeft_Click);
            // 
            // buttonSetRight
            // 
            this.buttonSetRight.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetRight.Location = new System.Drawing.Point(582, 278);
            this.buttonSetRight.Name = "buttonSetRight";
            this.buttonSetRight.Size = new System.Drawing.Size(190, 34);
            this.buttonSetRight.TabIndex = 10;
            this.buttonSetRight.Text = "Set\r\nRight";
            this.buttonSetRight.UseVisualStyleBackColor = true;
            this.buttonSetRight.Click += new System.EventHandler(this.buttonSetRight_Click);
            // 
            // textBoxPort
            // 
            this.textBoxPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxPort.Location = new System.Drawing.Point(711, 133);
            this.textBoxPort.Name = "textBoxPort";
            this.textBoxPort.ReadOnly = true;
            this.textBoxPort.Size = new System.Drawing.Size(193, 34);
            this.textBoxPort.TabIndex = 12;
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 250;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 241);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(119, 29);
            this.label1.TabIndex = 13;
            this.label1.Text = "Left Limit";
            // 
            // textBoxLeftLimit
            // 
            this.textBoxLeftLimit.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxLeftLimit.Location = new System.Drawing.Point(164, 238);
            this.textBoxLeftLimit.Name = "textBoxLeftLimit";
            this.textBoxLeftLimit.ReadOnly = true;
            this.textBoxLeftLimit.Size = new System.Drawing.Size(203, 34);
            this.textBoxLeftLimit.TabIndex = 14;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 281);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(137, 29);
            this.label2.TabIndex = 15;
            this.label2.Text = "Right Limit";
            // 
            // textBoxRightLimit
            // 
            this.textBoxRightLimit.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxRightLimit.Location = new System.Drawing.Point(164, 278);
            this.textBoxRightLimit.Name = "textBoxRightLimit";
            this.textBoxRightLimit.ReadOnly = true;
            this.textBoxRightLimit.Size = new System.Drawing.Size(203, 34);
            this.textBoxRightLimit.TabIndex = 16;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(12, 370);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 29);
            this.label3.TabIndex = 17;
            this.label3.Text = "Dir";
            // 
            // textBoxDir
            // 
            this.textBoxDir.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxDir.Location = new System.Drawing.Point(164, 367);
            this.textBoxDir.Name = "textBoxDir";
            this.textBoxDir.ReadOnly = true;
            this.textBoxDir.Size = new System.Drawing.Size(203, 34);
            this.textBoxDir.TabIndex = 18;
            // 
            // textBoxSetLeftLimit
            // 
            this.textBoxSetLeftLimit.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxSetLeftLimit.Location = new System.Drawing.Point(373, 238);
            this.textBoxSetLeftLimit.Name = "textBoxSetLeftLimit";
            this.textBoxSetLeftLimit.Size = new System.Drawing.Size(203, 34);
            this.textBoxSetLeftLimit.TabIndex = 19;
            // 
            // textBoxSetRightLimit
            // 
            this.textBoxSetRightLimit.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxSetRightLimit.Location = new System.Drawing.Point(373, 278);
            this.textBoxSetRightLimit.Name = "textBoxSetRightLimit";
            this.textBoxSetRightLimit.Size = new System.Drawing.Size(203, 34);
            this.textBoxSetRightLimit.TabIndex = 20;
            // 
            // buttonSetDir
            // 
            this.buttonSetDir.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetDir.Location = new System.Drawing.Point(582, 367);
            this.buttonSetDir.Name = "buttonSetDir";
            this.buttonSetDir.Size = new System.Drawing.Size(190, 34);
            this.buttonSetDir.TabIndex = 22;
            this.buttonSetDir.Text = "Set\r\n";
            this.buttonSetDir.UseVisualStyleBackColor = true;
            this.buttonSetDir.Click += new System.EventHandler(this.buttonSetDir_Click);
            // 
            // textBoxDifference
            // 
            this.textBoxDifference.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxDifference.Location = new System.Drawing.Point(164, 318);
            this.textBoxDifference.Name = "textBoxDifference";
            this.textBoxDifference.ReadOnly = true;
            this.textBoxDifference.Size = new System.Drawing.Size(203, 34);
            this.textBoxDifference.TabIndex = 23;
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numericUpDown1.Location = new System.Drawing.Point(374, 368);
            this.numericUpDown1.Maximum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(120, 34);
            this.numericUpDown1.TabIndex = 24;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(12, 321);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(133, 29);
            this.label4.TabIndex = 25;
            this.label4.Text = "Difference";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(916, 595);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.numericUpDown1);
            this.Controls.Add(this.textBoxDifference);
            this.Controls.Add(this.buttonSetDir);
            this.Controls.Add(this.textBoxSetRightLimit);
            this.Controls.Add(this.textBoxSetLeftLimit);
            this.Controls.Add(this.textBoxDir);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBoxRightLimit);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxLeftLimit);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxPort);
            this.Controls.Add(this.buttonSetRight);
            this.Controls.Add(this.buttonSetLeft);
            this.Controls.Add(this.textBoxDuty);
            this.Controls.Add(this.labelDutyInt);
            this.Controls.Add(this.textBoxDutyF);
            this.Controls.Add(this.labelDutyFloat);
            this.Controls.Add(this.textBoxADCAverageRead);
            this.Controls.Add(this.labelADCAverageRead);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.comboBoxPort);
            this.Controls.Add(this.labelComoBoats);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "-*";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxPort;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label labelComoBoats;
        private System.Windows.Forms.Label labelADCAverageRead;
        private System.Windows.Forms.TextBox textBoxADCAverageRead;
        private System.Windows.Forms.TextBox textBoxDutyF;
        private System.Windows.Forms.Label labelDutyFloat;
        private System.Windows.Forms.TextBox textBoxDuty;
        private System.Windows.Forms.Label labelDutyInt;
        private System.Windows.Forms.Button buttonSetLeft;
        private System.Windows.Forms.Button buttonSetRight;
        private System.Windows.Forms.TextBox textBoxPort;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxLeftLimit;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxRightLimit;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxDir;
        private System.Windows.Forms.TextBox textBoxSetLeftLimit;
        private System.Windows.Forms.TextBox textBoxSetRightLimit;
        private System.Windows.Forms.Button buttonSetDir;
        private System.Windows.Forms.TextBox textBoxDifference;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.Label label4;
    }
}

