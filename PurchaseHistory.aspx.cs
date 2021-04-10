using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtAssignment
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddSessionOrderId(object source, RepeaterCommandEventArgs e)
        {
            Session.Add("orderID", e.CommandArgument);
        }
    }
}