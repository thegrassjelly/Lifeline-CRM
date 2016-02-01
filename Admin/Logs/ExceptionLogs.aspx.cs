using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Logs_Exception_Logs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetExceptionLogs();
            gvExceptionLogs.DataBind();
        }
    }

    DataSet GetExceptionLogs()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ExceptionID, Page, Timestamp, " +
                              "FirstName, LastName FROM Exceptions INNER JOIN Users ON " +
                              "Exceptions.UserID=Users.UserID ORDER BY ExceptionID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected void gvExceptionLogs_OnDataBinding(object sender, EventArgs e)
    {
        gvExceptionLogs.DataSource = GetExceptionLogs();
    }
}