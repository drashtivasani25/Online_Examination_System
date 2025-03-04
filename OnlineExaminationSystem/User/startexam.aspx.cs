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
    public partial class startexam : System.Web.UI.Page
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
                int subjectId = Convert.ToInt32(Request.QueryString["SubjectId"]);
                if (HasUserAttemptedExam())
                {
                    int userid = Convert.ToInt32(Request.QueryString["UserId"]);
                    Response.Write("<script>alert('You have already attempted this exam.'); window.location='home_page.aspx?UserId="+ userid +"';</script>");
                }
                else
                {
                    if (Session["ExamStartTime_" + subjectId] == null)
                    {
                        Session["ExamStartTime_" + subjectId] = DateTime.Now;
                    }

                    BindQuestion();
                    CheckExamTime();
                }
            }
        }


        private bool HasUserAttemptedExam()
        {
            int userId = Convert.ToInt32(Request.QueryString["UserId"]);
            int subjectId = Convert.ToInt32(Request.QueryString["SubjectId"]);

            string query = "SELECT COUNT(*) FROM userResponse WHERE UserId = @UserId AND subid = @subid";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@subid", subjectId);

            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            return count > 0; // If count > 0, user has already attempted the exam
        }

        private void BindQuestion()
        {
            int subid = Convert.ToInt32(Request.QueryString["SubjectId"]);

            SqlCommand cmd = new SqlCommand("SELECT QuestionId, questext, op1, op2, op3, op4 FROM questions WHERE subid = @subid", con);
            cmd.Parameters.AddWithValue("@subid", subid);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            rptQuestions.DataSource = reader;
            rptQuestions.DataBind();
            con.Close();
        }

        private void CheckExamTime()
        {
            int subjectId = Convert.ToInt32(Request.QueryString["SubjectId"]);

            if (Session["ExamStartTime_" + subjectId] != null)
            {
                DateTime startTime = (DateTime)Session["ExamStartTime_" + subjectId];
                TimeSpan elapsed = DateTime.Now - startTime;

                int totalExamDuration = 300; // 5 minutes in seconds
                int remainingTime = totalExamDuration - (int)elapsed.TotalSeconds;

                if (remainingTime <= 0)
                {
                    SubmitExam(); // Auto-submit when time is up
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "timerScript", "var totalTime=" + remainingTime + ";", true);
                }
            }
        }

        private void SubmitExam()
        {
            foreach (RepeaterItem item in rptQuestions.Items)
            {
                HiddenField hdnQid = (HiddenField)item.FindControl("hdnQid");
                RadioButtonList rblOptions = (RadioButtonList)item.FindControl("rblOptions");

                if (hdnQid != null && rblOptions != null && rblOptions.SelectedItem != null)
                {
                    int questionId = Convert.ToInt32(hdnQid.Value);
                    string selectedAnswer = rblOptions.SelectedItem.Value;

                    SaveUserAnswer(questionId, selectedAnswer);
                }
            }

            Response.Redirect("result.aspx?UserId=" + Request.QueryString["UserId"] + "&SubjectId=" + Request.QueryString["SubjectId"]);
        }

        protected void rptQuestions_ItemDataBound(object sender,RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType==ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
            {
                HiddenField hdnQid = (HiddenField)e.Item.FindControl("hdnQid");
                RadioButtonList rblOptions = (RadioButtonList)e.Item.FindControl("rblOptions");

                if (hdnQid != null)
                {
                    IDataRecord row = (IDataRecord)e.Item.DataItem;
                    hdnQid.Value = row["QuestionId"].ToString(); // Ensure the QuestionId is stored
                }

                if (rblOptions != null)
                {
                    IDataRecord row = (IDataRecord)e.Item.DataItem;
                    rblOptions.Items.Add(new ListItem(row["op1"].ToString(), row["op1"].ToString()));
                    rblOptions.Items.Add(new ListItem(row["op2"].ToString(), row["op2"].ToString()));
                    rblOptions.Items.Add(new ListItem(row["op3"].ToString(), row["op3"].ToString()));
                    rblOptions.Items.Add(new ListItem(row["op4"].ToString(), row["op4"].ToString()));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in rptQuestions.Items)
            {
                HiddenField hdnQid = (HiddenField)item.FindControl("hdnQid");
                RadioButtonList rblOptions = (RadioButtonList)item.FindControl("rblOptions");

                if (hdnQid != null && rblOptions != null && rblOptions.SelectedItem != null)
                {
                    int questionId = Convert.ToInt32(hdnQid.Value);
                    string selectedAnswer = rblOptions.SelectedItem.Value;

                    SaveUserAnswer(questionId, selectedAnswer);
                }
            }
           Response.Write("<script>alert('Your answers have been submitted successfully!'); window.location='result.aspx?UserId=" + Request.QueryString["UserId"] + "&SubjectId=" + Request.QueryString["SubjectId"] + "';</script>");
        }

        private void SaveUserAnswer(int questionId, string SelectedOption)
        {
            int userId = Convert.ToInt32(Request.QueryString["UserId"]);
            int subjectId = Convert.ToInt32(Request.QueryString["SubjectId"]);

            string query = "INSERT INTO userResponse (UserId, subid, QuestionId, SelectedOption) VALUES (@UserId, @subid, @QuestionId, @SelectedOption)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@subid", subjectId);
            cmd.Parameters.AddWithValue("@QuestionId", questionId);
            cmd.Parameters.AddWithValue("@SelectedOption", SelectedOption);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    
}