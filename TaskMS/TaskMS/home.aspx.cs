using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class home : System.Web.UI.Page
    {
        BAL.busslayer obj = new BAL.busslayer();
        string aspnet, java, php, designer, nodejs;
        string taskasp, taskjava, taskphp, taskdesigner, tasknodejs;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!this.IsPostBack)
            {
                emptotal();
                tasktotal();
                inprocesstask();
                taskcomplete();
                aspnetsum();
                phpsum();
                javasum();
                designersum();
                nodejssum();
                senddata();          
            }
        }

      

        

        private void senddata()
        {
            asp1.Value = aspnet;
            java1.Value = java;
            php1.Value = php;
            designer1.Value = designer;
            nodejs1.Value=nodejs;
        }

        private void taskcomplete()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.CountStatus("Complete");
            if(dt.Tables.Count > 0)
            {
                comptask.Text = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        private void inprocesstask()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.CountStatus("Inprocess");
            if(dt.Tables.Count > 0)
            {
                taskinprocess.Text = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        private void tasktotal()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.tasktotal();
            if(dt.Tables.Count > 0)
            {
                totaltask.Text = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        private void emptotal()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.totalempdash();
            if(dt.Tables[0].Rows.Count > 0)
            {
                totalemp.Text = dt.Tables[0].Rows[0][0].ToString();
            }     
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["status"] = "Complete";
            Response.Redirect("inprocess.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["status"] = "Inprocess";
            Response.Redirect("inprocess.aspx");
        }

        public void aspnetsum()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.piechart("Asp.net");
            if(dt.Tables[0].Rows.Count > 0)
            {
                aspnet = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        public void phpsum()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.piechart("Php");
            if (dt.Tables[0].Rows.Count > 0)
            {
                php = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        public void javasum()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.piechart("java");
            if (dt.Tables[0].Rows.Count > 0)
            {
                java = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        public void designersum()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.piechart("Designer");
            if (dt.Tables[0].Rows.Count > 0)
            {
                designer = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        public void nodejssum()
        {
            BAL.busslayer obj = new BAL.busslayer();
            DataSet dt = obj.piechart("node.js");
            if (dt.Tables[0].Rows.Count > 0)
            {
                nodejs = dt.Tables[0].Rows[0][0].ToString();
            }
        }

        

    }
}