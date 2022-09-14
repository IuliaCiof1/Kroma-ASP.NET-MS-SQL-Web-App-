using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoeWebpage
{
    public static class EncDec
    {
        public static string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61,
0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(),
                   CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        public static string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61,
0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(),
                   CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
    }



    public class ConnectionDB
    {
        //public static SqlConnection conn = new SqlConnection("Data Source=" + ";Initial Catalog=Users;Integrated Security=True");

        public static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersConnectionString"].ConnectionString);
    }

    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            lblEmail.Visible = false;
            lblPasword.Visible = false;
            lblPasword.Visible = false;

            //check if string is a valid email regex
            string strRegex = @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z";

            System.Text.RegularExpressions.Regex re = new System.Text.RegularExpressions.Regex(strRegex);

            if (!re.IsMatch(emailInput.Value))
            {
                lblEmail.Visible = true;
                lblEmail.Text = "Adresă de email invalidă.";
            }
            else if (!passInput.Value.Any(char.IsDigit) || !passInput.Value.Any(char.IsLetter))
            {
                lblPasword.Visible = true;
                lblPasword.Text = "Parola trebuie să contină numere și litere.";
            }
            else if (passInput.Value != repassInput.Value)
            {
                lblrePass.Visible = true;
                lblrePass.Text = "Parolele nu se potrivesc.";
            }
            else
            {

                try
                {
                    ConnectionDB.conn.Open();
                    cmd = new SqlCommand("select Email from Users where Email = '" + emailInput.Value + "'", ConnectionDB.conn);

                    dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        lblEmail.Visible = true;
                        lblEmail.Text = "Email deja inregistrat.";
                    }
                    else
                    {
                        try
                        {
                            ConnectionDB.conn.Close();
                            ConnectionDB.conn.Open();
                            cmd = new SqlCommand("insert into Users (Email,Password) values(@email,@pass) ", ConnectionDB.conn);

                            cmd.Parameters.AddWithValue("@email", emailInput.Value.Trim());
                            cmd.Parameters.AddWithValue("@pass", EncDec.Encrypt(passInput.Value.Trim()));

                            cmd.ExecuteNonQuery(); //ExecuteNonQuery() - used for statements that don't return result sets
                            Response.Redirect("Login.aspx");
                        }
                        catch (Exception ex)
                        {
                            lblPasword.Visible = true;
                            lblPasword.Text = "Parola este prea lungă";
                        }

                        finally
                        {
                            ConnectionDB.conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblPasword.Visible = true;
                    lblPasword.Text = "eroare conectare la baza de date" + ex.Message;
                    ConnectionDB.conn.Close();
                }
            }  
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}