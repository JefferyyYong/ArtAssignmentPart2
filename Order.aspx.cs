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
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);

            if (e.CommandName.ToString() == "Order")
            {
                con.Open();

                string strInsert = "insert into OrderDetails (artID,cEmail)" + "values ('" + e.CommandArgument.ToString() + "' , '" + Session["email"].ToString() + "' )";
                SqlCommand cmdSelect = new SqlCommand(strInsert, con);
                cmdSelect.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/payment.aspx");


            }
        }

    }
}