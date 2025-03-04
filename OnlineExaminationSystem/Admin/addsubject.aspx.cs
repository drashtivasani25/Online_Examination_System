using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineExaminationSystem.Admin
{
    public partial class addsubject : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../loginpage.aspx"); // Redirect to login if session is empty
            }
        }

        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [subject] ([subname]) VALUES (@subname)", con);
            cmd.Parameters.AddWithValue("@subname", txtSubjectName.Text);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s > 0)
            {
                GridView1.DataBind();
                Response.Write("<script>alert('Subject added successfully!');</script>");
                txtSubjectName.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Failed to add subject. Please try again.');</script>");
            }
            return;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            SqlCommand cmd = new SqlCommand("DELETE FROM [subject] WHERE [subid] = @subid", con);
            cmd.Parameters.AddWithValue("subid", btn.CommandArgument);

            con.Open();
            int d = cmd.ExecuteNonQuery();
            con.Close();

            if (d > 0)
            {
                GridView1.DataBind();
                Response.Write("<script>alert('Subject deleted successfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Subject not deleted. Please try again.');</script>");
                
            }
            return;
        }
    }
}