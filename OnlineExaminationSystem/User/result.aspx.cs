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
    public partial class result : System.Web.UI.Page
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
                if (Request.QueryString["UserId"] == null || Request.QueryString["SubjectId"] == null)
                {
                    Response.Write("<script>alert('You have not attempted any Exam!'); window.location='exam.aspx?UserId=" + Request.QueryString["UserId"] + "';</script>");
                }
                else
                {
                    BindResult();
                }
            }
        }

        private void BindResult()
        {
            int userId = Convert.ToInt32(Request.QueryString["UserId"]);
            int subjectId = Convert.ToInt32(Request.QueryString["SubjectId"]);
            int totalQuestions = 0;
            int correctAnswers = 0;

            string query = @"
                SELECT 
            q.QuestionId,
            q.questext, 
            ISNULL(MAX(u.SelectedOption), '-') AS SelectedOption, 
            q.correctans AS correctans, 
            CASE 
                WHEN MAX(u.SelectedOption) IS NULL THEN 'Not Attempted'
                WHEN MAX(u.SelectedOption) = q.correctans THEN 'Correct'
                ELSE 'Incorrect'
            END AS ResultStatus
        FROM questions q
        LEFT JOIN userResponse u ON q.QuestionId = u.QuestionId AND u.UserId = @UserId
        WHERE q.subid = @SubjectId
        GROUP BY q.QuestionId, q.questext, q.correctans";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@SubjectId", subjectId);


            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            con.Close();

            foreach (DataRow row in dt.Rows)
            {
                totalQuestions++;
                if (row["ResultStatus"].ToString() == "Correct")
                {
                    correctAnswers++;
                }
            }

            double percentage = (totalQuestions > 0) ? ((double)correctAnswers / totalQuestions) * 100 : 0;

            lblTotalQuestions.Text = "Total Questions: " + totalQuestions;
            lblCorrectAnswers.Text = "Correct Answers: " + correctAnswers;
            lblPercentage.Text = "Percentage: " + percentage.ToString("0.00") + "%";
            lblScore.Text = $"Your Score: {correctAnswers} / {totalQuestions}";

            rptResults.DataSource = dt;
            rptResults.DataBind();

            // Insert result data into the database
            SaveResult(userId, subjectId, totalQuestions, correctAnswers);
        }

        private void SaveResult(int userId, int subjectId, int totalQuestions, int correctAnswers)
        {
            string insertQuery = "INSERT INTO result (UserId, subid, totalque, score) VALUES (@UserId, @SubjectId, @TotalQuestions, @Score)";
            SqlCommand insertCmd = new SqlCommand(insertQuery, con);
            insertCmd.Parameters.AddWithValue("@UserId", userId);
            insertCmd.Parameters.AddWithValue("@SubjectId", subjectId);
            insertCmd.Parameters.AddWithValue("@TotalQuestions", totalQuestions);
            insertCmd.Parameters.AddWithValue("@Score", correctAnswers);

            con.Open();
            insertCmd.ExecuteNonQuery();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Request.QueryString["UserId"]);
            Response.Redirect("home_page.aspx?UserId=" + userId);
        }
    }
}