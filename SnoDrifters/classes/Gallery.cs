using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


    public class Gallery
    {
        static string conString;

        public Gallery()
        {
            conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].
                ConnectionString;
        }

        public void addAlbum(Album a)
        {   
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText =
                "Insert into GalleryAlbum_2016 (Album_Name, Album_Sequence, Album_Description) Values (@Album_Name, @Album_Sequence, @Album_Description)";
            cmd.Parameters.AddWithValue("Album_Name", a.Name);
            cmd.Parameters.AddWithValue("Album_Sequence", a.Sequence);
            cmd.Parameters.AddWithValue("Album_Description", a.Description);
            cmd.Connection = con;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void editAlbum(Album a)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText =
                "Update GalleryAlbum_2016 Set Album_Name = @Album_Name, Album_Sequence = @Album_Sequence, Album_Description = @Album_Description WHERE Album_Id = @Album_Id";
            cmd.Parameters.AddWithValue("@Album_Name", a.Name);
            cmd.Parameters.AddWithValue("@Album_Sequence", a.Sequence);
            cmd.Parameters.AddWithValue("@Album_Description", a.Description);
            cmd.Parameters.AddWithValue("@Album_Id", a.Id);
            cmd.Connection = con;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void addMedia(Media m)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = 
                "Insert into Gallery_2016 (Album_Id, Media_Sequence, Media_Link, File_Type, Caption, Date) Values (@Album_Id, @Media_Sequence, @Media_Link, @File_Type, @Caption, @Date)";
            cmd.Parameters.AddWithValue("Album_Id", m.AlbumId);
            cmd.Parameters.AddWithValue("Media_Sequence", m.MediaSeq);
            cmd.Parameters.AddWithValue("Media_Link", m.MediaLink);
            cmd.Parameters.AddWithValue("File_Type", m.FileType);
            cmd.Parameters.AddWithValue("Caption", m.Caption);
            cmd.Parameters.AddWithValue("Date", m.Date);
            cmd.Connection = con;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void editMedia(Media m)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText =
                "Update Gallery_2016 Set Media_Sequence = @Media_Sequence, Media_Link = @Media_Link, Caption = @Caption Where Media_Id = @Media_Id";
            cmd.Parameters.AddWithValue("@Media_Sequence", m.MediaSeq);
            cmd.Parameters.AddWithValue("@Media_Link", m.MediaLink);
            cmd.Parameters.AddWithValue("@Caption", m.Caption);
            cmd.Connection = con;

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public List<Media> getMediaByAlbumId(int albumId)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText =
                "Select Media_Id, Album_Id, Media_Link, File_Type,Caption, Date From Gallery_2016 WHERE Album_Id=@albumId";

            cmd.Parameters.AddWithValue("albumId", albumId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            List<Media> media = new List<Media>();

            while (reader.Read())
            {
                Media m = new Media(Convert.ToInt32(reader["Media_id"]), 
                    Convert.ToInt32(reader["Album_Id"]),
                    Convert.ToInt32(reader["Media_Sequence"]),
                    reader["Media_link"].ToString(),
                    reader["File_Type"].ToString(),
                    reader["Caption"].ToString(),
                    Convert.ToDateTime(reader["Date"]));

                media.Add(m);
            }

            con.Close();
            return media;            
        }
    }
