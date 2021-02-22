namespace ComoBoatsNestAddressing
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
            this.labeComoBoats = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBoxPort = new System.Windows.Forms.ComboBox();
            this.buttonPort = new System.Windows.Forms.Button();
            this.numericUpDownAddress = new System.Windows.Forms.NumericUpDown();
            this.buttonSetAddress = new System.Windows.Forms.Button();
            this.buttonExit = new System.Windows.Forms.Button();
            this.textBoxPort = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.numericUpDownChannel = new System.Windows.Forms.NumericUpDown();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.labelFreq = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownAddress)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownChannel)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // labeComoBoats
            // 
            this.labeComoBoats.AutoSize = true;
            this.labeComoBoats.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labeComoBoats.Location = new System.Drawing.Point(13, 13);
            this.labeComoBoats.Name = "labeComoBoats";
            this.labeComoBoats.Size = new System.Drawing.Size(240, 46);
            this.labeComoBoats.TabIndex = 0;
            this.labeComoBoats.Text = "ComoBoats";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(6, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(173, 46);
            this.label1.TabIndex = 1;
            this.label1.Text = "Address";
            // 
            // comboBoxPort
            // 
            this.comboBoxPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBoxPort.FormattingEnabled = true;
            this.comboBoxPort.Location = new System.Drawing.Point(465, 12);
            this.comboBoxPort.Name = "comboBoxPort";
            this.comboBoxPort.Size = new System.Drawing.Size(215, 44);
            this.comboBoxPort.TabIndex = 2;
            // 
            // buttonPort
            // 
            this.buttonPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonPort.Location = new System.Drawing.Point(465, 63);
            this.buttonPort.Name = "buttonPort";
            this.buttonPort.Size = new System.Drawing.Size(215, 46);
            this.buttonPort.TabIndex = 3;
            this.buttonPort.Text = "Open/Close\r\nPort";
            this.buttonPort.UseVisualStyleBackColor = true;
            this.buttonPort.Click += new System.EventHandler(this.buttonPort_Click);
            // 
            // numericUpDownAddress
            // 
            this.numericUpDownAddress.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numericUpDownAddress.Location = new System.Drawing.Point(209, 22);
            this.numericUpDownAddress.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
            this.numericUpDownAddress.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericUpDownAddress.Name = "numericUpDownAddress";
            this.numericUpDownAddress.Size = new System.Drawing.Size(172, 45);
            this.numericUpDownAddress.TabIndex = 4;
            this.numericUpDownAddress.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.numericUpDownAddress.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // buttonSetAddress
            // 
            this.buttonSetAddress.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSetAddress.Location = new System.Drawing.Point(14, 73);
            this.buttonSetAddress.Name = "buttonSetAddress";
            this.buttonSetAddress.Size = new System.Drawing.Size(367, 79);
            this.buttonSetAddress.TabIndex = 5;
            this.buttonSetAddress.Text = "Set Nest";
            this.buttonSetAddress.UseVisualStyleBackColor = true;
            this.buttonSetAddress.Click += new System.EventHandler(this.buttonSetAddress_Click);
            // 
            // buttonExit
            // 
            this.buttonExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonExit.Location = new System.Drawing.Point(476, 365);
            this.buttonExit.Name = "buttonExit";
            this.buttonExit.Size = new System.Drawing.Size(204, 79);
            this.buttonExit.TabIndex = 6;
            this.buttonExit.Text = "Exit";
            this.buttonExit.UseVisualStyleBackColor = true;
            this.buttonExit.Click += new System.EventHandler(this.buttonExit_Click);
            // 
            // textBoxPort
            // 
            this.textBoxPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxPort.Location = new System.Drawing.Point(465, 119);
            this.textBoxPort.Name = "textBoxPort";
            this.textBoxPort.Size = new System.Drawing.Size(215, 41);
            this.textBoxPort.TabIndex = 7;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 78);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(175, 46);
            this.label2.TabIndex = 8;
            this.label2.Text = "Channel";
            // 
            // numericUpDownChannel
            // 
            this.numericUpDownChannel.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numericUpDownChannel.Location = new System.Drawing.Point(230, 78);
            this.numericUpDownChannel.Maximum = new decimal(new int[] {
            31,
            0,
            0,
            0});
            this.numericUpDownChannel.Name = "numericUpDownChannel";
            this.numericUpDownChannel.Size = new System.Drawing.Size(159, 45);
            this.numericUpDownChannel.TabIndex = 9;
            this.numericUpDownChannel.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.numericUpDownChannel.Value = new decimal(new int[] {
            23,
            0,
            0,
            0});
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.numericUpDownAddress);
            this.groupBox1.Controls.Add(this.buttonSetAddress);
            this.groupBox1.Location = new System.Drawing.Point(21, 175);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(387, 165);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Nest Adressing";
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(35, 365);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(367, 79);
            this.button1.TabIndex = 11;
            this.button1.Text = "Set As Repeater";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // labelFreq
            // 
            this.labelFreq.AutoSize = true;
            this.labelFreq.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelFreq.Location = new System.Drawing.Point(222, 126);
            this.labelFreq.Name = "labelFreq";
            this.labelFreq.Size = new System.Drawing.Size(174, 46);
            this.labelFreq.TabIndex = 12;
            this.labelFreq.Text = "433MHz";
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(692, 456);
            this.Controls.Add(this.labelFreq);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.numericUpDownChannel);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxPort);
            this.Controls.Add(this.buttonExit);
            this.Controls.Add(this.buttonPort);
            this.Controls.Add(this.comboBoxPort);
            this.Controls.Add(this.labeComoBoats);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownAddress)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownChannel)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labeComoBoats;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBoxPort;
        private System.Windows.Forms.Button buttonPort;
        private System.Windows.Forms.NumericUpDown numericUpDownAddress;
        private System.Windows.Forms.Button buttonSetAddress;
        private System.Windows.Forms.Button buttonExit;
        private System.Windows.Forms.TextBox textBoxPort;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown numericUpDownChannel;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label labelFreq;
        private System.Windows.Forms.Timer timer1;
    }
}

