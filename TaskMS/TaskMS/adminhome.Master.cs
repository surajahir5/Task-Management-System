using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class adminhome : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                bindimage();
                emplogin();       
            }

        }

        private void emplogin()
        {
            if (Session["usertype"].Equals("user"))
            {
                Teamembers.Visible = false;
                calender.Visible = false;
               
                assets.Visible = false;
            }
        }


        private void bindimage()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());
            SqlCommand cmd = new SqlCommand("Select regitser.Empid,regitser.image from regitser where Empid= '" + Session["Empid"].ToString() + "'", con);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            for (int i = 0; i < ds.Tables.Count; i++)
            {
                string url = ds.Tables[0].Rows[i]["image"].ToString();
                Image1.ImageUrl = url;
            }
            con.Close();
        }

        protected void overview_Click(object sender, EventArgs e)
        {
            if (Session["usertype"].Equals("user"))
            {
                Response.Redirect("Emp.aspx");
            }
            else
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void Attendance_Click(object sender, EventArgs e)
        {
            if (Session["usertype"].Equals("user"))
            {
                Response.Redirect("dashemptask.aspx");
            }
            else
            {
                Response.Redirect("createtask.aspx");
            }
        }
    }
}