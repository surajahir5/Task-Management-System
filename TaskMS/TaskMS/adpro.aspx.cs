using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class adpro : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                adminupdate();
            }
        }

        private void adminupdate()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet result = obj.adshow(Convert.ToInt32(Session["Empid"]));
            DataSet dt = new DataSet();
            dt = result;
            if (dt.Tables[0].Rows.Count > 0)
            {
                upname.Text = result.Tables[0].Rows[0]["name"].ToString();
                upcontact.Text = result.Tables[0].Rows[0]["contact"].ToString();
                upemail.Text = result.Tables[0].Rows[0]["email"].ToString();

                Image1.ImageUrl = result.Tables[0].Rows[0]["image"].ToString();
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BAL.busslayer objadmin = new BAL.busslayer();
            string name = upname.Text;
            string contact = upcontact.Text;
            string email = upemail.Text;
            string image = Image1.ImageUrl;
            string path = "~/images/";
            if (adprofile.PostedFile.FileName == "")
            {
                path = image;
            }
            else
            {
                string strpath = Path.GetExtension(adprofile.FileName);
                if (strpath != ".jpg" && strpath != ".jpeg" && strpath != ".png")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Only images files Allowed(jpg,jpeg,png) !')", true);
                }
                else
                {
                    path += adprofile.FileName;
                    adprofile.SaveAs(Server.MapPath(path));
                }
            }
            int results = objadmin.update(Convert.ToInt32(Session["Empid"]), name, contact, email, path);
            if (results > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Uploaded Successfully')", true);
                Response.Redirect("adpro.aspx");
            }
        }
    }
}