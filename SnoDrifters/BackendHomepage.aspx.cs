using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SnoDrifters
{
    public partial class BackendHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userName"] == null)
            {
                Response.Redirect("BackendLogin.aspx");
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }
    }
}