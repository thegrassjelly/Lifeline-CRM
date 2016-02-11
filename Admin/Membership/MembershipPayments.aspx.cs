using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

public partial class Admin_Membership_MembershipPayments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetApplications();
            gvApplications.DataBind();

        }
    }

    DataSet GetApplications()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ApplicationID, Applications.FirstName, Applications.LastName, Applications.Email, UserType, " +
                              "DateSubmitted, PaymentStatus FROM Applications INNER JOIN Users ON Applications.UserID=Users.UserID " +
                              "INNER JOIN Types ON Users.TypeID=Types.TypeID INNER JOIN PAYMENTS ON Applications.ApplicationID " +
                              "= Payments.MembershipID WHERE DepositSlip != '' AND Applications.Status != 'Voided' ORDER BY ApplicationID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Applications");
            return ds;
        }
    }

    protected void grid_DataBinding(object sender, EventArgs e)
    {
        gvApplications.DataSource = GetApplications();
    }

    protected void gvApplicationDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["ApplicationID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

}