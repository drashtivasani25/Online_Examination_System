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
    public partial class addquestion : System.Web.UI.Page
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
                PopulateCorrectAnswerDropdown();
            }
        }

        private void PopulateCorrectAnswerDropdown()
        {
            ddlCorrectAnswer.Items.Clear();
            ddlCorrectAnswer.Items.Add(new ListItem("Select Correct Answer", ""));

            ddlCorrectAnswer.Items.Add(new ListItem("A. " + txtOption1.Text, txtOption1.Text));
            ddlCorrectAnswer.Items.Add(new ListItem("B. " + txtOption2.Text, txtOption2.Text));
            ddlCorrectAnswer.Items.Add(new ListItem("C. " + txtOption3.Text, txtOption3.Text));
            ddlCorrectAnswer.Items.Add(new ListItem("D. " + txtOption4.Text, txtOption4.Text));
        }

        protected void txtOption_TextChanged(object sender, EventArgs e)
        {
            PopulateCorrectAnswerDropdown();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int subid = Convert.ToInt32(Request.QueryString["SubjectId"]);

            SqlCommand cmd = new SqlCommand("INSERT INTO [questions] ([questext],[subid],[op1],[op2],[op3],[op4],[correctans]) VALUES (@questext, @subid, @op1, @op2, @op3, @op4, @correctans)", con);
            cmd.Parameters.AddWithValue("@questext", txtQuestion.Text);
            cmd.Parameters.AddWithValue("@subid",subid);
            cmd.Parameters.AddWithValue("@op1", txtOption1.Text);
            cmd.Parameters.AddWithValue("@op2", txtOption2.Text);
            cmd.Parameters.AddWithValue("@op3", txtOption3.Text);
            cmd.Parameters.AddWithValue("@op4", txtOption4.Text);
            cmd.Parameters.AddWithValue("@correctans", ddlCorrectAnswer.SelectedValue);

            con.Open();
            int r = cmd.ExecuteNonQuery();
            con.Close();

            if (r == 1)
            {
                Response.Write("<script>alert('Question added successfully.'); window.location='view_question.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('Question could not be added. Please try again.');</script>");
            }
        }
    }
}