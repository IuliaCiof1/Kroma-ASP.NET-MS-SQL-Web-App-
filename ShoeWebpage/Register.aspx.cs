using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoeWebpage
{
    public class ConnectionDB
    {
        public static SqlConnection conn = new SqlConnection("Data Source=" + GetDataSources() + ";Initial Catalog=Users;Integrated Security=True");

        
        private static string GetDataSources()
        {
            string ServerName = Environment.MachineName;
            string data_source = "";

            RegistryView registryView = Environment.Is64BitOperatingSystem ? RegistryView.Registry64 : RegistryView.Registry32;
            
            using(RegistryKey hklm = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, registryView))
            {
                RegistryKey instanceKey = hklm.OpenSubKey(@"SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL", false);

                if (instanceKey != null)
                {
                    foreach (var instanceName in instanceKey.GetValueNames())
                        data_source = data_source + (ServerName + "\\" + instanceName);
                }
            }

            return data_source;
        }
    }

    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    try
            //    {
            //        ConnectionDB.conn.Open();
            //        cmd = new SqlCommand("select Email from Users", ConnectionDB.conn);

            //        dr = cmd.ExecuteReader();

            //        while (dr.Read())
            //        {
                        
            //        }
            //    }
            //}
            
        }

        protected void Unnamed1_Click(object sender, EventArgs e) //buton autentificare
        {
            int validText=0;
            string strRegex = @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z";

            System.Text.RegularExpressions.Regex re = new System.Text.RegularExpressions.Regex(strRegex);

            if (!re.IsMatch(emailInput.Value))
            {
                lblEmail.Visible = true;
            }
            else
            {
                lblEmail.Visible = false;
                validText++;
            }

            if (!passInput.Value.Any(char.IsDigit) || !passInput.Value.Any(char.IsLower) || !passInput.Value.Any(char.IsUpper))
            {
                lblPasword.Visible = true;
                lblPasword.ForeColor = Color.Red;
            }
            else
            {
                lblPasword.Visible = false;
                validText++;
            }

            try
            {
                ConnectionDB.conn.Open();
            }
            catch
            {
                lblPasword.Visible = true;
                lblPasword.Text = "eroare deschidere baza de date";
            }

            if (validText == 2)
            {
                try
                {

                    cmd = new SqlCommand("insert into Users (Email,Password) values(@email,@pass) ", ConnectionDB.conn);

                    cmd.Parameters.AddWithValue("@email", emailInput.Value.Trim());
                    cmd.Parameters.AddWithValue("@pass", passInput.Value.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        Response.Redirect("WebForm1.aspx");
                    }
                    else
                    {
                        lblPasword.Visible = true;
                        lblPasword.Text = "eroare inserare";
                    }
                }
                catch (Exception ex)
                {
                    lblPasword.Visible = true;
                    lblPasword.Text = "email deja inregistrat";
                }

                finally
                {
                    ConnectionDB.conn.Close();
                }
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}