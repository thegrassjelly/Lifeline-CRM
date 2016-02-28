using System.Data.SqlClient;
using System;

public partial class Account_CreateNewPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUser();
        }
    }

    void GetUser()
    {
        string recoverCode = !string.IsNullOrEmpty(Request.QueryString["RecoveryCode"])
       ? Request.QueryString["RecoveryCode"] : Guid.Empty.ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Email FROM Users INNER JOIN Recover " +
                "ON Users.UserID = Recover.UserID WHERE RecoveryCode=@recovercode";
            cmd.Parameters.AddWithValue("@recovercode", recoverCode);
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    txtEmail.Text = dr["Email"].ToString();
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string recoverCode = !string.IsNullOrEmpty(Request.QueryString["RecoveryCode"])
        ? Request.QueryString["RecoveryCode"] : Guid.Empty.ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Users SET Password=@Password FROM Users " +
                "INNER JOIN Recover ON Users.UserID = Recover.UserID WHERE RecoveryCode" +
                "=@recovercode";
            cmd.Parameters.AddWithValue("@recovercode", recoverCode);
            cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword2.Text));
            cmd.ExecuteNonQuery();

            cmd.CommandText = "DELETE FROM Recover WHERE UserID=" +
                "(SELECT UserID FROM Users WHERE Email=@email)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@recovercode", recoverCode);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.ExecuteNonQuery();

            success.Visible = true;
            error.Visible = false;
        }
    }
}