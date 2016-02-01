using System;
using System.Activities.Statements;
using System.Data.SqlClient;

public partial class Admin_Logs_ExceptionDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int exceptionID = 0;
            bool validMessage = int.TryParse(Request.QueryString["ID"].ToString(), out exceptionID);

            if (validMessage)
            {
                if (!IsPostBack)
                {
                    GetExceptionDetails(exceptionID);
                }
            }
            else
            {
                Response.Redirect("~/Admin/Logs/ExceptionLogs.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Logs/ExceptionLogs.aspx");
        }
    }

    void GetExceptionDetails(int exceptionID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Page, Description, Timestamp, FirstName, " +
                              "LastName FROM Exceptions INNER JOIN Users ON Exceptions.UserID=Users.UserID " +
                              "WHERE ExceptionID=@ExceptionID";
            cmd.Parameters.AddWithValue("@ExceptionID", exceptionID);
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    txtFirstName.Text = dr["FirstName"].ToString();
                    txtLastName.Text = dr["LastName"].ToString();
                    txtDate.Text = dr["Timestamp"].ToString();
                    txtPage.Text = dr["Page"].ToString();
                    txtDescription.Text = dr["Description"].ToString();
                }
            }

        }
    }
}