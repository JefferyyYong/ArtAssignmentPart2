using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ArtAssignment
{
    public partial class CustomerRegister : System.Web.UI.Page
    {
        public static string constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cRegisterBtn_Click(object sender, EventArgs e)
        {
            String gender = "";
            if (cGenderBtn1.Checked == true)
            {
                gender = "Male";
            }
            else if (cGenderBtn2.Checked == true)
            {
                gender = "Female";
            }


            if (cPassword.Text == cComfirmPass.Text)
            {

                string query = "INSERT INTO Customer (cEmail, cFName, cLName, cGender, cPhoneNo, cPassword)" +
                            "VALUES ('" + cUserEmail.Text + "', '" + cFNameTxt.Text + "', '" + cLNameTxt.Text + "', '" + gender + "', '" + cPhoneNo.Text + "', '" + cPassword.Text + "')";

                if (Page.IsValid)
                {
                    try
                    {
                        using (var sqlconnection1 = new SqlConnection(constring))
                        {
                            using (var command = new SqlCommand(query, sqlconnection1))
                            {
                                sqlconnection1.Open();
                                command.ExecuteNonQuery();
                                sqlconnection1.Close();
                            }
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('The account is successfully registerd!');window.location ='homepage.aspx';", true);
                    }
                    catch (SqlException)
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert2", "alert('The email is already register before. Please try again with another email!');", true);
                    }
                }
            }
            }
    }
}