using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Feedback_SurveySummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetSurveyList();
            gvSurveySummary.DataBind();
        }
    }

    DataSet GetSurveyList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT SurveyID, DateSubmitted, FirstName, LastName, Email " +
                              "FROM Surveys INNER JOIN Users ON Surveys.UserID=Users.UserID " +
                              "ORDER BY SurveyID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            return ds;
        }
    }

    protected void gvSurveySummary_OnDataBinding(object sender, EventArgs e)
    {
        gvSurveySummary.DataSource = GetSurveyList();
    }
}