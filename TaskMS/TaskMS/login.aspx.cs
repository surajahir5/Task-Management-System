using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DAL.datalayer obj = new DAL.datalayer();
            DataSet result = obj.login(uname.Text, pass.Text);
            DataSet ds = new DataSet();
            ds = result;
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["Empid"] = ds.Tables[0].Rows[0]["Empid"].ToString();
                Session["email"] = ds.Tables[0].Rows[0]["email"].ToString();
                Session["name"] = ds.Tables[0].Rows[0]["name"].ToString();             
                Session["usertype"] = ds.Tables[0].Rows[0]["usertype"].ToString();
                Session.Timeout = 60;
                if (Session["usertype"].Equals("Admin"))
                {
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Redirect("Emp.aspx");
                }
            }
            else
            {
                Response.Write("<script> alert('Invalid Credentials')</script>");
            }
        }
    }
}