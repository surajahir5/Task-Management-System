using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class report : System.Web.UI.Page
    {
        BAL.busslayer obj = new BAL.busslayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                reporttask();
            }
        }

        private void reporttask()
        {
            Repeater1.DataSource = obj.statustassk();
            Repeater1.DataBind();
        }

        protected void datefilter_Click(object sender, EventArgs e)
        {
           var sdate = Convert.ToDateTime(fromdate.Text).ToString("dd-MM-yyyy");
            var edate = Convert.ToDateTime(todate.Text).ToString("dd-MM-yyyy");
            Repeater1.DataSource = obj.datereport(sdate, edate);
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName== "viewstatus")
            {
                Session["taskid"]= ((Label)e.Item.FindControl("Label1")).Text;
                Response.Redirect("statusview.aspx");
            }
        }
    }
}