using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BAL
{
    public class busslayer
    {
        DAL.datalayer data = new datalayer();
        public int Insert(Userschema.Uschema objSchema)
        {
            try
            {
                return data.regi(objSchema);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataSet log(string email, string password)
        {
            return data.login(email, password);
        }

        public DataSet empdata(int Empid)
        {
            return data.getuser(Empid); 
        }
        public DataSet statustassk()
        {
            return data.tstatus();
        }

        public DataSet reportstatus(int taskid)
        {
            return data.reportstatus(taskid);
        }

        public DataSet taskedit(int taskid)
        {
            return data.edittask(taskid);
        }

        public int taskedit(int taskid ,string status)
        {
           return  data.emptask(taskid,status);
        }

        public int password(int Empid,string password)
        {
            return data.pass(Empid,password);
        }

        public int update(int Empid,string name,string contact,string email,string image)
        {
            return data.adminupdate(Empid,name,contact,email,image);
        }

        public DataSet adshow(int Empid)
        {
            return data.showdata(Empid);
        }

        public DataSet showdpmt()
        {
            return data.showdpartment();
        }
        public int addtemp(Userschema.Uschema obj)
        {
            return data.addtask(obj);
        }

        public DataSet datereport(string sdt,string etd)
        {
            return data.reportdates(sdt,etd);
        }
        public int adbyup(int Empid,string name, string contact,string email,string department/*,string path*/)
        {
            return data.admnbyup(Empid, name, contact, email, department /*path*/);
        }
        public DataSet totalempdash()
        {
            return data.dashtotalemp();
        }
        public DataSet tasktotal()
        {
            return data.totaltask();
        }
        public DataSet tasktouser(string name)
        {
            return data.usertotask(name);
        }
        
        public DataSet CountStatus (string status)
        {
            return data.CountStatus(status);
        }
        public DataSet usercountstatus(string name,string status)
        {
            return data.usercountstatus(name, status);
        }
        public DataSet fatchStatus(string status)
        {
            return data.fatchstatus(status);
        }
        public DataSet userfatchtask(string name,string status)
        {
            return data.userfatchtask(name,status);
        }
        public DataSet empdashtask(string name)
        {
            return data.dashtask(name);
        }

        public DataSet piechart(string dept)
        {
            return data.piechart(dept);
        }
        //public DataSet taskchart(string dept)
        //{
        //    return data.taskchart(dept);    
        //}
    }
}
