using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Account_Membership_Payments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetPendingPayments();
        }
    }

    void GetPendingPayments()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT PaymentStatus, Amount, Length, Type, StartDate, EndDate, " +
                "Memberships.MembershipID FROM Payments INNER JOIN Memberships ON " +
                "Payments.MembershipID=Memberships.MembershipID " +
                "WHERE UserID=@UserID AND PaymentStatus='Unpaid' ORDER BY MembershipID DESC";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Payments");
            lvPendingPayments.DataSource = ds;
            lvPendingPayments.DataBind();
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
                "WHERE UserID=@UserID AND PaymentStatus='Unpaid' ORDER BY " + column + " " + dir;
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@Column", column);
            cmd.Parameters.AddWithValue("@Dir", dir);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Payments");
            lvPendingPayments.DataSource = ds;
            lvPendingPayments.DataBind();
            con.Close();
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
            GetPendingPayments();
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