using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Logs_ClientVerificationLogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetClientVerificationLogs();
            gvClientVerificationLogs.DataBind();
        }
    }

    DataSet GetClientVerificationLogs()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT LogsID, FirstName, LastName, UserType, LogType, Description, " +
                              "Timestamp, Specifics FROM Logs INNER JOIN Users ON Logs.UserID=Users.UserID " +
                              "INNER JOIN Types ON Types.TypeID=Users.TypeID " +
                              "WHERE LogType='Client Forms' ORDER BY LogsID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Logs");
            return ds;
        }
    }

    protected void gvClientVerificationLogs_OnDataBinding(object sender, EventArgs e)
    {
        gvClientVerificationLogs.DataSource = GetClientVerificationLogs();
    }
}