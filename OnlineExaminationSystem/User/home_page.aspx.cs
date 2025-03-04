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
    public partial class home_page : System.Web.UI.Page
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
                Bindsubject();
            }
        }

        private void Bindsubject()
        {
            string query = "SELECT subid,subname FROM subject";
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void btnStart_Clicked(Object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Request.QueryString["UserId"]);

            Button btn = (Button)sender;
            string subid = btn.CommandArgument;
            Response.Redirect("startexam.aspx?UserId=" + userId + "&SubjectId=" + subid);
        }
    }
}