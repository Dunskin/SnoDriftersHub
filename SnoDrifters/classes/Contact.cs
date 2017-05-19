using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Contact
/// </summary>
public class Contact
{

    public int Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string City { get; set; }
    public string Province { get; set; }
    public string Country { get; set; }
    public string PostalCode { get; set; }
    public string Address1 { get; set; }
    public string Address2 { get; set; }
    
    public Contact()
	{
		//
		// TODO: Add constructor logic here
		//

	}

    public Contact(int id, string name, string email, string phone, string city, string province, string country, string postalcode, string address1, string address2)
    {
        Id = id;
        Name = name;
        Email = email;
        Phone = phone;
        City = city;
        Province = province;
        Country = country;
        PostalCode = postalcode;
        Address1 = address1;
        Address2 = address2;
    }

    public Contact(string name, string email, string phone, string city, string province, string country, string postalcode, string address1, string address2)
    {
        
        Name = name;
        Email = email;
        Phone = phone;
        City = city;
        Province = province;
        Country = country;
        PostalCode = postalcode;
        Address1 = address1;
        Address2 = address2;
    }
}