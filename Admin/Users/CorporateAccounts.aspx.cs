using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class Admin_Users_AddClientAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetEmployerList();
            gvCorporateAccounts.DataBind();
        }
    }

    DataSet GetEmployerList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT CorporateID, Name, EmployerCode, NatureOfBusiness, Others, " +
                              "Status, DateAdded FROM CorporateAccounts ORDER BY CorporateID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected void gvCorporateAccounts_OnDataBinding(object sender, EventArgs e)
    {
        gvCorporateAccounts.DataSource = GetEmployerList();
    }

    protected void gvCorporateAccountDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["CorporateID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvCorporateEmployees_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["CorporateID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvPaymentDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["CorporateID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

}