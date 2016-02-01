using System.Data.SqlClient;
using System;

public partial class Account_Activation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RemoveActivationCode();
        }
    }

    void RemoveActivationCode()
    {
        string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"])
               ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand())
            using (SqlTransaction tran = con.BeginTransaction())
            {
                cmd.Transaction = tran;
                try
                {
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT TOP 1 UserID FROM UserActivation ORDER BY UserID DESC";

                    int UserID = (int)cmd.ExecuteScalar();
                    cmd.CommandText = "UPDATE Users SET Status=@Status WHERE UserID=@UserID";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    cmd.Parameters.AddWithValue("@Status", "Active");
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "DELETE FROM UserActivation WHERE ActivationCode=@ActivationCode; " +
                                      "SELECT TOP 1 UserID FROM UserActivation";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    cmd.ExecuteNonQuery();
                    tran.Commit();

                    ltMessage.Text = "Account Activated";
                    Session["Activated"] = "yes";
                }
                catch (SqlException ex)
                {
                    tran.Rollback();
                    Session["Activatefail"] = "yes";

                }
                finally
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            } 
        }
    }
}


