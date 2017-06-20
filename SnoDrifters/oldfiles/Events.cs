using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Events
    {
        public int Id { get; set; }
        public int Day { get; set; }
        public string Month { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public int Year { get; set; }
        public string Location { get; set; }

        public Events() { }

        public Events(int id, int day, string month, int year,string title, string description, string image, string location)
        {
            Id = id;
            Day = day;
            Month = month;
            Title = title;
            Description = description;
            Image = image;
            Year = year;
            Location = location;
        }

        public Events(int day, string month, int year, string title, string description, string image, string location)
        {
            
            Day = day;
            Month = month;
            Title = title;
            Description = description;
            Image = image;
            Year = year;
            Location = location;
        }
    }
