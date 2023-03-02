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
    public partial class adminempl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGrid();
              
            }
        }
        private void BindGrid()
        {
            BAL.busslayer userdata = new BAL.busslayer();
            Repeater1.DataSource = userdata.empdata(Convert.ToInt32(Session["Empid"]));
            Repeater1.DataBind();
        }


        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            { 
                ((Label)e.Item.FindControl("Label2")).Visible = false;
                ((Label)e.Item.FindControl("Label3")).Visible = false;
                ((Label)e.Item.FindControl("Label4")).Visible = false;
                ((Label)e.Item.FindControl("Label5")).Visible = false;
                //((Image)e.Item.FindControl("Image2")).Visible = false;
                ((TextBox)e.Item.FindControl("empname")).Visible = true;
                ((TextBox)e.Item.FindControl("empcon")).Visible = true;
                ((TextBox)e.Item.FindControl("empemail")).Visible = true;
                ((DropDownList)e.Item.FindControl("depatList1")).Visible = true;
                //((Image)e.Item.FindControl("Image1")).Visible = true;
                //((FileUpload)e.Item.FindControl("FileUpload1")).Visible = true;
                ((LinkButton)e.Item.FindControl("Linkedit")).Visible=false;
                ((LinkButton)e.Item.FindControl("Linkupdate")).Visible=true;
                ((LinkButton)e.Item.FindControl("Linkcencel")).Visible=true;
                
            }
            if (e.CommandName == "cancel")
            {
                ((Label)e.Item.FindControl("Label2")).Visible = true;
                ((Label)e.Item.FindControl("Label3")).Visible = true;
                ((Label)e.Item.FindControl("Label4")).Visible = true;
                ((Label)e.Item.FindControl("Label5")).Visible = true;
                //((Image)e.Item.FindControl("Image2")).Visible = true;
                ((TextBox)e.Item.FindControl("empname")).Visible = false;
                ((TextBox)e.Item.FindControl("empcon")).Visible = false;
                ((TextBox)e.Item.FindControl("empemail")).Visible = false;
                ((DropDownList)e.Item.FindControl("depatList1")).Visible = false;
                //((Image)e.Item.FindControl("Image1")).Visible = false;
                //((FileUpload)e.Item.FindControl("FileUpload1")).Visible = false;
                ((LinkButton)e.Item.FindControl("Linkedit")).Visible = true;
                ((LinkButton)e.Item.FindControl("Linkupdate")).Visible = false;
                ((LinkButton)e.Item.FindControl("Linkcencel")).Visible = false;
            }
            if (e.CommandName == "update")
            {
                string Empid = ((Label)e.Item.FindControl("label1")).Text;
                string name = ((TextBox)e.Item.FindControl("empname")).Text;
                string contact = ((TextBox)e.Item.FindControl("empcon")).Text;
                string email = ((TextBox)e.Item.FindControl("empemail")).Text;
                string department = ((DropDownList)e.Item.FindControl("depatList1")).SelectedValue;
                //string image = ((Image)e.Item.FindControl("Image1")).ImageUrl;
                //FileUpload FileUp = ((FileUpload)e.Item.FindControl("FileUpload1"));
                //string path = "/images/";
                //if (FileUp.HasFile)
                //{
                //    path += FileUp.FileName;
                //    FileUp.SaveAs(MapPath(path));

                //}
                //else
                //{
                //    Image img = (Image)e.Item.FindControl("Image1");
                //    path = img.ImageUrl;
                //}
                BAL.busslayer objup = new BAL.busslayer();
                int result= objup.adbyup(Convert.ToInt32(Empid),name,contact,email,department)/*,path)*/;

                Response.Redirect("adminempl.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem itm in Repeater1.Items)
            {
                CheckBox chck = itm.FindControl("deletebox") as CheckBox;
                if (chck.Checked)
                {
                    var Label = itm.FindControl("Label1") as Label;
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from regitser where Empid=@Empid",con);
                    cmd.Parameters.AddWithValue("@Empid", int.Parse(Label.Text));
                    int id = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            BindGrid();
        }
    }
}