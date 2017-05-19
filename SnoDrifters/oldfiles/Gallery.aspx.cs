using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Gallery g = new Gallery();
            List<Media> m = g.getMediaByAlbumId(Convert.ToInt32(ddlSelectAlbum.SelectedValue));
            grdViewMedia.DataSource = m;
            grdViewMedia.DataBind();
        }
    }
}