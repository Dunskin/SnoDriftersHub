using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Data;


namespace SnoDrifters
{
    public partial class EventEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("BackendLogin.aspx");
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (imgEventPic.FileName == "")
            {
                imgEventPic.SaveAs(Server.MapPath("~\\img\\Blank.png"));
            }
            else
            {
                imgEventPic.SaveAs(Server.MapPath("~\\img\\" + imgEventPic.FileName));

            }

            EventsPic newEvent = new EventsPic();
            newEvent.Day = Convert.ToInt32(txtDay.Text);
            newEvent.Month = Convert.ToString(txtMonth.Text);
            newEvent.Title = Convert.ToString(txtEventTitle.Text);
            newEvent.Location = Convert.ToString(txtLocation.Text);
            newEvent.Description = Convert.ToString(txtDescription.Text);
            newEvent.Year = Convert.ToInt32(txtYear.Text);
            newEvent.MediaLink = imgEventPic.FileName;
            newEvent.FileType = "Picture";

            ContentManager cm = new ContentManager();

            cm.InsertNewEvent(newEvent);

            //Image Scaling
            int maxWidth = 300;
            int maxHeight = 300;

            var image = System.Drawing.Image.FromFile(Server.MapPath("~\\img\\" + imgEventPic.FileName));
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);
            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);
            var newImage = new Bitmap(newWidth, newHeight);

            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            image.Dispose();

            FileStream fs = new FileStream(Server.MapPath("~\\img\\" + imgEventPic.FileName),
                FileMode.Create);

            newImage.Save(fs, ImageFormat.Png);

            fs.Dispose();
            newImage.Dispose();
          

        }
    }
    }
