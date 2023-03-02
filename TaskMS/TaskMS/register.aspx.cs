using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskMS
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Userschema.Uschema usobj = new Userschema.Uschema();
            usobj.Name = name.Text;
            usobj.Contact=contact.Text;
            usobj.Email=email.Text;
            usobj.Department = dpart.SelectedValue;
            usobj.Password=password.Text;
            BAL.busslayer regbuss = new BAL.busslayer();
            int result = regbuss.Insert(usobj);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Saved Successfully')", true);
            }
        }
    }
}