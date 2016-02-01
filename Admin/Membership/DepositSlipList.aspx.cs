using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class Admin_Membership_DepositSlipList : System.Web.UI.Page
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
            cmd.CommandText = "SELECT Memberships.MembershipID, StartDate, " +
                              "EndDate, Length, MembershipStatus, Type, PaymentStatus FROM Memberships " +
                              "INNER JOIN Payments ON Memberships.MembershipID=Payments.MembershipID WHERE " +
                              "DepositSlip!=@DepositSlip ORDER BY MembershipID DESC";
            cmd.Parameters.AddWithValue("@DepositSlip", "");
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