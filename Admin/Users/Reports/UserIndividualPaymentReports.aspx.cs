using System;
using System.Activities.Statements;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class Admin_Users_Reports_UserIndividualPaymentReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int userID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

            if (validUser)
            {
                GetIndividualUserReport(userID);
            }
            else
            {
                Response.Redirect("~/Admin/Users/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Users/View.aspx");
        }
    }

    void GetIndividualUserReport(int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, UserType FROM Users " +
                "INNER JOIN Types ON Users.TypeID=Types.TypeID WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    string lName = dr["LastName"].ToString();
                    string fName = dr["FirstName"].ToString();
                    string type = dr["UserType"].ToString();

                    ReportDocument report = new ReportDocument();
                    report.Load(Server.MapPath("~/Admin/Users/Reports/rptIndividualPayment.rpt"));

                    if (Helper.Secured() != "true")
                        report.DataSourceConnections[0].SetConnection(Helper.GetCrServer(), Helper.GetCrDb(), true);
                    else
                        report.DataSourceConnections[0].SetConnection(Helper.GetCrServer(), Helper.GetCrDb(), Helper.GetCrvUser(), Helper.GetCrvPass());

                    report.SetParameterValue("Name", lName + ", " + fName);
                    report.SetParameterValue("UserType", type);
                    report.SetParameterValue("PrintUserID", userID);

                    crvIndividualPayment.ReportSource = report;
                    crvIndividualPayment.DataBind();
                }
            }
        }
    }
}