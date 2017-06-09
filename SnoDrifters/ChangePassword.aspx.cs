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
            if (Session["userName"] == null)
            {
                Response.Redirect("BackendLogin.aspx");
            }
        }

        protected void PasswordButton_Click(object sender, EventArgs e)
        {
            if(NewPassword.Text == NewPasswordConfirmed.Text)
            {
                ContentManager cm = new ContentManager();                
                int confirm = cm.updatePassword(UserName.Text, OldPassword.Text, NewPassword.Text);
                if (confirm == 1)
                {
                    UserName.Text = "";
                    OldPassword.Text = "";
                    NewPassword.Text = "";
                    NewPasswordConfirmed.Text = "";
                    StatusLabel.Text = "Password successfully updated!";
                    StatusLabel.Visible = true;
                }
                else
                {
                    OldPassword.Text = "";
                    NewPassword.Text = "";
                    NewPasswordConfirmed.Text = "";
                    StatusLabel.Text = "Username and/or Password are incorrect";
                    StatusLabel.Visible = true;
                }
            }
            else
            {                
                NewPassword.Text = "";
                NewPasswordConfirmed.Text = "";
                StatusLabel.Text = "New passwords dont match";
                StatusLabel.Visible = true;
            }
        }
    }
}