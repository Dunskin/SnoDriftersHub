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
    public partial class SnoDriftersMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ContentManager eventContent = new ContentManager();
            List<EventsPic> ev = eventContent.getAllEvents();
            rptIndicators.DataSource = ev;
            rptIndicators.DataBind();
            rptSlides.DataSource = ev;
            rptSlides.DataBind();

            ContentManager sponsorContent = new ContentManager();
            List<Sponsor> sp = sponsorContent.GetAllSponsors();
            rptSponsor.DataSource = sp;
            rptSponsor.DataBind();
        }

<<<<<<< HEAD
        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)

            {
              
                Repeater rptIndicators = e.Item.FindControl("rptIndicators") as Repeater;
                Repeater rptSlides = e.Item.FindControl("rptSlides") as Repeater;

                ContentManager eventContent = new ContentManager();
                List<EventsPic> ev = eventContent.getAllEvents();

                rptIndicators.DataSource = ev;
                rptIndicators.DataBind();

                rptSlides.DataSource = ev;
                rptSlides.DataBind();
            }
        }
=======
>>>>>>> origin/master

        //protected void SendMail()
        //{
        //    // Gmail Address from where you send the mail
        //    var fromAddress = "SnowDriftersSent@gmail.com";
        //    // any address where the email will be sending
        //    var toAddress = "p_t_d25@hotmail.com";
        //    //Password of your gmail address
        //    string fromPassword = "Established69";
        //    // Passing the values and make a email formate to display
        //    string subject = txtSubject.Text.ToString();
        //    string body = "From: " + txtName.Text + "\n";
        //    body += "Email: " + txtEmail.Text + "\n";
        //    body += "Subject: " + txtSubject.Text + "\n";
        //    body += "Question: \n" + txtMessage.Text + "\n";
        //    // smtp settings
        //    var smtp = new System.Net.Mail.SmtpClient();
        //    {
        //        smtp.Host = "smtp.gmail.com";
        //        smtp.Port = 587;
        //        smtp.EnableSsl = true;
        //        smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        //        smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
        //        smtp.Timeout = 20000;
        //    }
        //    // Passing values to smtp object
        //    smtp.Send(fromAddress, toAddress, subject, body);
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //try
        //    //{
        //        //here on button click what will done 
        //        SendMail();                
        //        txtSubject.Text = "";
        //        txtEmail.Text = "";
        //        txtName.Text = "";
        //        txtMessage.Text = "";
        //    //}
        //    //catch (Exception) { }
        //}
    }
}