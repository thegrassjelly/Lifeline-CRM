using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Account_Membership_PreviousPayments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetPaymentHistory();
        }
    }

    void GetPaymentHistory()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT PaymentStatus, Amount, Length, Type, StartDate, EndDate, " +
                "Memberships.MembershipID FROM Payments INNER JOIN Memberships ON " +
                "Payments.MembershipID=Memberships.MembershipID " +
                "WHERE UserID=@UserID ORDER BY MembershipID DESC";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Payments");
            lvPaymentHistory.DataSource = ds;
            lvPaymentHistory.DataBind();
        }
    }

    void SortPayments(string column, string dir)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT PaymentStatus, Amount, Length, Type, StartDate, EndDate, " +
                "Memberships.MembershipID FROM Payments INNER JOIN Memberships ON " +
                "Payments.MembershipID=Memberships.MembershipID " +
                "WHERE UserID=@UserID ORDER BY " + column + " " + dir;
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Payments");
            lvPaymentHistory.DataSource = ds;
            lvPaymentHistory.DataBind();
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortPayments(ddlSortBy.SelectedValue, ddlDirection.SelectedValue);
        }
        else
        {
            GetPaymentHistory();
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortPayments(sortBy, direction);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortPayments(sortBy, direction);
    }
}