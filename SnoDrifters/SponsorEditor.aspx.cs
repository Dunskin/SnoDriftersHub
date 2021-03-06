﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SnoDrifters
{
    public partial class SponsorEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("BackendLogin.aspx");
            }
        }

        protected void grdSponsor_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string fileName = e.Values["Logo"].ToString();
            if (File.Exists(MapPath("~/" + fileName)))
            {
                File.Delete(MapPath("~/" + fileName));
            }
        }
        protected void grdSponsor_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdSponsor.EditIndex = e.NewEditIndex;
            grdSponsor.DataBind();
        }
        protected void grdSponsor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdSponsor.EditIndex = -1;
            grdSponsor.DataBind();
        }
        protected void grdSponsor_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            ContentManager cm = new ContentManager();           


            string name = e.NewValues["Name"].ToString();
            string shortDesc = e.NewValues["ShortDescription"].ToString();
            string logo = e.NewValues["Logo"].ToString();
            string address = e.NewValues["Address"].ToString();
            string phone = e.NewValues["Phone"].ToString();
            string email = e.NewValues["Email"].ToString();
            string website = e.NewValues["Website"].ToString();
            int id = Convert.ToInt32(e.Keys["sponsorid"].ToString());

            Sponsor sp = new Sponsor(id, name, shortDesc, logo, address, phone, email, website);

            cm.updateSponsor(sp);
            grdSponsor.EditIndex = -1;
            grdSponsor.DataBind();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            ContentManager cm = new ContentManager();

            Sponsor sp = new Sponsor(Convert.ToString(txtName.Text), Convert.ToString(txtShortDescription.Text), Convert.ToString(fupLogo.FileName), Convert.ToString(txtAddress.Text),
                    Convert.ToString(txtPhone.Text), Convert.ToString(txtEmail.Text),
                  Convert.ToString(txtWebsite.Text));
            cm.InsertSponsor(sp);

            //fupLogo.SaveAs(Server.MapPath("images/UploadedImages/" + fupLogo.FileName));            
            if (fupLogo.FileName == "")
            {
                //If no picture is provided we give it a blank image (2016 code)
                fupLogo.SaveAs(Server.MapPath("~\\img\\Sponsors\\Blank.png"));
            }
            else
            {                
                fupLogo.SaveAs(Server.MapPath("~\\img\\Sponsors\\" + fupLogo.FileName));
            }

            grdSponsor.DataBind();
        }        
    }
}