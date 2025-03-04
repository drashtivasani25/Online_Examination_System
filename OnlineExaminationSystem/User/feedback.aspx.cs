using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExaminationSystem.User
{
    public partial class feedback : System.Web.UI.Page
    {
        String dropdown;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../loginpage.aspx"); // Redirect to login if session is empty
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Request.QueryString["UserId"]);

            SqlCommand cmd = new SqlCommand("INSERT INTO [feedback] ([UserId], [name],[email],[feedback],[rating]) VALUES (@UserId, @name, @email, @feedback, @rating)", con);
            cmd.Parameters.AddWithValue("@UserId", userid);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@feedback", txtFeedback.Text);
            if (ddlRating.SelectedItem.Selected)
            {
                dropdown = ddlRating.SelectedValue;
            }
            cmd.Parameters.AddWithValue("@rating", dropdown);

            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();

            if (a == 1)
            {
                Response.Write("<script>alert('Feedback added successfully.'); window.location='home_page.aspx?UserId="+ userid +"'</script>");
            }
            else
            {
                Response.Write("<script>alert('Please try again.');</script>");
            }
        }
    }
}