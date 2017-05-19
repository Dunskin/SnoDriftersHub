using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Album
    {
        private int _id;
        public string Name { get; set; }

        public int Sequence { get; set; }
       
        public string Description { get; set; }

        public Album(int id, string name, int sequence, string description)
        {
            Id = id;
            Name = name;
            Sequence = sequence; 
            Description = description;
        }

        public Album() { }

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
    }
