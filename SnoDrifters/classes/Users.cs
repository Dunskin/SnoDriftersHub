using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SnoDrifters.classes
{
    public class Users
    {
        public string UserName { get; set; }
        public string OldPassWord { get; set; }
        public string NewPassWord { get; set; }

        public Users(string userName, string oldPassWord, string newPassWord)
        {
            UserName = userName;
            OldPassWord = oldPassWord;
            NewPassWord = newPassWord;
        }
    }
}