using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class updatetask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                updateemp()
;            }
        }

        private void updateemp()
        {
            BAL.busslayer obj = new BAL.busslayer();
            //string taskid = Request.QueryString["firstname"];
            DataSet dt = obj.taskedit(Convert.ToInt32(Session["taskid"]));
            if(dt.Tables.Count > 0)
            {
                department.Text = dt.Tables[0].Rows[0][1].ToString();
                empname.Text = dt.Tables[0].Rows[0][2].ToString();
                tpriority.Text = dt.Tables[0].Rows[0][3].ToString();
                tittle.Text = dt.Tables[0].Rows[0][4].ToString();
                description.Text = dt.Tables[0].Rows[0][5].ToString();
                sdate.Text = dt.Tables[0].Rows[0][6].ToString();
                edate.Text = dt.Tables[0].Rows[0][7].ToString();
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            BAL.busslayer obj = new BAL.busslayer();
            int result = obj.taskedit(Convert.ToInt32(Session["taskid"]), DropDownstatus.Text);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Task Uploaded Successfully')", true);
            }
            Response.Redirect("Emp.aspx");
        }
    }
}