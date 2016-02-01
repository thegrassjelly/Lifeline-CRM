using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;

public partial class Admin_Users_Reports_CorporateAccountReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetCorporateAccounts();
        }
        else
        {
            crvCorporateAccounts.ReportSource = (ReportDocument)Session["rptPostBack"];
        }
    }

    void GetCorporateAccounts()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT CorporateAccounts.CorporateID, EmployerCode, Name, NatureOfBusiness, " +
                              "Others, Length, PaymentTerms, DiscountRate, Balance FROM CorporateAccounts " +
                              "INNER JOIN CorporatePayments ON CorporateAccounts.CorporateID=CorporatePayments.CorporateID";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "CorporateAccounts");

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
                    report.Load(Server.MapPath("~/Admin/Users/Reports/rptCorporateAccounts.rpt"));
                    report.SetDatabaseLogon(Helper.GetCrvUser(), Helper.GetCrvPass(), Helper.GetCrServer(), Helper.GetCrDb());
                    report.SetDataSource(ds);
                    report.SetParameterValue("Name", lName + ", " + fName);
                    report.SetParameterValue("UserType", type);

                    crvCorporateAccounts.ReportSource = report;
                    crvCorporateAccounts.DataBind();
                    Session["rptPostBack"] = report;
                }
            }
        }
    }
}