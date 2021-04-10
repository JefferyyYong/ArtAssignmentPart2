using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;

namespace ArtAssignment
{
    public partial class ArtistAddArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = (string)(Session["email"]);

            hfArtistEmail.Value = email;
        }

        protected void btnCreateArt_Click(object sender, EventArgs e)
        {
            //For image
            int currentArtID;
            FileUpload upImg1 = (FileUpload)fupImage1;

            //Create connection
            SqlConnection con;
            string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(conStr);
            con.Open();

            //Query to insert data
            string queryInsert1 = "INSERT ArtProduct (aEmail, artName, artDescription, artCategory, artUnitPrice, artQuantity)" +
                "VALUES ('" + hfArtistEmail.Value + "', @artName, @artDescription, @artCategory, @artUnitPrice, @artQuantity); SELECT SCOPE_IDENTITY()";


            //Put command into connectionstring(con)
            //SqlCommand cmdSelect = new SqlCommand(queryInsert1, con);
            SqlCommand cmdSelect = new SqlCommand();
            cmdSelect.CommandText = queryInsert1;
            cmdSelect.Connection = con;

            cmdSelect.Parameters.AddWithValue("@artName", txtArtName.Text);
            cmdSelect.Parameters.AddWithValue("@artDescription", txtDescription.Text);
            cmdSelect.Parameters.AddWithValue("@artCategory", ddlCategory.SelectedValue);
            cmdSelect.Parameters.AddWithValue("@artUnitPrice", txtPrice.Text);
            cmdSelect.Parameters.AddWithValue("@artQuantity", txtQuantity.Text);
            currentArtID = Convert.ToInt32(cmdSelect.ExecuteScalar());
            con.Close();

            //***************check selectscopeidentity
            // Query to insert image
            string queryInsert2 = "INSERT ArtImage (artId, image)" +
                "VALUES ('" + currentArtID + "', @image); SELECT SCOPE_IDENTITY()";
            string queryInsert3 = "INSERT ArtImage (artId, image)" +
                "VALUES ('" + currentArtID + "', @image2); SELECT SCOPE_IDENTITY()";
            string queryInsert4 = "INSERT ArtImage (artId, image)" +
                "VALUES ('" + currentArtID + "', @image3); SELECT SCOPE_IDENTITY()";

            if (upImg1.HasFile && upImg1.PostedFile != null)
            {
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(upImg1.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(upImg1.PostedFile.ContentLength);
                }
                cmdSelect.CommandText = queryInsert2;
                cmdSelect.Connection = con;
                cmdSelect.Parameters.AddWithValue("@image", bytes);
                con.Open();
                cmdSelect.ExecuteNonQuery();
                con.Close();
            }

            
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}


