using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Logs_ViewRenewalDeposit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetDepositSubmissions();
            gvDepositLogs.DataBind();
        }
    }

    DataSet GetDepositSubmissions()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT LogsID, FirstName, LastName, LogType, Description, " +
                "Timestamp, Specifics FROM Logs INNER JOIN Users ON Logs.UserID=Users.UserID " +
                "WHERE LogType='Membership Renewal' AND Description='Deposit slip submission' ORDER BY LogsID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Logs");
            return ds;
        }
    }

    protected void gvDepositLogs_OnDataBinding(object sender, EventArgs e)
    {
        gvDepositLogs.DataSource = GetDepositSubmissions();
    }
}