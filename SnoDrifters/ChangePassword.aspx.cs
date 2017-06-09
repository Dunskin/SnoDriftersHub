using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SnoDrifters.classes;

namespace SnoDrifters
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PasswordButton_Click(object sender, EventArgs e)
        {
            if(NewPassword.Text==NewPasswordConfirmed.Text)
            {
                ContentManager cm = new ContentManager();
                string userName = UserName.Text;
                string oldPass = OldPassword.Text;
                string newPass = NewPassword.Text;
                Users us = new Users(userName, oldPass, newPass);
                cm.updatePassword(us);
            }
            else
            {
                
            }
        }
    }
}