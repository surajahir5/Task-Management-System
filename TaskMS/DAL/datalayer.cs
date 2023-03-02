using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using Userschema;
using System.Data;

namespace DAL
{
    public class datalayer
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["task"].ToString());

        public object BindGrid { get; set; }

        public int regi(Userschema.Uschema objschema)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("userreg", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Insert");
                    cmd.Parameters.AddWithValue("@name", objschema.Name);
                    cmd.Parameters.AddWithValue("@contact", objschema.Contact);
                    cmd.Parameters.AddWithValue("@email", objschema.Email);
                    cmd.Parameters.AddWithValue("@department", objschema.Department);
                    cmd.Parameters.AddWithValue("@password", objschema.Password);
                    cmd.Parameters.AddWithValue("@usertype", "user");
                    cmd.Parameters.AddWithValue("@image", "/images/profile.png");
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    int results = cmd.ExecuteNonQuery();
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }
        public DataSet login(string email,string password)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action" , "login");
            cmd.Parameters.AddWithValue("email" , email);
            cmd.Parameters.AddWithValue("password", password);
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            con.Close();
            return ds;
        }

        public DataSet getuser(int Empid)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("userreg", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "getuser");
                    cmd.Parameters.AddWithValue("@Empid", Convert.ToInt32(Empid));
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public DataSet piechart(string dept)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "chart");    
                    cmd.Parameters.AddWithValue("@department", dept);    
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public DataSet taskchart(string dept)
        //{
        //    try
        //    {
        //        using (SqlCommand cmd = new SqlCommand("taskemp", con))
        //        {
        //            con.Open();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Action", "taskchart");
        //            cmd.Parameters.AddWithValue("@department", dept);
        //            if (con.State.Equals(ConnectionState.Closed)) con.Open();
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataSet dt = new DataSet();
        //            da.Fill(dt);
        //            con.Close();
        //            return dt;
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        public DataSet reportstatus(int taskid)
        {
          SqlCommand cmd=new SqlCommand("taskemp",con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "statusreport");
            cmd.Parameters.AddWithValue("@taskid",taskid);
            if (con.State.Equals(ConnectionState.Closed)) con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public DataSet dashtask(string name)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "showemptask");
                    cmd.Parameters.AddWithValue("@name", name);
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet tstatus()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "taskstatus");
                  
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet edittask(int taskid)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "editemptask");
                    cmd.Parameters.AddWithValue("@taskid",Convert.ToInt32(taskid));        
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet reportdates(string sdt,string etd)
        {

            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "reportdate");
                    cmd.Parameters.AddWithValue("@std", sdt);
                    cmd.Parameters.AddWithValue("@etd",etd);
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int pass(int Empid,string password)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "pass");
            cmd.Parameters.AddWithValue("@Empid",Empid);
            cmd.Parameters.AddWithValue("Password", password);
            if (con.State.Equals(ConnectionState.Closed)) con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            return result;
        }

        public int adminupdate(int Empid,string name,string contact, string email,string image)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "admnupdate");
            cmd.Parameters.AddWithValue("@Empid", Convert.ToInt32(Empid));
            cmd.Parameters.AddWithValue("@name",name);
            cmd.Parameters.AddWithValue("@contact", contact);
            cmd.Parameters.AddWithValue("@email",email);
            cmd.Parameters.AddWithValue("@image",image);
            if (con.State.Equals(ConnectionState.Closed)) con.Open();
            int result = cmd.ExecuteNonQuery();  
            con.Close();
            return result;
        }
        public int emptask(int taskid ,string status) 
        { 
            SqlCommand cmd = new SqlCommand("update emptask set status=@status where taskid=@taskid", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@Action", "upsstask");
            cmd.Parameters.AddWithValue("@taskid", Convert.ToInt32(taskid));
            cmd.Parameters.AddWithValue("@status", status);
            con.Open();
            int result= cmd.ExecuteNonQuery();
            con.Close();
            return result;
            
        }
        public DataSet showdata(int Empid)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg", con);
            cmd.CommandType= CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "show");
            cmd.Parameters.AddWithValue("@Empid",Convert.ToInt32(Empid));
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            return ds;
        }

        public DataSet showdpartment()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "showdpmt");
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            con.Close();
           return ds;
          
        }

        public int addtask(Userschema.Uschema obj)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "inserttask");
                    cmd.Parameters.AddWithValue("@department" ,obj.Department);
                    cmd.Parameters.AddWithValue("@name",obj.Name);
                    cmd.Parameters.AddWithValue("@tpriority", obj.Priority);
                    cmd.Parameters.AddWithValue("@title", obj.Title);
                    cmd.Parameters.AddWithValue("@tdescription",obj.Description);
                    cmd.Parameters.AddWithValue("@std", obj.sDate);
                    cmd.Parameters.AddWithValue("@etd", obj.eDate);
                    cmd.Parameters.AddWithValue("@status", "Pending");
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    int results = cmd.ExecuteNonQuery();
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public int admnbyup(int Empid,string name, string contact,string email,string department/*, string path*/)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "admimnbyup");
            cmd.Parameters.AddWithValue("@Empid", Convert.ToInt32(Empid));
            cmd.Parameters.AddWithValue("@name",name);
            cmd.Parameters.AddWithValue("@contact", contact);
            cmd.Parameters.AddWithValue("@email",email);
            cmd.Parameters.AddWithValue("@department", department);
            //cmd.Parameters.AddWithValue("@image",path);
            if (con.State.Equals(ConnectionState.Closed)) con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            return result;
        }

        public DataSet dashtotalemp()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Dashtotalemp");   
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);  
            con.Close();
            return dt;
        }

        public DataSet totaltask()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("taskemp", con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "tasktotal"); 
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            con.Close();
            return ds;
        }
        public DataSet usertotask(string name)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("taskemp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "usertasktotal");
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            con.Close();
            return ds;
        }
        public DataSet CountStatus(string status)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("taskemp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "CountStatus");
            cmd.Parameters.AddWithValue("@Status", status);
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            con.Close();
            return ds;
        }
        public DataSet usercountstatus(string name,string status)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("taskemp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "countstatususer");
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@Status", status);
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dt.Fill(ds);
            con.Close();
            return ds;
        }
        //public DataSet completetask()
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("taskemp", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@Action", "task");
        //    SqlDataAdapter dt = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    dt.Fill(ds);
        //    con.Close();
        //    return ds;
        //}

        public DataSet fatchstatus(string status)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "fatchStatus");
                    cmd.Parameters.AddWithValue("@status", status);
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataSet userfatchtask(string name,string status)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("taskemp", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "fatchusertask");
                    cmd.Parameters.AddWithValue("@name",name);
                    cmd.Parameters.AddWithValue("@status", status);
                    if (con.State.Equals(ConnectionState.Closed)) con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    con.Close();
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
