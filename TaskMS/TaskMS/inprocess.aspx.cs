using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class inprocess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                bindinprocess();
               
            }
        }

        

        private void bindinprocess()
        {
            BAL.busslayer obj = new BAL.busslayer();
            Repeater1.DataSource = obj.fatchStatus(Session["status"].ToString());
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach(RepeaterItem item in Repeater1.Items)
            {
                Label value = item.FindControl("Label6") as Label;
                if (value.Text == "Complete")
                {
                    value.BackColor = System.Drawing.Color.White; value.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    value.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}