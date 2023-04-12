using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LatihanLKSfix
{
    public partial class Kelola_Transaksi_Form : Form
    {
        ClassFunction f = new ClassFunction();
        public Kelola_Transaksi_Form()
        {
            InitializeComponent();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            f.Cmd("INSERT INTO tbl_log (waktu, aktifitas, Id_User) VALUES (NOW(), 'logout', '" + ClassFunction.Id_User + "')");
            this.Close();
            new Login_Form().Show();
        }
    }
}
