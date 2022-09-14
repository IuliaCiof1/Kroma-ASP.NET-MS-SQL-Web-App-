using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoeWebpage
{
    public class Logged
    {
        private static bool logged;

        public static void setLogged(bool loggedd)
        {
            logged = loggedd;
        }

        public static bool isLogged()
        {
            return logged;
        }
    }

    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Email"] != null)
                    inputEmail.Value = Request.Cookies["Email"].Value;

                if (Request.Cookies["Password"] != null)
                    inputPass.Attributes.Add("value", Request.Cookies["Password"].Value);

                if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                    rememberPass.Checked = true;
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectionDB.conn.Open();

                cmd = new SqlCommand("select Email from Users where Email = '"+ inputEmail.Value + "'",ConnectionDB.conn);

                dr = cmd.ExecuteReader();

                if (!dr.Read())
                {
                    lblEmail.Visible = true;
                    lblEmail.Text = "Adresa de email nu există în baza de date.";
                }
                else
                {
                    lblEmail.Visible = false;
                    lblEmail.Visible = false;

                    ConnectionDB.conn.Close();

                    cmd = new SqlCommand("declare @pass nchar(30); set @pass = (select Password from Users where Email = '" + inputEmail.Value + "'); select ltrim(rtrim(@pass))", ConnectionDB.conn);
                    ConnectionDB.conn.Open();

                    string correctPass = Convert.ToString(cmd.ExecuteScalar()); //stores output of cmd in correct pass

                    if (EncDec.Decrypt(correctPass.Trim()) != inputPass.Value)
                    {

                        lblPass.Visible = true;
                        lblPass.Text = "Adresa de email sau parola e incorecta.";
                    }
                    else
                    {
                        ConnectionDB.conn.Close();

                        ConnectionDB.conn.Open();
                        
                        //store the checkbox value in db
                        cmd = new SqlCommand("update Users set Rememberpass=@rememberpass where Email='" + inputEmail.Value + "'", ConnectionDB.conn);


                        int checkedPass = 0;
                        if (rememberPass.Checked)
                        {
                            //stores email and password in a cookie
                            Response.Cookies["Email"].Value = inputEmail.Value;
                            Response.Cookies["Password"].Value = inputPass.Value;

                            //stores into cookie for the next 15 days
                            Response.Cookies["Email"].Expires = DateTime.Now.AddDays(15);
                            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(15);

                            
                            checkedPass = 1;
                        }

                        Logged.setLogged(true);

                        cmd.Parameters.AddWithValue("@rememberpass", Convert.ToInt16(checkedPass));
                        cmd.ExecuteNonQuery();

                        

                        Response.Redirect("Index.aspx");
                    }
                }
        }
            catch (Exception ex)
            {
                lblEmail.Visible = true;
                lblEmail.Text = "eroare" + ex.Message;

            }
            finally
            {
                ConnectionDB.conn.Close();
            }

        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}