using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class dashemptask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.Page.IsPostBack)
            {
                taskdashemp();
            }
        }

        private void taskdashemp()
        {
            BAL.busslayer obj = new BAL.busslayer();
            Repeteremptask.DataSource = obj.empdashtask(Session["name"].ToString());
            Repeteremptask.DataBind();
        }

        protected void Repeteremptask_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "editdata")
            {
                //Session["name"] = ((Label)e.Item.FindControl("Label4")).Text;
                Session["taskid"] = ((Label)e.Item.FindControl("Label1")).Text;
                Response.Redirect("updatetask.aspx");
            }
        }
    }
}