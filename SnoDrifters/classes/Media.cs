using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Media
    {
        private int _id;
        public int AlbumId { get; set; }

        public int MediaSeq { get; set;  }
        public string MediaLink { get; set;  }
        public string FileType { get;  set; }
        public string Caption { get; set; }
        public DateTime Date { get; set; }

        public Media(int id, int albumId, int mediaSeq, string mediaLink, string fileType, 
            string caption, DateTime date)
        {
            Id = id;
            AlbumId = albumId;
             MediaSeq = mediaSeq;
             MediaLink = mediaLink;
             FileType = fileType;
             Caption = caption;
             Date = date;
        }

        public Media() { }

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Render()
        {
            string renderText = "";
            if (FileType == "Picture")
            {
                renderText = "<img src='./Images/"+MediaLink+"' />";
            }
            else
            {
                renderText = MediaLink;
            }
                return renderText;
        }
    }
