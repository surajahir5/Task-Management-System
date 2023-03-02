using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class adpass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());
        string str = null;
        SqlCommand com;
        byte up;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            str = "select * from regitser where Empid='" + Session["Empid"].ToString() + "'";
            com = new SqlCommand(str, con);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                if (oldpass.Text == dr["password"].ToString())
                {
                    up = 1;
                }
            }
            dr.Close();
            con.Close();
            if(up == 1)
            {
                BAL.busslayer boj = new BAL.busslayer();
                string password = newpass.Text;
                int results = boj.password(Convert.ToInt32(Session["Empid"]), password);
                if (results > 0)
                {
                    Response.Write("<script>alert('Password changed Successfully')</script>");
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Please enter correct Old password')</script>");
            }
        }
    }
}