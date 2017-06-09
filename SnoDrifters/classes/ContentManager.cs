using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


    public class ContentManager
    {
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

    //Events 
    public void InsertNewEvent(EventsPic e)
    {
        string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(conString);
        string sql = "INSERT INTO EventsPic(day, month, year, title, description, location, medialink, filetype) VALUES ( @day, @month, @year,  @title, @description,  @location, @medialink, @filetype)";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("day", e.Day);
        cmd.Parameters.AddWithValue("month", e.Month);
        cmd.Parameters.AddWithValue("title", e.Title);
        cmd.Parameters.AddWithValue("description", e.Description);
        cmd.Parameters.AddWithValue("year", e.Year);
        cmd.Parameters.AddWithValue("location", e.Location);
        cmd.Parameters.AddWithValue("MediaLink", e.MediaLink);
        cmd.Parameters.AddWithValue("filetype", e.FileType);

        con.Open();

        cmd.ExecuteNonQuery();
        con.Close();

    }

    public List<EventsPic> getAllEvents()

    {
        string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select day, month, title, description, location, year, medialink, filetype From  EventsPic";

        con.Open();

        SqlDataReader reader = cmd.ExecuteReader();

        List<EventsPic> newEventsList = new List<EventsPic>();

        while (reader.Read())
        {
            EventsPic e = new EventsPic();
            e.Day = Convert.ToInt32(reader["day"].ToString());
            e.Month = reader["month"].ToString();
            e.Title = reader["title"].ToString();
            e.Description = reader["description"].ToString();
            e.Location = reader["location"].ToString();
            e.Year = Convert.ToInt32(reader["year"]);
            e.MediaLink = reader["mediaLink"].ToString();
            e.FileType = reader["filetype"].ToString();

            newEventsList.Add(e);
        }
        con.Close();
        return newEventsList;
    }
    public List<EventsPic> GetRecentEvents()
    {
        List<EventsPic> events = new List<EventsPic>();
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
            EventsPic ev = new EventsPic();
            ev.Day = Convert.ToInt32(reader["day"].ToString());
            ev.Month = reader["month"].ToString();
            ev.Title = reader["title"].ToString();
            ev.Description = reader["description"].ToString();
            ev.Location = reader["location"].ToString();
            ev.Year = Convert.ToInt32(reader["year"]);
            ev.MediaLink = reader["mediaLink"].ToString();
            ev.FileType = reader["filetype"].ToString();
            events.Add(ev);
        }

        con.Close();
        return events;
    }
    public void deleteEvent(int id)
    {
        string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);
        string sql = "delete from EventsPic where id=@id";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("id", id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void updatePassword(SnoDrifters.classes.Users us)
    {
        string conString = WebConfigurationManager.ConnectionStrings["snowdriftersdbConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        string sql = "Update Login set passWord='@NewPassword' where userName='@UserName' and passWord='@OldPassword';";

        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("NewPassword", us.NewPassWord);
        cmd.Parameters.AddWithValue("UserName", us.UserName);
        cmd.Parameters.AddWithValue("OldPassWord", us.OldPassWord);      

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
    

    
