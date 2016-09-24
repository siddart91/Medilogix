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
    public partial class Register : System.Web.UI.Page
    {
        // Connection String
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["mystr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            try
            {
                string gen = "";
                if (RbtnGen.SelectedIndex == 0)
                {
                    gen = "Male";
                }
                else
                {
                    gen = "Female";
                }
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Customer values (@Name,@CompanyName,@Gender,@PersonalAddr,@CompanyAddr,@MobileNo,@LandlineNo,@EmailID,@Password,@isActive)", con);
                cmd.Parameters.Add(new SqlParameter("@Name", txtUname.Text));
                cmd.Parameters.Add(new SqlParameter("@CompanyName", txtCname.Text));
                cmd.Parameters.Add(new SqlParameter("@Gender", gen));
                cmd.Parameters.Add(new SqlParameter("@PersonalAddr", txtPadd.Text));
                cmd.Parameters.Add(new SqlParameter("@CompanyAddr", txtCadd.Text));
                cmd.Parameters.Add(new SqlParameter("@MobileNo", txtMob.Text));
                cmd.Parameters.Add(new SqlParameter("@LandlineNo", txtLno.Text));
                cmd.Parameters.Add(new SqlParameter("@EmailID", txtEmail.Text));
                cmd.Parameters.Add(new SqlParameter("@Password", txtPass.Text));
                cmd.Parameters.Add(new SqlParameter("isActive", true));
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close(); ;
            }
        }
    }
}