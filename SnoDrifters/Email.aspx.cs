using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace SnoDrifters
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //try
            //{
                MailMessage feedBack = new MailMessage();
                feedBack.To.Add("p_t_d25@hotmail.com");
                feedBack.From = new MailAddress("SnoDriftersSent@gmail.com");
                feedBack.Subject = txtSubject.Text;

                feedBack.Body = "Sender Name: " + txtName.Text + "<br><br>Sender Email: " + txtMail.Text + "<br><br>" + txtMessage.Text;
                feedBack.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential("snodrifterssent@gmail.com", "Established69");
                //Or your Smtp Email ID and Password
                smtp.Send(feedBack);
                Label1.Text = "Thanks for contacting us";
            //}
            //catch
            //{
                
            //}
        }
    }
}