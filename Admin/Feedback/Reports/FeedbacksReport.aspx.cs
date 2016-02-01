using System;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class Admin_Feedback_Reports_FeedbacksReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetFeedbackReports();
        }
        else
        {
            crvFeedbacks.ReportSource = (ReportDocument)Session["rptPostBack"];
        }
    }

    void GetFeedbackReports()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MessageID, MessageCat, Subject, " +
                              "DateSubmitted, Status FROM Messages WHERE Category='Feedback'";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");

            cmd.CommandText = "SELECT FirstName, LastName, UserType FROM Users " +
                "INNER JOIN Types ON Users.TypeID=Types.TypeID WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    var lName = dr["LastName"].ToString();
                    var fName = dr["FirstName"].ToString();
                    var type = dr["UserType"].ToString();

                    ReportDocument report = new ReportDocument();
                    report.Load(Server.MapPath("~/Admin/Feedback/Reports/rptFeedbacksReport.rpt"));
                    report.SetDatabaseLogon(Helper.GetCrvUser(), Helper.GetCrvPass(), Helper.GetCrServer(), Helper.GetCrDb());
                    report.SetDataSource(ds);
                    report.SetParameterValue("Name", lName + ", " + fName);
                    report.SetParameterValue("UserType", type);

                    crvFeedbacks.ReportSource = report;
                    crvFeedbacks.DataBind();
                    Session["rptPostBack"] = report;
                }
            }
        }
    }
}