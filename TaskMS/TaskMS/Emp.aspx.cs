using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class Emp : System.Web.UI.Page
    {
        int totalno = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            usertotaltask();
            countstatus();
            countcomplete();
        }

        private void countcomplete()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.usercountstatus(Session["name"].ToString(), "Complete");
            if (dt.Tables.Count > 0)
            {
                totalno = Convert.ToInt32(dt.Tables[0].Rows[0][0].ToString());
                comptask.Text = Convert.ToString(totalno);
            }
        }

        private void countstatus()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.usercountstatus(Session["name"].ToString(), "Inprocess");
            if(dt.Tables.Count > 0)
            {
                totalno = Convert.ToInt32(dt.Tables[0].Rows[0][0].ToString());
                taskinprocess.Text = Convert.ToString(totalno);
            }
        }

        private void usertotaltask()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.tasktouser(Session["name"].ToString());
            if(dt.Tables.Count > 0)
            {
              totalno   = Convert.ToInt32(dt.Tables[0].Rows[0][0].ToString());
                totaltask.Text = Convert.ToString(totalno);
            }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
          
            Session["status"] = "Inprocess";
            Response.Redirect("userstatus.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["status"] = "Complete";
            Response.Redirect("userstatus.aspx");
        }
    }
}