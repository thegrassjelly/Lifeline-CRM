using System;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;
using System.Windows.Forms;

public class Helper
{
    static SqlConnection con = new SqlConnection(GetCon());
    public Helper()
    {

    }

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["dbLifelineConnectionString"].ConnectionString;
    }

    public static string GetCrvUser()
    {
        return ConfigurationManager.AppSettings["username"].ToString();
    }

    public static string GetCrvPass()
    {
        return ConfigurationManager.AppSettings["password"].ToString();
    }

    public static string GetCrServer()
    {
        return ConfigurationManager.AppSettings["server"].ToString();
    }

    public static string GetCrDb()
    {
        return ConfigurationManager.AppSettings["db"].ToString();
    }

    public static string CreateSHAHash(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }

    public static void ValidateAdmin()
    {   
        if (HttpContext.Current.Session["userid"] == null)
            HttpContext.Current.Response.Redirect("~/Admin/Login.aspx");
    }

    public static void ValidateUser()
    {
        if (HttpContext.Current.Session["userid"] == null)
            HttpContext.Current.Response.Redirect("~/Account/Login.aspx");
    }

    public static void ValidateCorporate()
    {
        if (HttpContext.Current.Session["corporateid"] == null)
            HttpContext.Current.Response.Redirect("~/Corporate/Login.aspx");
    }

    public static void Log(string userID, string logType, string desc, string specifics)
    {
        using (SqlCommand cmd = new SqlCommand())
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Logs VALUES (@UserID, @LogType, @Description, @Timestamp, @Specifics)";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@LogType", logType);
            cmd.Parameters.AddWithValue("@Description", desc);
            cmd.Parameters.AddWithValue("@Timestamp", DateTime.Now);
            cmd.Parameters.AddWithValue("@Specifics", specifics);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    public static void LogException(string userID, string logType, string desc)
    {
        using (SqlCommand cmd = new SqlCommand())
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Exceptions (UserID, Page, Description, " +
                "Timestamp) VALUES (@UserID, @Page, @Description, @Timestamp)";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@Page", logType);
            cmd.Parameters.AddWithValue("@Description", desc);
            cmd.Parameters.AddWithValue("@Timestamp", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

    public static void SendEmail(string subject, string recipient, string body)
    {
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
        mm.To.Add(recipient);
        mm.Subject = "Feedback - " + subject;
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

    public static void SendActivationEmail(string recipient, string name, 
        string usertype, string body)
    {
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
        mm.To.Add(recipient);
        mm.Subject = "Account Activation";
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

    public static void DepositConfirmation(string recipient, string body)
    {
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
        mm.To.Add(recipient);
        mm.Subject = "Membership - Deposit Slip Submission";
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

    public static void SendAutomaticEmail(string userID, string recipient, string body)
    {
        using (SqlCommand cmd = new SqlCommand())
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE AutomaticRenewal SET RemindMeStatus='Sent' " +
                              "WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.ExecuteNonQuery();
            con.Close();

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
            mm.To.Add(recipient);
            mm.Subject = "Membership - Automatic Renewal Reminder";
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

    public static void Alert(string msg, string title)
    {
        MessageBox.Show(msg,title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
    }
}