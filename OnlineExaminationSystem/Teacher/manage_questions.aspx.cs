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
    public partial class manage_questions : System.Web.UI.Page
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
                LoadSubjects();
            }
        }

        private void LoadSubjects()
        {
            SqlCommand cmd = new SqlCommand("SELECT subid, subname FROM [subject]", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            ddlSubjects.DataSource = dr;
            ddlSubjects.DataValueField = "subid";
            ddlSubjects.DataTextField = "subname";
            ddlSubjects.DataBind();

            ddlSubjects.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Subject --", "0")); // Default option
            con.Close();
        }

        protected void btnaddquestion_Click(object sender, EventArgs e)
        {
            if (ddlSubjects.SelectedIndex == 0)
            {
                lblError.Text = "please select a subject";

            }
            else
            {
                Response.Redirect("addquestion.aspx?SubjectId=" + ddlSubjects.SelectedValue);
            }
        }

        protected void btnviewquestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_question.aspx");
        }
    }
}