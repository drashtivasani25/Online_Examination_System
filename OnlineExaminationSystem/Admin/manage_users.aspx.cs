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
    public partial class manage_users : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExaminationConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("../loginpage.aspx"); // Redirect to login if session is empty
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            SqlCommand cmd = new SqlCommand("DELETE FROM [registration] WHERE [UserId] = @userid", con);
            cmd.Parameters.AddWithValue("userid", btn.CommandArgument);

            con.Open();
            int d = cmd.ExecuteNonQuery();
            con.Close();

            if (d > 0)
            {
                GridView1.DataBind();
                Response.Write("<script>alert('Candidate deleted successfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Candidate not deleted. Please try again.');</script>");

            }
            return;
        }
    }
}