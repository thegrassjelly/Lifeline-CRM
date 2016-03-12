using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

public partial class Account_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        switch (Session["TypeID"].ToString())
        {
            case "9":
                panelCorporate.Visible = true;
                panelMembership.Visible = true;
                break;
            case "10":
                panelCorporate.Visible = true;
                panelMembership.Visible = true;
                break;
        }
        if (!IsPostBack)
        {
            GetDates();
            GetArticles();
            GetCorporateMembership();
        }
    }

    void GetCorporateMembership()
    {
        if (CheckCorporateMembership())
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT CorporateID FROM Users " +
                              "WHERE UserID=@UserID";
                cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
                int corporateID = (int)cmd.ExecuteScalar();

                cmd.CommandText = "SELECT Name, Length FROM CorporateAccounts " +
                                  "INNER JOIN CorporatePayments ON CorporateAccounts.CorporateID=" +
                                  "CorporatePayments.CorporateID WHERE CorporateAccounts.CorporateID=" +
                                  "@CorporateID";
                cmd.Parameters.AddWithValue("@CorporateID", corporateID);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtEmployerName.Text = da["Name"].ToString();
                    txtCorporateLength.Text = da["Length"].ToString();
                    txtCorporateType.Text = "Corporate/Bulk";
                }
            }
        }
        else
        {
            txtEmployerName.Text = "N/A";
            txtCorporateLength.Text = "N/A";
            txtCorporateType.Text = "N/A";
        }
    }

    bool CheckCorporateMembership()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT CorporateID FROM Users " +
                              "WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataReader data = cmd.ExecuteReader();
            data.Read();
            var hasCorporateMem = data["CorporateID"].ToString() != "";
            return hasCorporateMem;
        }
    }

    bool CheckMembership()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MembershipID FROM Memberships " +
                "WHERE UserID=@UserID AND MembershipStatus='Active'";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataReader data = cmd.ExecuteReader();
            var hasMembership = data.HasRows;
            return hasMembership;
        }
    }

    void GetDates()
    {
        string userID = Session["userid"].ToString();
        if (CheckMembership())
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT SUM(Length) FROM Memberships INNER JOIN Payments ON " +
                                  "Memberships.MembershipID=Payments.MembershipID WHERE UserID=@UserID " +
                                  "AND MembershipStatus='Active' AND PaymentStatus='Paid'";
                cmd.Parameters.AddWithValue("@UserID", userID);
                int totalYears = (int)cmd.ExecuteScalar();
                txtMembershipLength.Text = totalYears.ToString();

                cmd.CommandText = "SELECT TOP 1 StartDate FROM Memberships INNER JOIN Payments ON " +
                                  "Memberships.MembershipID=Payments.MembershipID WHERE UserID=@UserID " +
                                  "AND MembershipStatus='Active' AND PaymentStatus='Paid'";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", userID);
                DateTime startDate = (DateTime)cmd.ExecuteScalar();
                DateTime endDate = startDate.AddYears(totalYears);
                txtStartDate.Text = startDate.ToString("MM/dd/yyyy");
                txtEndDate.Text = endDate.ToString("MM/dd/yyyy");
                GetMembershipInfo();
                CheckAutomaticRenewal(endDate);  
            }
        }
        else
        {
            txtStartDate.Text = "N/A";
            txtEndDate.Text = "N/A";
            txtMembershipLength.Text = "N/A";
            txtMemStatus.Text = "N/A";
            txtPayStatus.Text = "N/A";
            txtMembershipType.Text = "N/A";
        }
    }

    void GetMembershipInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MembershipStatus, Type, PaymentStatus " +
                              "FROM Memberships INNER JOIN Payments ON Memberships.MembershipID=" +
                              "Payments.MembershipID WHERE Memberships.MembershipID=(SELECT TOP " +
                              "1 MembershipID FROM Memberships WHERE UserID=@UserID " +
                              "ORDER BY MembershipID DESC)";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader Data = cmd.ExecuteReader())
            {
                while (Data.Read())
                {
                    txtMemStatus.Text = Data["MembershipStatus"].ToString();
                    txtMembershipType.Text = Data["Type"].ToString();
                    txtPayStatus.Text = Data["PaymentStatus"].ToString();
                } 
            }
        }
    }

    void GetArticles()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ArticleID, ArticleType, Others, DateSubmitted, " +
                "ArticlePic, Title, Summary, FirstName, LastName FROM Articles INNER JOIN " +
                "Users on Articles.UserID=Users.UserID ORDER BY DateSubmitted DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Articles");
            lvArticles.DataSource = ds;
            lvArticles.DataBind();  
        }
    }

    void CheckAutomaticRenewal(DateTime eDate)
    {
        string userID = Session["userid"].ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, Email, AutomaticRenewal.Status, RemindMe, " +
                "RemindMeStatus FROM Users INNER JOIN AutomaticRenewal ON " +
                "Users.UserID=AutomaticRenewal.UserID WHERE Users.UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                da.Read();
                if (da["Status"].ToString() == "Enabled")
                {
                    int remindMeDays = Convert.ToInt32(da["RemindMe"]);
                    DateTime endDate = Convert.ToDateTime(eDate);
                    DateTime priorDate = endDate.AddDays(-remindMeDays);
                    string remindMeStatus = da["RemindMeStatus"].ToString();
                    string email = da["Email"].ToString();
                    string firstname = da["FirstName"].ToString();

                    if (priorDate < DateTime.Today
                        && remindMeStatus == "Unsent")
                    {
                        try
                        {
                            Helper.SendAutomaticEmail(userID, email,
                            PopulateBody(firstname, endDate));
                        }
                        catch (Exception ex)
                        {
                            Helper.LogException(Session["userid"].ToString(), "Send Automatic Email", ex.ToString());
                        }
                    }
                    if (endDate < DateTime.Today)
                    {
                        AutomaticRenewal(userID);
                    }
                }  
            }
        }
    }

    string PopulateBody(string name, DateTime endDate)
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/Membership/AutomaticRenewalReminderEmailTemplate.html"));
        body = body.Replace("{FirstName}", name);
        body = body.Replace("{EndDate}", endDate.ToShortDateString());
        return body;
    }

    void AutomaticRenewal(string userID)
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
                    cmd.CommandText = "INSERT INTO Memberships VALUES (@UserID, @StartDate, @EndDate, " +
                        "@Length, @MembershipStatus, @Type) SELECT TOP 1 MembershipID FROM Memberships ORDER BY MembershipID DESC";
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@StartDate", DateTime.Now);
                    var totalEndDate = DateTime.Now.AddYears(1);
                    cmd.Parameters.AddWithValue("@EndDate", totalEndDate.ToString("MM/dd/yyyy"));
                    cmd.Parameters.AddWithValue("@Length", 1);
                    cmd.Parameters.AddWithValue("@MembershipStatus", "Inactive");
                    cmd.Parameters.AddWithValue("@Type", "Individual");
                    int membershipId = (int)cmd.ExecuteScalar();

                    cmd.CommandText = "INSERT INTO Payments (MembershipID, PaymentStatus, Amount, DepositSlip) " +
                        "VALUES (@MembershipID, @PaymentStatus, @Amount, @DepositSlip)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@MembershipID", membershipId);
                    cmd.Parameters.AddWithValue("@PaymentStatus", "Unpaid");
                    cmd.Parameters.AddWithValue("@Amount", 1000);
                    cmd.Parameters.AddWithValue("@DepositSlip", "");
                    cmd.ExecuteNonQuery();
                    tran.Commit();

                    Helper.Log(userID, "Membership Renewal", "Automatic Renewal", membershipId.ToString());
                    AutomaticRenewalEmail(totalEndDate, 1000);
                }
                catch (SqlException ex)
                {
                    tran.Rollback();
                    Helper.LogException(Session["userid"].ToString(), "Membership Renewal, Automatic Renewal ",
                            "Exception Type: " + ex.GetType().ToString() + " " +
                            "Exception Message: " + ex.Message.ToString());
                }
            } 
        }
    }

    void AutomaticRenewalEmail(DateTime totalEndDate, int totalPrice)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Email, Street, Municipality, City, " +
            "Phone, Mobile FROM Users WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                da.Read();
                string email = da["Email"].ToString();
                string street = da["Street"].ToString();
                string municipality = da["Municipality"].ToString();
                string city = da["City"].ToString();
                string phone = da["Phone"].ToString();
                string mobile = da["Mobile"].ToString();

                try
                {
                    DateTime sDate = Convert.ToDateTime(DateTime.Now);
                    MailMessage mm = new MailMessage();
                    mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
                    mm.To.Add(email);
                    mm.Subject = "Membership - Automatic Renewal Confirmation";
                    string body = string.Empty;
                    body = File.ReadAllText(Server.MapPath("~/Account/Membership/AutomaticRenewalEmailTemplate.html"));
                    body = body.Replace("{Street}", street);
                    body = body.Replace("{Municipality}", municipality);
                    body = body.Replace("{City}", city);
                    body = body.Replace("{Phone}", phone);
                    body = body.Replace("{Mobile}", mobile);
                    body = body.Replace("{Email}", email);
                    body = body.Replace("{Years}", "1");
                    body = body.Replace("{StartDate}", sDate.ToString("MM/dd/yyyy"));
                    body = body.Replace("{totalEndDate}", totalEndDate.ToString("MM/dd/yyyy"));
                    body = body.Replace("{Gross}", (totalPrice * .88).ToString("₱ #,###.00"));
                    body = body.Replace("{Vat}", (totalPrice * .12).ToString("₱ #,###.00"));
                    body = body.Replace("{Total}", totalPrice.ToString("₱ #,###.00"));
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
                    Helper.LogException(Session["userid"].ToString(), "Membership Renewal, Automatic Renewal Mail ",
                            "Exception Type: " + ex.GetType().ToString() + " " +
                            "Exception Message: " + ex.Message.ToString());
                }
            }
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetArticles();
        GetDates();
    }
}