using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Medilogix
{
    public partial class Main : System.Web.UI.MasterPage
    {
        // Connection String
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["mystr"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string loginStat = "";
            try
            {
                if (!IsPostBack && Session["loginstat"].ToString() != null)
                {
                    loginStat = Session["loginstat"].ToString();
                    if (loginStat == "true")
                    {
                        pAc1.Visible = false;
                        pAC2.Visible = true;
                        lblName.Text = "Hi "+ Session["name"].ToString();
                    }
                }
            }
            catch (Exception ex)
            { }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Customer where EmailID='"+ txtEmail.Text + "' And Password='"+ txtPass.Text +"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["name"] = dt.Rows[0]["Name"].ToString();
                Session["EmailID"] = dt.Rows[0]["EmailID"].ToString();
                Session["loginstat"] = "true";
                lblName.Text = "Hi " + dt.Rows[0]["Name"].ToString();
                //loginStat = true;
                pAc1.Visible = false;
                pAC2.Visible = true;
                con.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Javascript", "javascript:ShowHide(); ", true);
                con.Close();
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["loginstat"] = "false";
            Session.Abandon();
            pAc1.Visible = true;
            pAC2.Visible = false;
        }
    }
}