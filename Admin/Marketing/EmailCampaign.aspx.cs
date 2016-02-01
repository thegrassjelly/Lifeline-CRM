using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

public partial class Admin_Marketing_EmailCampaign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetUserList();
        }
        if (Session["complete"] != null)
        {
            complete.Visible = true;
            Session.Remove("complete");
        }
        if (Session["error"] != null)
        {
            error.Visible = true;
            Session.Remove("error");
        }
    }

    private void GetUserList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserID, UserPic, FirstName, LastName, UserType, Email, Status " +
                "FROM Users INNER JOIN Types ON Users.TypeID=Types.TypeID";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");
            gvUsers.DataSource = ds;
            gvUsers.DataBind();
        }
    }
    private void FilterUserList(string usertype, string status)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserID, UserPic, FirstName, LastName, UserType, Email, Status " +
                              "FROM Users INNER JOIN Types ON Users.TypeID=Types.TypeID " +
                              "WHERE UserType='" + usertype + "' AND Status='" + status + "'";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");
            gvUsers.DataSource = ds;
            gvUsers.DataBind();
        }
    }


    protected void ddlUserGroup_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        var type = ddlUserGroup.SelectedValue;
        var status = ddlUserStatus.SelectedValue;
        FilterUserList(type, status);
    }

    protected void ddlUserStatus_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        var type = ddlUserGroup.SelectedValue;
        var status = ddlUserStatus.SelectedValue;
        FilterUserList(type, status);
    }

    protected void btnSent_OnClick(object sender, EventArgs e)
    {
        try
        {
            DataTable dtCustomers = new DataTable();
            dtCustomers.Columns.AddRange(new DataColumn[2]
            {
                new DataColumn("Name", typeof (string)),
                new DataColumn("Email", typeof (string))
            });

            foreach (GridViewRow row in gvUsers.Rows)
            {
                if ((row.FindControl("chkSelect") as CheckBox).Checked)
                {
                    dtCustomers.Rows.Add(row.Cells[2].Text, (row.FindControl("lnkEmail") as HyperLink).Text);
                }
            }

            System.Threading.Tasks.Parallel.ForEach(dtCustomers.AsEnumerable(), row =>
            {
                SendEmail(txtSubject.Text, row["Email"].ToString());
            });
            Session["complete"] = "yes";
        }
        catch (Exception ex)
        {
            Session["error"] = "yes";
            Helper.LogException(Session["userid"].ToString(), "Email Automation",
                "Exception Type: " + ex.GetType().ToString() + " Message: " + ex.ToString());
        }

    }

    void SendEmail(string subject, string recipient)
    {

        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
            mm.To.Add(recipient);
            mm.Subject = subject;
            string body = string.Empty;
            body = File.ReadAllText(Server.MapPath("~/Admin/Marketing/EmailCampaignTemplate.html"));
            body = body.Replace("{Body}", txtMessage.Text.ToString());
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
        catch (SmtpException ex)
        {
            Session["error"] = "yes";
            Helper.LogException(Session["userid"].ToString(), "Email Automation",
                "Exception Type: " + ex.GetType().ToString() + " Message: " + ex.ToString());
        }
    }
}