using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace TaskMS
{
    public partial class createtask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Select_department();
            }
        }
        private void Select_department()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet result = obj.showdpmt();
            DropDownList1.DataSource = result;
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add("--Please Select Department--");
            DropDownList1.DataTextField = "department";
            DropDownList1.DataBind();
           
        }
        private void Select_name()
        {
            string a = DropDownList1.SelectedValue;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());
            SqlCommand cmd = new SqlCommand("select name from regitser where department='" + a + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            emplist.DataSource = dr;
            emplist.Items.Clear();
            emplist.DataTextField = "name";
            emplist.DataBind();
            con.Close();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Select_name();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var sdate = Convert.ToDateTime(std.Text).ToString("dd-MM-yyyy");
            var edate = Convert.ToDateTime(tdate.Text).ToString("dd-MM-yyyy");
            Userschema.Uschema objemp = new Userschema.Uschema();
            objemp.Department = DropDownList1.SelectedValue;
            objemp.Name = emplist.SelectedValue;
            objemp.Priority = taskprioty.SelectedValue;
            objemp.Title = tasktitle.Text;
            objemp.Description = describ.Text;
            objemp.sDate =sdate;
            objemp.eDate =edate;
            BAL.busslayer newobj = new BAL.busslayer();
            int result = newobj.addtemp(objemp);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Saved Successfully')", true);
            }
        }
    }
}