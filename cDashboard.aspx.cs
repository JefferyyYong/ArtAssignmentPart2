using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtAssignment
{
    public partial class cDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void wishListBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WishList.aspx");
        }

        protected void purchaseHistoryBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PurchaseHistory.aspx");
        }

        protected void viewProductBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/product.aspx");
        }
    }
}