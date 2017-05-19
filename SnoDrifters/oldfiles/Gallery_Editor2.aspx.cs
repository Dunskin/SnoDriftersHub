using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class Gallery_Editor2 : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gallery_Editor1.aspx");
        }

        protected void btnSaveAlbum_Click(object sender, EventArgs e)
        {
            Album a = new Album();
            a.Id = Convert.ToInt32(ddlSelectAlbum1.SelectedValue);
            a.Name = txtAlbumName.Text;
            //a.Sequence = Convert.ToInt32(txtAlbumSeq.Text);
            a.Description = txtAlbumDesc.Text;

            Gallery g = new Gallery();
            g.editAlbum(a);            
        }

        protected void btnSelectPic_Click(object sender, EventArgs e)
        {
            //Opens Pictures
        }

        protected void btnSavePic_Click(object sender, EventArgs e)
        {
            Media m = new Media();
            //p.MediaSeq = Convert.ToInt32(txtPicSequence.Text);
            //p.PicLink = FileName;
            m.Caption = txtPicCap.Text;

            Gallery g = new Gallery();
            g.editMedia(m);
        }

        protected void btnSaveVid_Click(object sender, EventArgs e)
        {
            Media m = new Media();
            //m.MediaSeq = Convert.ToInt32(txtVidSequence.Text);
            m.MediaLink = txtURL.Text;
            m.Caption = txtVidCap.Text;

            Gallery g = new Gallery();
            g.editMedia(m);
        }
    }
    }
