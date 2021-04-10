using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtAssignment
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = (string)(Session["email"]);
            string name = (string)(Session["name"]);
            string type = (string)(Session["type"]);
            if (!IsPostBack)
            {

                if (type == "artist")
                {
                    lblLogin.Text = "<a href =\"logout.aspx\" >Logout</a>";
                    lblRegister.Text = "<a href =\"aboutUs.aspx\">" + name + "</a>";
                }
                else if (type == "customer")
                {
                    lblLogin.Text = "<a href =\"logout.aspx\" >Logout</a>";
                    lblRegister.Text = "<a href =\"aboutUs.aspx\">" + name + "</a>";
                }
                else
                {
                    lblLogin.Text = "<a href =\"login.aspx\" >Login</a>";
                    lblRegister.Text = "<a href =\"register.aspx\">Register</a>";
                }
            }
        }

        protected void PageLogo_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void dMenu_Click(object sender, EventArgs e)
        {
            if(p1.Height == 24)
            {
                p1.Height = 72;
                dMenu3.Visible = true;
                dMenu4.Visible = true;
            }
            else
            {
                p1.Height = 24;
                dMenu3.Visible = false;
                dMenu4.Visible = false;
            }
        }

        
    }
}