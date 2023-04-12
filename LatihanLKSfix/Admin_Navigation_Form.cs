using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//using MySql.Data.MySqlClient;

namespace LatihanLKSfix
{
    public partial class Admin_Navigation_Form : Form
    {

        MySqlConnection conn = new MySqlConnection("server=localhost;port=3306;username=root;password=;database=lks");
        ClassFunction f = new ClassFunction();

        public Admin_Navigation_Form()
        {
            InitializeComponent();
        }

        private void btnKelolaUser_Click(object sender, EventArgs e)
        {
            f.OpenChildForm(new Kelola_User_Form(), this.panel2, sender);
        }

        private void btnKelolaObat_Click(object sender, EventArgs e)
        {
            f.OpenChildForm(new Kelola_Obat_Form(), this.panel2, sender);
        }

        private void btnKelolaLaporan_Click(object sender, EventArgs e)
        {
            f.OpenChildForm(new Kelola_Laporan_Form(), this.panel2, sender);
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            f.Cmd("INSERT INTO tbl_log (waktu, aktifitas, Id_User) VALUES (NOW(), 'logout', '" + ClassFunction.Id_User + "')");
            this.Close();
            new Login_Form().Show();
        }

        private void Admin_Navigation_Form_Load(object sender, EventArgs e)
        {
            
            f.ShowData("SELECT a.Id_log, b.Username, a.waktu, a.aktifitas FROM tbl_log a JOIN tbl_user b ON a.Id_User = b.Id_User", dataGridView1);

        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            f.ShowData("SELECT a.Id_log, b.Username, a.waktu, a.aktifitas FROM tbl_log a JOIN tbl_user b ON a.Id_User = b.Id_User WHERE waktu LIKE '%"+dateTimePicker1.Text+"%'", dataGridView1);
        }
    }
}
