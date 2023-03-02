using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{

    public partial class statusview : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                reportstatus();
            }
        }

        private void reportstatus()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.reportstatus(Convert.ToInt32(Session["taskid"]));
            DataSet ds = new DataSet();
            ds=dt;
            if (dt.Tables[0].Rows.Count > 0)
            {
                department.Text = dt.Tables[0].Rows[0]["department"].ToString();
                name.Text = dt.Tables[0].Rows[0]["name"].ToString();
                taskpriority.Text = dt.Tables[0].Rows[0]["tpriority"].ToString();
                tasktitle.Text = dt.Tables[0].Rows[0]["title"].ToString();
                descriotion.Text = dt.Tables[0].Rows[0]["tdescription"].ToString();
                startdate.Text = dt.Tables[0].Rows[0]["std"].ToString();
                enddate.Text = dt.Tables[0].Rows[0]["etd"].ToString();
                status.Text = dt.Tables[0].Rows[0]["status"].ToString();
                Image1.ImageUrl = dt.Tables[0].Rows[0]["image"].ToString();
            } 
        }

        protected void download_Click(object sender, EventArgs e)
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.reportstatus(Convert.ToInt32(Session["taskid"]));
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Report.xls"));
            Response.ContentType = "application/ms-excel";
            DataSet ds = new DataSet();
            ds = dt;
            string str = string.Empty;
            foreach (DataColumn column in ds.Tables[0].Columns)
            {
                Response.Write(str + column.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataTable da in ds.Tables)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
            {
                str = "";
                for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
        
        }
    }   
}
