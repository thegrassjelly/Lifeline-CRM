using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

public partial class Admin_Membership_Renewals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetMembershipList();
            gvRenewals.DataBind();
        }
    }

    DataSet GetMembershipList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Memberships.MembershipID, FirstName, LastName, StartDate, " +
                              "EndDate, Length, MembershipStatus, Type, PaymentStatus FROM Memberships " +
                              "INNER JOIN Users ON Memberships.UserID=Users.UserID INNER JOIN Payments " +
                              "ON Memberships.MembershipID=Payments.MembershipID ORDER BY MembershipID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Memberships");
            return ds;
        }
    }

    protected void gvRenewals_OnDataBinding(object sender, EventArgs e)
    {
        gvRenewals.DataSource = GetMembershipList();
    }

    protected void gvUserDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["MembershipID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}