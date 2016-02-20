using System;
using System.Data.SqlClient;
using System.IO;

public partial class Account_Feedback_Survey : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetUserInfo();
        }
        this.Form.DefaultButton = this.btnSubmit.UniqueID;
    }

    void GetUserInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Email " +
                "FROM Users WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtFirstName.Text = data["FirstName"].ToString();
                    txtEmail.Text = data["Email"].ToString();
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var userID = Session["userid"].ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Surveys VALUES (@UserID, @QuestionOne, @QuestionTwo, @QuestionThree, " +
                "@QuestionFour, @QuestionFive, @QuestionSix, @QuestionSeven, @QuestionEight, " +
                "@QuestionNine, @QuestionTen, @Comments, @DateSubmitted); SELECT TOP 1 SurveyID " +
                "FROM Surveys WHERE UserID=@UserID ORDER BY SurveyID DESC";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@QuestionOne", rblSurveyOne.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionTwo", rblSurveyTwo.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionThree", rblSurveyThree.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionFour", rblSurveyFour.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionFive", rblSurveyFive.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionSix", rblSurveySix.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionSeven", rblSurveySeven.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionEight", rblSurveyEight.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionNine", rblSurveyNine.SelectedValue);
            cmd.Parameters.AddWithValue("@QuestionTen", rblSurveyTen.SelectedValue);
            cmd.Parameters.AddWithValue("@Comments", txtMessage.Text.ToString());
            cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);
            int surveyID = (int)cmd.ExecuteScalar();

            Helper.Log(userID, "Feedback", "Survey", surveyID.ToString());
            survey.Visible = true;
            Helper.SendEmail("Survey", txtEmail.Text.ToString(),
                PopulateBody(txtEmail.Text.ToString(), txtFirstName.Text.ToString()));
        }
    }

    string PopulateBody(string recipient, string name)
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/Feedback/SurveyEmailTemplate.html"));
        body = body.Replace("{Recipient}", recipient);
        body = body.Replace("{FirstName}", name);
        return body;
    }
}