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
    public partial class loginpage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string accountType = ddlAccountType.SelectedValue;
            if (accountType == "0")
            {
                Response.Write("<script>alert('Please select an account type.');</script>");
                return;
            }

            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Admin login
            if (accountType == "Admin")
            {
                if (username == "admin" && password == "admin123")
                {
                    Session["UserID"] = username;
                    Session["UserRole"] = accountType;
                    Response.Redirect("Admin/admin_dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Admin credentials! Please try again.');</script>");
                }
                return;
            }

            // Teacher login
            if (accountType == "Teacher")
            {
                Session["UserID"] = username;
                Session["UserRole"] = accountType;
                if (username == "teacher" && password == "teacher123")
                {
                    Response.Redirect("Teacher/teacher_dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Teacher credentials! Please try again.');</script>");
                }
                return;
            }

            //Student login
            if (accountType == "Student")
            {
                Session["UserID"] = username;
                Session["UserRole"] = accountType;

                string query = "SELECT UserId FROM registration WHERE email=@email AND password=@password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@email", username);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    int userid = Convert.ToInt32(dr["UserId"]);
                    Response.Redirect("User/home_page.aspx?UserId=" + userid);
                }
                else
                {
                    Response.Write("<script>alert('Invalid username or password! Please try again.');</script>");
                }
                con.Close();
            }
        }
    }
}