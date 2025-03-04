using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExaminationSystem
{
    public partial class registration : System.Web.UI.Page
    {
        String radiobutton;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [registration] ([fname],[lname],[email],[gender],[password],[cpassword]) VALUES (@fname, @lname, @email, @gender, @password, @cpassword)", con);
            cmd.Parameters.AddWithValue("@fname", txtfName.Text);
            cmd.Parameters.AddWithValue("@lname", txtlName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            if (rblGender.SelectedItem.Selected)
            {
                radiobutton = rblGender.SelectedValue;
            }
            cmd.Parameters.AddWithValue("@gender", radiobutton);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@cpassword", txtConfirmPassword.Text);
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Password do not matched!');</script>");
                return;
            }

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Response.Redirect("loginpage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration failed! Please try again.');</script>");
            }
        }
    }
}