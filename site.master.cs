using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class site : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            register.Visible = true;
            login.Visible = true;
            logout.Visible = false;
            profile.Visible = false;
        }
        else
        {
            profile.Visible = true;
            register.Visible = false;
            login.Visible = false;
            logout.Visible = true;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Messages VALUES (@Category, @MessageCat, @Subject, " +
                "@DateSubmitted, @Message, @UserID, @Email, @Status)";
            cmd.Parameters.AddWithValue("@Category", "Frontpage");
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.ToString());
            cmd.Parameters.AddWithValue("@MessageCat", "Message");
            cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.ToString());
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
            cmd.Parameters.AddWithValue("@Status", "Unread");
            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE Users SET Priority=@Priority WHERE UserID=@UserID";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Priority", "Contact Immediately");
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.ExecuteNonQuery();

            con.Close();
            Helper.Log(Session["userid"].ToString(), "Frontpage", "Message", "");
            EmailNotification();
        }
        else
        {
            Response.Redirect("~/Account/Login.aspx");
        }

    }

    void EmailNotification()
    {
        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
        mm.To.Add(txtEmail.Text.ToString());
        mm.Subject = "Feedback - Inquiry/Issue";
        string body = "Hello " + txtFirstName.Text.Trim() + ",";
        body += "<br /><br />Thank you for sending us a message";
        body += "<br /><br />we will get back to you shortly using the email " + txtEmail.Text.ToString();
        body += "<br /><br />Thanks";
        body += "<br /><br />";
        body += "<br /><br />Customer Care - Lifeline Ambulance Rescue Inc.,";
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
