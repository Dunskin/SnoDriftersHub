using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SnoDrifters
{
    public partial class EventTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ContentManager eventContent = new ContentManager();
            List<EventsPic> ev = eventContent.getAllEvents();
            rptMain.DataSource = ev;
            rptMain.DataBind();
        }

        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptIndicators = e.Item.FindControl("rptIndicators") as Repeater;
                Repeater rptSlides = e.Item.FindControl("rptSlides") as Repeater;

                ContentManager eventContent = new ContentManager();
                List<EventsPic> ev = eventContent.getAllEvents();

                rptIndicators.DataSource = ev;
                rptIndicators.DataBind();
                rptSlides.DataSource = ev;
                rptSlides.DataBind();
            }

        }
    }
}