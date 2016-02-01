using System;
using System.Data.SqlClient;
using System.IO;

public partial class Account_Issue_Inquiry : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetUserInfo();
        }
    }

    void GetUserInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = "SELECT FirstName, LastName, Email " +
                    "FROM Users WHERE UserID=@UserID";
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                using (SqlDataReader data = cmd.ExecuteReader())
                {
                    while (data.Read())
                    {
                        txtFirstName.Text = data["FirstName"].ToString();
                        txtLastName.Text = data["LastName"].ToString();
                        txtEmail.Text = data["Email"].ToString();
                    }
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var userID = Session["UserID"].ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Messages VALUES (@Category, @MessageCat, @Subject, " +
                "@DateSubmitted, @Message, @UserID, @Email, @Status); SELECT TOP 1 " +
                "MessageID FROM Messages WHERE UserID=@UserID ORDER BY MessageID DESC";
            cmd.Parameters.AddWithValue("@Category", txtCategory.Text.ToString());
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.ToString());
            cmd.Parameters.AddWithValue("@MessageCat", ddlMessageCat.SelectedValue);
            cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.ToString());
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
            cmd.Parameters.AddWithValue("@Status", "Unread");
            int messageID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "UPDATE Users SET Priority=@Priority WHERE UserID=@UserID";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Priority", "Contact Immediately");
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.ExecuteNonQuery();

            con.Close();
            Helper.Log(userID, "Feedback", "Inquiry/Issue", messageID.ToString());
            issue.Visible = true;
            Helper.SendEmail("Issue/Inquiry", txtEmail.Text.ToString(),
                PopulateBody(txtEmail.Text.ToString(), txtFirstName.Text.ToString(), ddlMessageCat.SelectedValue));
        }
    }

    string PopulateBody(string recipient, string name, string messagecat)
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/Feedback/IssueInquiryEmailTemplate.html"));
        body = body.Replace("{Recipient}", recipient);
        body = body.Replace("{FirstName}", name);
        body = body.Replace("{MessageCat}", messagecat);
        return body;
    }
}