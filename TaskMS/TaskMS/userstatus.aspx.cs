using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class userstatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            usertaskstatus();
        }

        private void usertaskstatus()
        {
            BAL.busslayer obj = new BAL.busslayer();
            Repeater1.DataSource = obj.userfatchtask(Session["name"].ToString(), Session["status"].ToString());
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                Label value = item.FindControl("Label6") as Label;
                if (value.Text == "Complete")
                {
                    value.BackColor = System.Drawing.Color.Green; value.ForeColor = System.Drawing.Color.White;
                }
                else
                {
                    value.BackColor = System.Drawing.Color.Red; value.ForeColor = System.Drawing.Color.White;
                }
            }
        }
    }
}