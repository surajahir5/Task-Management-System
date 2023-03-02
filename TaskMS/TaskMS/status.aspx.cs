using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               taskstatus();
                
            }
        }

        private void taskstatus()
        {
            BAL.busslayer obj = new BAL.busslayer();
            Repeaterstatus.DataSource = obj.statustassk();
            Repeaterstatus.DataBind();
        }

        protected void Repeaterstatus_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach(RepeaterItem item in Repeaterstatus.Items)
            {
                Label value = item.FindControl("Label6") as Label;
                if (value.Text == "Complete")
                {
                     value.ForeColor=System.Drawing.Color.Green;
                }else if (value.Text=="Pending")
                {
                     value.ForeColor = System.Drawing.Color.BlueViolet;
                }
                else 
                {
                    value.ForeColor = System.Drawing.Color.Red;
                }
                
            }
        }
    }
}