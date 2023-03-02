using MySql.Data.MySqlClient.Memcached;
using MySqlX.XDevAPI;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace TaskMS
{
    public partial class forgetpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forget_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString()))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select email,password from regitser where email='" + email.Text.Trim() + "'", con); 
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Close();
                }
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string to = email.Text; //To address
                    string from = "rahulpaljobs@gmail.com"; //From address
                    MailMessage message = new MailMessage(from, to);
                    string mailbody = "Hi Dear, <br/>You are receiving this email because we received a password reset request for your account.<br/><br/>Your Email: " + ds.Tables[0].Rows[0]["email"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["password"] + "<br/><br/>";
                    message.Subject = "Forget Password";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp
                    System.Net.NetworkCredential basicCredential1 = new
                    System.Net.NetworkCredential("rahulpaljobs@gmail.com", "kbvhmihftjmnwquc");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicCredential1;
                    try
                    {
                        client.Send(message);
                        Response.Write("<script>alert('Password has been sent to your email address.');window.location ='../login.aspx';</script>");
                    }

                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    email.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('This email address does not match our records.')</script>");        
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("{0} Exception caught.", ex);
            }
        }
    }
}