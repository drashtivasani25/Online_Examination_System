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
    public partial class update_question : System.Web.UI.Page
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
                int questionId;
                if (int.TryParse(Request.QueryString["QuestionId"], out questionId))
                {
                    LoadQuestionDetails(questionId);
                }
            }
        }
        private void LoadQuestionDetails(int questionId)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM questions WHERE QuestionId=@QuestionId", con);
            cmd.Parameters.AddWithValue("@QuestionId", questionId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtQuestion.Text = reader["questext"].ToString();
                txtOption1.Text = reader["op1"].ToString();
                txtOption2.Text = reader["op2"].ToString();
                txtOption3.Text = reader["op3"].ToString();
                txtOption4.Text = reader["op4"].ToString();

                // Populate Dropdown with options dynamically
                ddlCorrectAnswer.Items.Clear();
                ddlCorrectAnswer.Items.Add(new ListItem(reader["op1"].ToString(), reader["op1"].ToString()));
                ddlCorrectAnswer.Items.Add(new ListItem(reader["op2"].ToString(), reader["op2"].ToString()));
                ddlCorrectAnswer.Items.Add(new ListItem(reader["op3"].ToString(), reader["op3"].ToString()));
                ddlCorrectAnswer.Items.Add(new ListItem(reader["op4"].ToString(), reader["op4"].ToString()));

                ddlCorrectAnswer.SelectedValue = reader["correctans"].ToString();
            }
            reader.Close();
            con.Close();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int QuestionId = Convert.ToInt32(Request.QueryString["QuestionId"]);

            SqlCommand cmd = new SqlCommand("UPDATE questions SET questext=@questext, op1=@op1, op2=@op2, op3=@op3, op4=@op4, correctans=@correctans WHERE QuestionId=@QuestionId", con);
            cmd.Parameters.AddWithValue("@questext", txtQuestion.Text);
            cmd.Parameters.AddWithValue("@op1", txtOption1.Text);
            cmd.Parameters.AddWithValue("@op2", txtOption2.Text);
            cmd.Parameters.AddWithValue("@op3", txtOption3.Text);
            cmd.Parameters.AddWithValue("@op4", txtOption4.Text);
            cmd.Parameters.AddWithValue("@correctans", ddlCorrectAnswer.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionId", QuestionId);

            con.Open();
            int r = cmd.ExecuteNonQuery();
            con.Close();

            if (r == 1)
            {
                Response.Write("<script>alert('Question updated successfully.'); window.location='view_question.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('Question not updated. Please Try again.');</script>");
            }
        }
    }
}