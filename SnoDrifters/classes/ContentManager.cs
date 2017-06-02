using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


    public class ContentManager
    {

        //public void InsertBasicContentPage(BasicContentPage bcp)
        //{
        //    string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
        //    SqlConnection con = new SqlConnection(conString);
        //    string sql = "INSERT INTO pages(PageTitle) VALUES (@PageTitle);SELECT SCOPE_IDENTITY();";
        //    SqlCommand cmd = new SqlCommand(sql, con);

        //    cmd.Parameters.AddWithValue("PageTitle", bcp.PageTitle);
          
        //    con.Open();
        //    //This will be subPage below
        //    int key =  Convert.ToInt32(cmd.ExecuteScalar());
        //    //con.Close();

        //    sql = "INSERT INTO BasicContentPages(SubPageId, ImageName, PageText, PageId) VALUES (@SubPageId, @ImageName, @PageText, @PageId)";
        //     cmd = new SqlCommand(sql, con);

        //    cmd.Parameters.AddWithValue("SubPageId", key);
        //    cmd.Parameters.AddWithValue("ImageName", bcp.PageImage);
        //    cmd.Parameters.AddWithValue("PageText", bcp.PageText);
        //    cmd.Parameters.AddWithValue("PageId", bcp.PageId);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();


        //}

        public List<Sponsor> GetAllSponsors()
        {

            List<Sponsor> sponsors = new List<Sponsor>();

            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "Select SponsorId, Name, ShortDescription, Logo, Address, Phone, Email, Website from Sponsors";
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = sql;
            cmd.Connection = con;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Sponsor s = new Sponsor();
                s.Name  = reader["Name"].ToString();
                s.SponsorId = Convert.ToInt32(reader["SponsorId"].ToString());
                s.ShortDescription = reader["ShortDescription"].ToString();
                s.Logo = reader["Logo"].ToString();
                s.Address = reader["Address"].ToString();
                s.Phone = reader["Phone"].ToString();
                s.Email = reader["Email"].ToString();
                s.Website = reader["Website"].ToString();

                sponsors.Add(s);
            }

            con.Close();
            return sponsors;
        }

        public void InsertEvent(Events ev)
        {
            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "INSERT INTO Events(day, month, title, description, image, year, location) VALUES ( @day, @month, @title, @description, @image, @year, @location)";
            SqlCommand cmd = new SqlCommand(sql, con);

            //cmd.Parameters.AddWithValue("id", ev.Id);
            cmd.Parameters.AddWithValue("day", ev.Day);
            cmd.Parameters.AddWithValue("month", ev.Month);
            cmd.Parameters.AddWithValue("title", ev.Title);
            cmd.Parameters.AddWithValue("description", ev.Description);
            cmd.Parameters.AddWithValue("image", ev.Image);
            cmd.Parameters.AddWithValue("year", ev.Year);
            cmd.Parameters.AddWithValue("location", ev.Location);

            con.Open();
            
                           
            cmd.ExecuteNonQuery();
            con.Close();
            
        }

        public List<Events> GetAllEvents()
        {

            List<Events> events = new List<Events>();

            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "Select id, day, month, title, description, image, year, location from Events";
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = sql;
            cmd.Connection = con;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Events ev = new Events();
                ev.Id = Convert.ToInt32(reader["id"].ToString());
                ev.Day = Convert.ToInt32(reader["day"].ToString());
                ev.Month = reader["month"].ToString();
                ev.Title = reader["title"].ToString();
                ev.Description = reader["description"].ToString();
                ev.Image = reader["image"].ToString();
                ev.Year = Convert.ToInt32(reader["year"].ToString());
                ev.Location = reader["location"].ToString();
                
                events.Add(ev);
            }

            con.Close();
            return events;
        }

        public List<Events> GetRecentEvents()
        {

            List<Events> events = new List<Events>();

            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "Select top 3 id, day, month, title, description, image, year, location from Events ORDER BY id DESC";
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = sql;
            cmd.Connection = con;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Events ev = new Events();
                ev.Id = Convert.ToInt32(reader["id"].ToString());
                ev.Day = Convert.ToInt32(reader["day"].ToString());
                ev.Month = reader["month"].ToString();
                ev.Title = reader["title"].ToString();
                ev.Description = reader["description"].ToString();
                ev.Image = reader["image"].ToString();
                ev.Year = Convert.ToInt32(reader["year"].ToString());
                ev.Location = reader["location"].ToString();

                events.Add(ev);
            }

            con.Close();
            return events;
        }

        

        public void deleteEvent(int id)
        {
            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "delete from Events where id=@id";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //public void updateEvent(int id, int day, string month, string title, string description, string image, int year, string location)
        public void updateEvent(Events ev)
        {
            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string sql = "update Events set day=@day, month=@month, title=@title, description=@descripion, image=@image, year=@year, location=@location where id=@id";

            SqlCommand cmd = new SqlCommand(sql, con);

            
            cmd.Parameters.AddWithValue("day", ev.Day);
            cmd.Parameters.AddWithValue("month", ev.Month);
            cmd.Parameters.AddWithValue("title", ev.Title);
            cmd.Parameters.AddWithValue("description", ev.Description);
            cmd.Parameters.AddWithValue("image", ev.Image);
            cmd.Parameters.AddWithValue("year", ev.Year);
            cmd.Parameters.AddWithValue("location", ev.Location);
            cmd.Parameters.AddWithValue("id", ev.Id);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void InsertSponsor(Sponsor sp)
        {
            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "INSERT INTO Sponsors(name, shortdescription, logo, address, phone, email, website) VALUES (@name, @shortdescription, @logo, @address, @phone, @email, @website)";
            SqlCommand cmd = new SqlCommand(sql, con);


            cmd.Parameters.AddWithValue("name", sp.Name);
            cmd.Parameters.AddWithValue("shortdescription", sp.ShortDescription);
            cmd.Parameters.AddWithValue("logo", sp.Logo);
            cmd.Parameters.AddWithValue("address", sp.Address);
            cmd.Parameters.AddWithValue("phone", sp.Phone);
            cmd.Parameters.AddWithValue("email", sp.Email);
            cmd.Parameters.AddWithValue("website", sp.Website);

            con.Open();

            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void deleteSponsor(int id)
        {
            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            string sql = "delete from Sponsors where sponsorid=@sponsorid";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("sponsorid", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void updateSponsor(Sponsor sp)
        {
            string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            string sql = "update Sponsors set name=@name, shortdescription=@shortdescription, logo=@logo, address=@address, phone=@phone, email=@email, website=@website where sponsorid=@sponsorid";

            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("name", sp.Name);
            cmd.Parameters.AddWithValue("shortdescription", sp.ShortDescription);
            cmd.Parameters.AddWithValue("logo", sp.Logo);
            cmd.Parameters.AddWithValue("address", sp.Address);
            cmd.Parameters.AddWithValue("phone", sp.Phone);
            cmd.Parameters.AddWithValue("email", sp.Email);
            cmd.Parameters.AddWithValue("website", sp.Website);
            cmd.Parameters.AddWithValue("sponsorid", sp.SponsorId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }
