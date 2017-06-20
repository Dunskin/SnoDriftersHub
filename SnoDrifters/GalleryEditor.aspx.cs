using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace SnoDrifters
{
    public partial class GalleryEditor2 : System.Web.UI.Page
    {
        string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].
                ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("BackendLogin.aspx");
            }
        }

        protected void uploadFile_Click(object sender, EventArgs e)
        {
            if (UploadImages.HasFiles)
            {                

                foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                {
                    uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/img/"), uploadedFile.FileName));
                    listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                    
                    SqlConnection con = new SqlConnection(conString);
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText =
                        "Insert into Gallery_2016 (Album_Id, Media_Link, Media_Sequence, Date) Values (@Album_Id, @Media_Link, @Media_Sequence, @Date)";
                    cmd.Parameters.AddWithValue("Album_Id", ddlAlbumsPicture.SelectedValue);
                    cmd.Parameters.AddWithValue("Media_Link", uploadedFile.FileName);
                    cmd.Parameters.AddWithValue("Media_Sequence", "0");
                    cmd.Parameters.AddWithValue("Date", DateTime.Now);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void grdAlbums_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            
            cmd.CommandText =
                "Delete from Gallery_2016 where Album_Id = @Album_Id";
            cmd.Parameters.AddWithValue("Album_Id", e.Keys["Album_Id"].ToString());

            cmd.Connection = con;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();                     
        }


        protected void btnSaveAlbum_Click(object sender, EventArgs e)
        {
            Album a = new Album();
            a.Name = txtAlbumName.Text;
            a.Sequence = Convert.ToInt32(txtAlbumSeq.Text);
            a.Description = txtAlbumDesc.Text;

            Gallery g = new Gallery();
            g.addAlbum(a);
            Response.Redirect(Request.RawUrl);
        }

        protected void btnSavePhoto_Click(object sender, EventArgs e)
        {
            Album a = new Album();
            a.Name = txtAlbumName.Text;
            a.Sequence = Convert.ToInt32(txtAlbumSeq.Text);
            a.Description = txtAlbumDesc.Text;

            Gallery g = new Gallery();
            g.addAlbum(a);
            Response.Redirect(Request.RawUrl);
        }

        protected void grdMedia_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string fileName = e.Values["Media_Link"].ToString();
            if (File.Exists(MapPath("~/" + fileName)))
            {
                File.Delete(MapPath("~/" + fileName));
            }
        }                        
    }
}