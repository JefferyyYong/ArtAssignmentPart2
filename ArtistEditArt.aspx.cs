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
    public partial class EditArt : System.Web.UI.Page
    {
        //Create connection
        SqlConnection con;
        string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int[] tempID = new int[3];

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = (string)(Session["email"]);
            hfArtistEmail.Value = email;

            hfArtID.Value = Request.QueryString["artID"];

            if (!IsPostBack)
            {
                displayArtDetails();
            }
        }

        public void displayArtDetails()
        {
            con = new SqlConnection(conStr);
            con.Open();

            //Query to insert data
            string querySelect1 = "SELECT * FROM ArtProduct WHERE [artID] = '" + hfArtID.Value + "'";

            //Put command into connectionstring(con)
            //SqlCommand cmdSelect = new SqlCommand(queryInsert1, con);
            SqlCommand cmdSelect = new SqlCommand();
            cmdSelect.CommandText = querySelect1;
            cmdSelect.Connection = con;

            using (SqlDataReader reader = cmdSelect.ExecuteReader())
            {
                if (reader.Read())
                {
                    txtArtName.Text = String.Format("{0}", reader["artName"]);
                    txtDescription.Text = String.Format("{0}", reader["artDescription"]);
                    txtPrice.Text = String.Format("{0}", reader["artUnitPrice"]);
                    txtQuantity.Text = String.Format("{0}", reader["artQuantity"]);
                    //ddlCategory.SelectedValue = Request.QueryString["artCategory"];
                    string oriCategory = Request.QueryString["artCategory"];
                    string trimCategory = oriCategory.Trim();
                    ddlCategory.SelectedValue = trimCategory;
                }
            }

            con.Close();

            //For art image
            byte[] bytes;
            string fileName;
            string querySelect2= "SELECT * FROM ArtImage WHERE [artID] = '" + hfArtID.Value + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = querySelect2;
            cmd.Connection = con;
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                bytes = (byte[])sdr["image"];
                fileName = sdr["imageID"].ToString();
                image1.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
            }
            con.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            FileUpload upImg1 = (FileUpload)fupImage1;

            con = new SqlConnection(conStr);
            con.Open();

            //Query to insert data
            string queryUpdate = "UPDATE [ArtProduct] SET[artName] = '" + txtArtName.Text + "', [artDescription] = '"
                + txtDescription.Text + "', [artCategory] = '" + ddlCategory.SelectedValue + "', [artUnitPrice] = '" +
                txtPrice.Text + "', [artQuantity] = '" + txtQuantity.Text + "' WHERE[artID] = '" + hfArtID.Value + "'";

            //Put command into connectionstring(con)
            //SqlCommand cmdSelect = new SqlCommand(queryInsert1, con);
            SqlCommand cmdSelect = new SqlCommand();
            cmdSelect.CommandText = queryUpdate;
            cmdSelect.Connection = con;
            cmdSelect.ExecuteNonQuery();
            con.Close();

            string queryUpdate2 = "UPDATE [ArtImage] SET [image] = @image WHERE[artID] = '" + hfArtID.Value + "'";
            

            if (upImg1.HasFile && upImg1.PostedFile != null)
            {
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(upImg1.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(upImg1.PostedFile.ContentLength);
                }
                cmdSelect.CommandText = queryUpdate2;
                cmdSelect.Connection = con;
                cmdSelect.Parameters.AddWithValue("@image", bytes);
                con.Open();
                cmdSelect.ExecuteScalar();
                con.Close();
            }

            Response.Redirect("~/ArtistArtList.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(conStr);
            con.Open();

            //Query to insert data
            string queryDelete1 = "DELETE FROM[ArtImage] WHERE[artID] = '" + hfArtID.Value + "'";


            //Put command into connectionstring(con)
            //SqlCommand cmdSelect = new SqlCommand(queryInsert1, con);
            SqlCommand cmdSelect = new SqlCommand();
            cmdSelect.CommandText = queryDelete1;
            cmdSelect.Connection = con;
            cmdSelect.ExecuteNonQuery();
            con.Close();

            cmdSelect.Parameters.Clear();
            string queryDelete2 = "DELETE FROM[ArtProduct] WHERE[artID] = '" + hfArtID.Value + "'";
            cmdSelect.CommandText = queryDelete2;
            cmdSelect.Connection = con;
            con.Open();
            cmdSelect.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/ArtistArtList.aspx");
        }
    }
}
