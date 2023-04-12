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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
//using MySql.Data.MySqlClient;

namespace LatihanLKSfix
{
    public partial class Login_Form : Form
    {

        MySqlConnection conn = new MySqlConnection("server=localhost;port=3306;username=root;password=;database=lks");

        ClassFunction f = new ClassFunction();

        public Login_Form()
        {
            InitializeComponent();
        }

        void Login()
        {
            try
            {
                conn.Open();
                MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT Id_User, Nama_User, Tipe_User FROM tbl_user WHERE Username = '" + txtUsername.Text + "' AND Password = '" + txtPassword.Text + "'", conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        ClassFunction.Username = dr["Nama_User"].ToString();
                        ClassFunction.Id_User = dr["Id_User"].ToString();

                        f.Cmd("INSERT INTO tbl_log (waktu, aktifitas, Id_User) VALUES (NOW(), 'login', '" + ClassFunction.Id_User + "')");


                        if (dr["Tipe_User"].ToString() == "Admin")
                        {
                            new Admin_Navigation_Form().Show();
                            this.Hide();
                        }
                        else if (dr["Tipe_User"].ToString() == "Apoteker")
                        {
                            new Kelola_Resep_Form().Show();
                            this.Hide();
                        }
                        else if (dr["Tipe_User"].ToString() == "Kasir")
                        {
                            new Kelola_Transaksi_Form().Show();
                            this.Hide();
                        }
                    }
                }
                else
                {
                    MessageBox.Show("username atau password yang anda masukkan tidak sesuai !", "Informasi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }

        }


        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if( txtUsername.Text == "" || txtPassword.Text == "")
            {
                MessageBox.Show("Semua kolom harap di isi!", "Informasi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                Login();
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            txtPassword.Text = "";
            txtUsername.Text = "";
        }
    }
}
