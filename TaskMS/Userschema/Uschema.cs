using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Userschema
{
    public class Uschema
    {
        private string Empid;
        private string name;
        private string contact;
        private string email;
        private string department;
        private string password;
        private int taskid;
       
        private string priority;
        private string title;
        private string description;
        private string sdate;
        private string edate;
        private string status;




        public string Id
        {
            get { return Empid; }
            set { Empid = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Contact
        {
            get { return contact; }
            set { contact = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Department
        {
            get { return department; }
            set { department = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public int Taskid
        {
            get { return taskid; }
            set
            {
                taskid = value;
            }
        }
        
      
       public string Priority
        {
            get { return priority; }
            set { priority = value; }
        }
        public string Title
        {
            get { return title; }
            set
            {
                title = value;
            }
        }
        public string Description
        {
            get { return description; }
            set
            {
                description = value;
            }
        }
        public string sDate
        {
            get { return sdate; }
            set
            {
                sdate = value;
            }
        }
        public string eDate
        {
            get { return edate; }
            set { edate = value; }
        }
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}
