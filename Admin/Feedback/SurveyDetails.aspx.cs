using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Feedback_SurveyDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int surveyID = 0;
            bool validSurvey = int.TryParse(Request.QueryString["ID"].ToString(), out surveyID);

            if (validSurvey)
            {
                if (!IsPostBack)
                {
                    GetSurveyDetails(surveyID);
                }
            }
            else
            {
                Response.Redirect("~/Admin/Feedback/SurveySummary.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Feedback/SurveySummary.aspx");
        }
    }

   void GetSurveyDetails(int surveyID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DateSubmitted, Comments, QuestionOne, QuestionTwo, " +
                "QuestionThree, QuestionFour, QuestionFive, QuestionSix, QuestionSeven, " +
                "QuestionEight, QuestionNine, QuestionTen, FirstName, LastName, Email FROM Surveys " +
                "INNER JOIN Users ON Surveys.UserID=Users.UserID WHERE SurveyID=@SurveyID";
            cmd.Parameters.AddWithValue("SurveyID", surveyID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtFirstName.Text = data["FirstName"].ToString();
                        txtLastName.Text = data["LastName"].ToString();
                        txtEmail.Text = data["Email"].ToString();
                        DateTime dDate = Convert.ToDateTime(data["DateSubmitted"].ToString());
                        txtDate.Text = dDate.ToString("MM/dd/yyyy");
                        txtMessage.Text = data["Comments"].ToString();
                        txtQ1.Text = data["QuestionOne"].ToString();
                        txtQ2.Text = data["QuestionTwo"].ToString();
                        txtQ3.Text = data["QuestionThree"].ToString();
                        txtQ4.Text = data["QuestionFour"].ToString();
                        txtQ5.Text = data["QuestionFive"].ToString();
                        txtQ6.Text = data["QuestionSix"].ToString();
                        txtQ7.Text = data["QuestionSeven"].ToString();
                        txtQ8.Text = data["QuestionEight"].ToString();
                        txtQ9.Text = data["QuestionNine"].ToString();
                        txtQ10.Text = data["QuestionTen"].ToString();
                    }
                    con.Close();
                }
                else
                {
                    con.Close();
                    Response.Redirect("~/Admin/Feedback/SurveySummary.aspx");
                } 
            } 
        }
    }
}