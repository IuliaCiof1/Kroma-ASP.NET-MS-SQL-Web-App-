﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ShoeWebpage
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataReader dr;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            FilterAll_Click(Button1, EventArgs.Empty);

            if (Logged.isLogged())
            {
                dropdownD.Visible = false;
                dropdownDivLogged.Visible = true;
            }
            else
            {
                dropdownD.Visible = true;
                dropdownDivLogged.Visible = false;
            }
        }

        protected void ActiveButton(Button selected)
        {
            foreach (Button btn in filterDiv.Controls.OfType<Button>())
            {
                if (btn == selected)
                    btn.Attributes.Add("class", "button active");
                else
                    btn.Attributes.Add("class", "button");
            }
        }

        protected void ReadDb(SqlDataReader dr)
        {
            while (dr.Read())
            {
                Panel item = new Panel();
                panel.Controls.Add(item);
                item.CssClass = "item";
                var img = new Image
                {
                    ImageUrl = dr["Image"].ToString().Trim()
                };
                item.Controls.Add(img);

                var h3 = new HtmlGenericControl("h3") { InnerText = dr["Price"].ToString() + " LEI" };
                item.Controls.Add(h3);

                var p = new HtmlGenericControl("p") { InnerText = (String)dr["Title"] };
                item.Controls.Add(p);
            }
        }

        protected void FilterAll_Click(object sender, EventArgs e)
        {
            panel.Controls.Clear();
            ActiveButton((Button)sender);

            try
            {
                ConnectionDB.conn.Open();

                cmd = new SqlCommand("select * from Shoes", ConnectionDB.conn);
                
                dr = cmd.ExecuteReader();

                ReadDb(dr);

                ConnectionDB.conn.Close();
            }
            catch (Exception ex)
            {
                lblError.Text = "Eroare conectare la baza de date" + ex.Message;
            }
        }

        protected void FilterAdidas_Click(object sender, EventArgs e)
        {
            panel.Controls.Clear();
            ActiveButton((Button)sender);

            try
            {
                ConnectionDB.conn.Open();

                cmd = new SqlCommand("select * from Shoes where Brand like 'Adidas%'", ConnectionDB.conn);
                dr = cmd.ExecuteReader();

                ReadDb(dr);

                ConnectionDB.conn.Close();
            }
            catch (Exception ex)
            {
                lblError.Text = "Eroare conectare la baza de date" + ex.Message;
            }
        }

        protected void FilterRebook_Click(object sender, EventArgs e)
        {
            panel.Controls.Clear();
            ActiveButton((Button)sender);

            try
            {
                ConnectionDB.conn.Open();

                cmd = new SqlCommand("select * from Shoes where Brand like 'Reebok%'", ConnectionDB.conn);
                dr = cmd.ExecuteReader();
                ReadDb(dr);

                ConnectionDB.conn.Close();
            }
            catch (Exception ex)
            {
                lblError.Text = "Eroare conectare la baza de date" + ex.Message;
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Logged.setLogged(false);
            Response.Redirect("Index.aspx");
        }

    }
}