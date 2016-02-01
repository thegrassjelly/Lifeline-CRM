using System;
using System.Activities.Statements;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class Admin_Users_Reports_UserIndividualReports : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    ComputeDates(userID);
                    CheckMembership();
                }
                else
                {
                    crvIndividualUsers.ReportSource = (ReportDocument)Session["rptPostBack"];
                }
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
    bool CheckMembership()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Memberships.MembershipID FROM Memberships " +
                              "INNER JOIN Payments ON Memberships.MembershipID=" +
                              "Payments.MembershipID WHERE UserID=@UserID " +
                              "AND MembershipStatus='Active' AND PaymentStatus='Paid'";
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                var hasMembership = data.HasRows;
                return hasMembership; 
            } 
        }
    }

    void ComputeDates(int userID)
    {
        if (CheckMembership())
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT SUM(Length) FROM Memberships INNER JOIN Payments ON " +
                                  "Memberships.MembershipID=Payments.MembershipID WHERE UserID=@UserID " +
                                  "AND MembershipStatus='Active' AND PaymentStatus='Paid'";
                cmd.Parameters.AddWithValue("@UserID", userID);
                int totalYears = (int)cmd.ExecuteScalar();

                cmd.CommandText = "SELECT TOP 1 StartDate, Type FROM Memberships INNER JOIN Payments ON " +
                                  "Memberships.MembershipID=Payments.MembershipID WHERE UserID=@UserID " +
                                  "AND MembershipStatus='Active' AND PaymentStatus='Paid'";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", userID);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        DateTime startDate = Convert.ToDateTime(dr["StartDate"]);
                        DateTime endDate = startDate.AddYears(totalYears);
                        string sDate = startDate.ToShortDateString();
                        string edate = endDate.ToShortDateString();
                        string mType = dr["Type"].ToString();

                        GetIndividualUserReport(userID, sDate, edate, mType);
                    }
                }
            }
        }
        else
        {
            GetIndividualUserReport(userID, "", "", "");
        }
        
    }

    void GetIndividualUserReport(int userID, string sDate, string eDate, string mType)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Email, FirstName, LastName, Birthday, " +
                "Street, Municipality, City, Phone, Mobile FROM Users WHERE Users.UserID=@UserPrintID";
            cmd.Parameters.AddWithValue("@UserPrintID", userID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");

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
                    report.Load(Server.MapPath("~/Admin/Users/Reports/rptUsersIndividual.rpt"));
                    report.SetDatabaseLogon(Helper.GetCrvUser(), Helper.GetCrvPass(), Helper.GetCrServer(), Helper.GetCrDb());
                    report.SetDataSource(ds);
                    report.SetParameterValue("Name", lName + ", " + fName);
                    report.SetParameterValue("UserType", type);
                    report.SetParameterValue("StartDate", sDate);
                    report.SetParameterValue("EndDate", eDate);
                    report.SetParameterValue("MembershipType", mType);
                    report.SetParameterValue("StartDate", "");
                    report.SetParameterValue("EndDate", "");
                    report.SetParameterValue("MembershipType", "");
                    crvIndividualUsers.ReportSource = report;
                    crvIndividualUsers.DataBind();
                    Session["rptPostBack"] = report;
                }
            }
        }
    }
}