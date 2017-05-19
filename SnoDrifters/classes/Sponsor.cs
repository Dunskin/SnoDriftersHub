using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class Sponsor
    {
        public int SponsorId { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string Logo { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        
        public Sponsor() { }

        public Sponsor(int sponsorId, string name, string shortDescription, string logo, string address, string phone, string email, string website)
        {
            SponsorId = sponsorId;
            Name = name;
            ShortDescription = shortDescription;
            Logo = logo;
            Address = address;
            Phone = phone;
            Email = email;
            Website = website;
        }

        public Sponsor(string name, string shortDescription, string logo, string address, string phone, string email, string website)
        {            
            Name = name;
            ShortDescription = shortDescription;
            Logo = logo;
            Address = address;
            Phone = phone;
            Email = email;
            Website = website;
        }

        public Sponsor(string name, string logo, string website)
        {
            Name = name;            
            Logo = logo;            
            Website = website;
        }
}
