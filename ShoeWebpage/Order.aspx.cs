using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoeWebpage
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            
            if (telInput.Value.ToString().Length<10 ||!telInput.Value.All(char.IsDigit))
            {
                lblTel.Visible = true;
            }
            else {
                lblTel.Visible = false;
                Response.Redirect("WebForm1.aspx");
                
            }
        }
    }
}