//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class Gallery_Editor1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditAlbum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gallery_Editor2.aspx");
        }

        protected void btnEditMedia_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gallery_Editor2.aspx");
        }

        protected void btnCreateAlbum_Click(object sender, EventArgs e)
        {
            Album a = new Album();
            a.Name = txtAlbumName.Text;
            a.Sequence = 0;
            a.Description = " ";

            Gallery g = new Gallery();
            g.addAlbum(a);
        }

        protected void btnSavePic_Click(object sender, EventArgs e)
        {
            if (fupImage.FileName == "")
            {
                fupImage.SaveAs(Server.MapPath("~\\images\\Blank.png"));
            }
            else
            {
                fupImage.SaveAs(Server.MapPath("~\\images\\" + fupImage.FileName));
            }

            Media m = new Media();
            m.AlbumId = Convert.ToInt32(ddlSelectAlbum1.SelectedValue);
            //m.MediaSeq = Convert.ToInt32(txtPicSequence.Text);
            m.MediaLink = fupImage.FileName;
            m.FileType = "Picture";
            m.Caption = txtPicCap.Text;
            m.Date = DateTime.Now;

            Gallery g = new Gallery();
            g.addMedia(m);

            //Image Scaling
            int maxWidth = 300;
            int maxHeight = 300;

            var image = System.Drawing.Image.FromFile(Server.MapPath("~\\images\\" + fupImage.FileName));
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);
            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);
            var newImage = new Bitmap(newWidth, newHeight);

            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            image.Dispose();

            FileStream fs = new FileStream(Server.MapPath("~\\images\\" + fupImage.FileName),
                FileMode.Create);

            newImage.Save(fs, ImageFormat.Png);

            fs.Dispose();
            newImage.Dispose();
        }

        protected void btnInsertVid_Click(object sender, EventArgs e)
        {
            Media m = new Media();
            m.AlbumId = Convert.ToInt32(ddlSelectAlbum2.SelectedValue);
            //m.MediaSeq = Convert.ToInt32(txtVidSequence.Text);
            m.MediaLink = txtURL.Text;
            m.FileType = "Video";
            m.Caption = txtVidCap.Text;
            m.Date = DateTime.Now;

            Gallery g = new Gallery();
            g.addMedia(m);
        }

        protected void btnUploadVid_Click(object sender, EventArgs e)
        {
            //Goto YouTube
            //try
            {
                //System.Diagnostics.Process.Start("https://www.youtube.com/?hl=en&gl=CA");
                Response.Redirect("https://www.youtube.com/?hl=en&gl=CA");
            }
           // catch { }
        }

        protected void btnSelectVid_Click(object sender, EventArgs e)
        {
            //Goto Channel Upload
            //try
            {
               // System.Diagnostics.Process.Start("https://www.youtube.com/upload");
                Response.Redirect("https://www.youtube.com/upload");
            }
            //catch { }
        }
    }
}