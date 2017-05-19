using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class SponserEditor : System.Web.UI.Page
    {
         protected void Page_PreRender(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        {
            ContentManager cm = new ContentManager();
            grdSponsor.DataSource = cm.GetAllSponsors();
            grdSponsor.DataBind();

        }

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
            fupLogo.SaveAs(Server.MapPath("~\\images\\Blank.png"));
        }
        else
        {
            fupLogo.SaveAs(Server.MapPath("~\\images\\" + fupLogo.FileName));
        }      
    }
    protected void grdSponsor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int key = Convert.ToInt32(e.Keys["sponsorid"]);
        //Label1.Text = key.ToString();

        ContentManager cm = new ContentManager();
        cm.deleteSponsor(key);
        grdSponsor.DataBind();
        Response.Redirect("SponserEditor.aspx");
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
}
    }
