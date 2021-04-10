using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ArtAssignment
{
    public partial class WishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "DeleteFromWishList")
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();

                //Delete item from list
                string strDelete = "Delete from WishList where cEmail = '" + Session["email"].ToString() + "' and artID = '" + e.CommandArgument.ToString() + "'";
                SqlCommand cmdSelect = new SqlCommand(strDelete, con);
                cmdSelect.ExecuteNonQuery();
                con.Close();
                Repeater1.DataBind();
            }

            if (e.CommandName.ToString() == "AddOrder")
            {
                Session["orderArtID"] = e.CommandArgument;
                Response.Redirect("Order.aspx");
            }
        }

      
    }
}