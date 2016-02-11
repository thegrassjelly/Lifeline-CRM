using System;
using System.Data.SqlClient;

public partial class Admin_Membership_ApplicationVoid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            Helper.ValidateAdmin();
        }
        else
        {
            Response.Redirect("~/Admin/Membership/MembershipApplications.aspx");
        }
        if (Session["password"] != null)
        {
            error.Visible = true;
            Session.Remove("password");
        }
        if (Session["dberror"] != null)
        {
            db_error.Visible = true;
            Session.Remove("dberror");
        }
        if (Session["voidsuccess"] != null)
        {
            voidsuccess.Visible = true;
            Session.Remove("voidsuccess");
        }
    }

    bool IsPasswordCorrect()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Password FROM Users WHERE UserID=@UserID AND Password=@Password";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                bool isCorrect = data.HasRows;
                return isCorrect;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var appID = Request.QueryString["ID"].ToString();
        if (!IsPasswordCorrect())
        {
            Session["password"] = "yes";
            Response.Redirect("~/Admin/Membership/ApplicationVoid.aspx?ID=" +
                appID);
        }
        else
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            {
                con.Open();
                using (SqlTransaction tran = con.BeginTransaction())
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Transaction = tran;
                    try
                    {
                        cmd.Connection = con;
                        cmd.CommandText = "INSERT INTO ApplicationVoids VALUES (@ApplicationID, " +
                                          "@Timestamp, @Reason)SELECT TOP 1 VoidID FROM ApplicationVoids " +
                                          "ORDER BY VoidID DESC";
                        cmd.Parameters.AddWithValue("@ApplicationID", appID);
                        cmd.Parameters.AddWithValue("@Timestamp", DateTime.Now);
                        cmd.Parameters.AddWithValue("@Reason", txtReason.Text.ToString());
                        int voidID = (int)cmd.ExecuteScalar();

                        cmd.CommandText = "UPDATE Applications SET Status='Voided' " +
                                          "WHERE ApplicationID=@ApplicationID";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@ApplicationID", appID);
                        cmd.ExecuteNonQuery();
                        tran.Commit();

                        Helper.Log(Session["userid"].ToString(), "Membership Application",
                            "Void Membership", voidID.ToString());
                        Session["voidsuccess"] = "yes";
                    }
                    catch (SqlException ex)
                    {
                        tran.Rollback();
                        Session["dberror"] = "yes";
                        Helper.LogException(Session["userid"].ToString(), "Membership Application, Void Application",
                            "Exception Type: " + ex.GetType().ToString() + " " +
                            "Exception Message: " + ex.Message.ToString());
                    }
                    finally
                    {
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
        }
    }


}