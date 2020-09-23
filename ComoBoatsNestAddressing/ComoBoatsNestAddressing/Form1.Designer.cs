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
            this.labeComoBoats = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBoxPort = new System.Windows.Forms.ComboBox();
            this.buttonPort = new System.Windows.Forms.Button();
            this.numericUpDownAddress = new System.Windows.Forms.NumericUpDown();
            this.buttonSetAddress = new System.Windows.Forms.Button();
            this.buttonExit = new System.Windows.Forms.Button();
            this.textBoxPort = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownAddress)).BeginInit();
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
            this.label1.Location = new System.Drawing.Point(12, 66);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(327, 46);
            this.label1.TabIndex = 1;
            this.label1.Text = "Nest Addressing";
            // 
            // comboBoxPort
            // 
            this.comboBoxPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBoxPort.FormattingEnabled = true;
            this.comboBoxPort.Location = new System.Drawing.Point(383, 13);
            this.comboBoxPort.Name = "comboBoxPort";
            this.comboBoxPort.Size = new System.Drawing.Size(215, 44);
            this.comboBoxPort.TabIndex = 2;
            // 
            // buttonPort
            // 
            this.buttonPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonPort.Location = new System.Drawing.Point(383, 63);
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
            this.numericUpDownAddress.Location = new System.Drawing.Point(78, 115);
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
            this.numericUpDownAddress.Size = new System.Drawing.Size(196, 45);
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
            this.buttonSetAddress.Location = new System.Drawing.Point(20, 178);
            this.buttonSetAddress.Name = "buttonSetAddress";
            this.buttonSetAddress.Size = new System.Drawing.Size(368, 79);
            this.buttonSetAddress.TabIndex = 5;
            this.buttonSetAddress.Text = "Set Address";
            this.buttonSetAddress.UseVisualStyleBackColor = true;
            this.buttonSetAddress.Click += new System.EventHandler(this.buttonSetAddress_Click);
            // 
            // buttonExit
            // 
            this.buttonExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonExit.Location = new System.Drawing.Point(394, 178);
            this.buttonExit.Name = "buttonExit";
            this.buttonExit.Size = new System.Drawing.Size(204, 79);
            this.buttonExit.TabIndex = 6;
            this.buttonExit.Text = "Exit";
            this.buttonExit.UseVisualStyleBackColor = true;
            // 
            // textBoxPort
            // 
            this.textBoxPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxPort.Location = new System.Drawing.Point(383, 115);
            this.textBoxPort.Name = "textBoxPort";
            this.textBoxPort.Size = new System.Drawing.Size(215, 41);
            this.textBoxPort.TabIndex = 7;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(610, 270);
            this.Controls.Add(this.textBoxPort);
            this.Controls.Add(this.buttonExit);
            this.Controls.Add(this.buttonSetAddress);
            this.Controls.Add(this.numericUpDownAddress);
            this.Controls.Add(this.buttonPort);
            this.Controls.Add(this.comboBoxPort);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.labeComoBoats);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownAddress)).EndInit();
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
    }
}

