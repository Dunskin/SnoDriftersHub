using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace SnoDrifters.classes
{
    public class Login
    {
        public string UserName { get; set; }
        public string OldPassWord { get; set; }
        public string NewPassWord { get; set; }

        public Login(string userName, string oldPassWord, string newPassWord)
        {
            UserName = userName;
            OldPassWord = oldPassWord;
            NewPassWord = newPassWord;         
        }
    }
}