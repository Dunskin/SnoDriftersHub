using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



    public class EventsPic
    {
    private int _id;  
        public int Day { get; set; }
        public string Month { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int Year { get; set; }
        public string Location { get; set; }
        public string MediaLink { get; set; }
        public string FileType { get; set; }

      public EventsPic(int id, int day, string month, int year, string title, string description,
          string location, string mediaLink, string filetype)
            {
                Id = id;
                Day = day;
                Month = month;
                Title = title;
                Description = description;
                Year = year;
                Location = location;
                MediaLink = mediaLink;
                FileType = FileType;
            }
            public EventsPic() { }

            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }
            public string Render()
            {
                string renderText = "";
                if (FileType.Trim() == "Picture")
                {
                    renderText = "<img src='./img/" + MediaLink + "' />";
                }
                else
                {
                    renderText = MediaLink;
                }
                return renderText;
            }

            public string RenderForCarousel()
            {
                string renderText = "";
                if (FileType.Trim() == "Picture")
                {
                    renderText = @"<div class='fill' 
         style='background-color:#48c3af; 
         background-image:url(./img/"+MediaLink+");'></div>";
                }
                else
                {
                    renderText = MediaLink;
                }
                return renderText;
            }
    }
    

