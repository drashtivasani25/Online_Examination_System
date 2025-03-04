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
    public partial class view_question : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../loginpage.aspx"); // Redirect to login if session is empty
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string QuestionId = btn.CommandArgument;
            Response.Redirect("update_question.aspx?QuestionId=" + QuestionId);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            SqlCommand cmd = new SqlCommand("DELETE FROM [questions] WHERE [QuestionId] = @QuestionId", con);
            cmd.Parameters.AddWithValue("QuestionId", btn.CommandArgument);

            con.Open();
            int d = cmd.ExecuteNonQuery();
            con.Close();

            if (d > 0)
            {
                GridView1.DataBind();
                Response.Write("<script>alert('Question deleted successfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Question not deleted. Please try again.');</script>");

            }
            return;
        }
    }

    
}