using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace SnoDrifters
{
    public partial class BackendLogin : System.Web.UI.Page
    {
        string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
             con = new SqlConnection(conString);
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select * from Login where userName='"+userName.Text+"' and password='"+passWord.Text+"'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                Session["userName"] = dr["userName"].ToString();
                Response.Redirect("AdminPagehome.aspx");
            }

            con.Close();                                   
        }        
    }
}