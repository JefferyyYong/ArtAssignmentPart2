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
    public partial class productDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void productDetailPage_ItemCommand(object source, FormViewCommandEventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            if (e.CommandName.ToString() == "WishListAdd")
            {
                con.Open();
                //Check the exist itme in the list
                SqlCommand cmd = new SqlCommand("select * from WishList where cEmail= '" + Session["email"] + "' and artID=" + e.CommandArgument.ToString(), con);

                SqlDataReader myReader = cmd.ExecuteReader();

                if (myReader.Read())
                {
                    Response.Write("<script language=javascript>alert('This item already added in your wish list')</script>");
                }

                else
                {
                    myReader.Close();
                    //Add new item
                    string strInsert = "insert into WishList values('" + Session["email"].ToString() + "' , '" + e.CommandArgument.ToString() + "' ) ";
                    SqlCommand cmdSelect = new SqlCommand(strInsert, con);
                    cmdSelect.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script language=javascript>alert('Added successfully. You may check your wish list')</script>");
                }

            }

            if (e.CommandName.ToString() == "OrderAdd")
            {
                Session["orderArtID"] = e.CommandArgument;
                Response.Redirect("Order.aspx");
            }

        }
    }
}