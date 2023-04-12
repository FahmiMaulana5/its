using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace LatihanLKSfix
{
    internal class ClassFunction
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;port=3306;username=root;password=;database=lks");
        public static Form activateForm;

        public static string Username = "";
        public static string Id_User = "";


        public void OpenChildForm(Form childForm, Panel panel, object btnSender)
        {
            if (activateForm != null)
            {
                activateForm.Close();
            }
            activateForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            panel.Controls.Add(childForm);
            panel.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();

        }

        public void ShowData(string query, DataGridView dg)
        {
            try
            {
                if(conn.State == ConnectionState.Closed) conn.Open();

                MySqlDataAdapter sda = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();

                sda.Fill(dt);

                dg.DataSource = dt;

            }
            catch (Exception ex) {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }

        }

        public void Cmd(string query)
        {
            try
            {
                if(conn.State == ConnectionState.Closed ) conn.Open();

                MySqlCommand cmd = new MySqlCommand(query, conn);

                cmd.ExecuteNonQuery();


            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
       
    }
}
