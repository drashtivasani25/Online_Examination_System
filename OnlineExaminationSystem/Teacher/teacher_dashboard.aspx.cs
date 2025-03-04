using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExaminationSystem.Teacher
{
    public partial class teacher_dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../loginpage.aspx"); // Redirect to login if session is empty
            }
            if (!IsPostBack)
            {
                LoadDashboardStats();
            }
        }

        private void LoadDashboardStats()
        {
            con.Open();

            // Query to get total subjects
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM subject", con);
            lblTotalSubjects.Text = cmd.ExecuteScalar().ToString();

            // Query to get total students
            SqlCommand cmdStudents = new SqlCommand("SELECT COUNT(*) FROM registration ", con);
            lblTotalStudents.Text = cmdStudents.ExecuteScalar().ToString();

            // Query to get total results
            SqlCommand cmdResults = new SqlCommand("SELECT COUNT(*) FROM result ", con);
            lblTotalResults.Text = cmdResults.ExecuteScalar().ToString();

            con.Close();
        }
    }
}