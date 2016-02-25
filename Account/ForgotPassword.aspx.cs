using System;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;

public partial class Account_ForgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = this.btnSubmit.UniqueID;
    }

    bool IsRecordExisting(string email)
    {
        bool existing = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Email FROM Users WHERE Email=@Email";
        cmd.Parameters.AddWithValue("@Email", email);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!IsRecordExisting(txtEmail.Text))
        {
            success.Visible = false;
            error.Visible = true;
        }
        else
        {
            string recover = Guid.NewGuid().ToString();
            string rurl = Request.Url.AbsoluteUri.Replace("ForgotPassword.aspx",
                "CreateNewPassword.aspx?RecoveryCode=" + recover);

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = "SELECT UserID FROM Users WHERE Email=@email";
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            int UserID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "INSERT INTO Recover VALUES(@UserID, @RecoveryCode)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@RecoveryCode", recover);
            cmd.ExecuteNonQuery();
            AccountRecovery(rurl);
            error.Visible = false;
            success.Visible = true;
        }
    }

    public static string GetUserIP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        if (VisitorsIPAddr == "::1")
            VisitorsIPAddr = "127.0.0.1";
        return VisitorsIPAddr;
    }

    void AccountRecovery(string requesturl)
    {
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
        mm.To.Add(txtEmail.Text);
        mm.Subject = "Account Recovery";
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/ForgotPasswordTemplate.html"));
        body = body.Replace("{FirstName}", txtEmail.Text);
        body = body.Replace("{RequesIP}", GetUserIP());
        body = body.Replace("{RequestUrl}", requesturl);
        mm.Body = body;
        mm.IsBodyHtml = true;

        SmtpClient client = new SmtpClient();
        client.EnableSsl = true;
        client.UseDefaultCredentials = true;
        NetworkCredential cred = new NetworkCredential("lifelineambulancerescue@gmail.com", "swantonbomb");
        client.Host = "smtp.gmail.com";
        client.Port = 587;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.Credentials = cred;
        client.Send(mm);
    }
}