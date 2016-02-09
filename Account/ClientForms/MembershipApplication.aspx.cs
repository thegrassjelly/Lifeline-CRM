using System;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class Account_ClientForms_MembershipApplication : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetUserInfo();
        }
        if (Session["password"] != null)
        {
            error.Visible = true;
            Session.Remove("password");
        }
    }

    void GetUserInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, Street, Municipality, " +
                "City, Phone, Mobile, Email From Users WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtFirstName.Text = data["FirstName"].ToString();
                    txtLastName.Text = data["LastName"].ToString();
                    DateTime bDay = Convert.ToDateTime(data["Birthday"].ToString());
                    txtBday.DbSelectedDate = bDay.ToString("MM/dd/yyyy");
                    txtStreet.Text = data["Street"].ToString();
                    txtMunicipality.Text = data["Municipality"].ToString();
                    txtCity.Text = data["City"].ToString();
                    txtPhone.Text = data["Phone"].ToString();
                    txtMobile.Text = data["Mobile"].ToString();
                    txtEmail.Text = data["Email"].ToString();
                }
            }
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
                var isCorrect = data.HasRows;
                return isCorrect;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var UserID = Session["userid"].ToString();

        if (!IsPasswordCorrect())
        {
            Session["password"] = "yes";
            Response.Redirect("~/Account/ClientForms/MembershipApplication.aspx");
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
                        cmd.CommandText = "INSERT INTO Applications VALUES (@UserID, @Email, @FirstName, " +
                            "@LastName, @Birthday, @Street, @Municipality, @City, @Phone, @Mobile, " +
                            "@DateSubmitted) SELECT TOP 1 ApplicationID FROM Applications " +
                            "ORDER BY ApplicationID DESC";
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
                        cmd.Parameters.AddWithValue("@Birthday", txtBday.SelectedDate);
                        cmd.Parameters.AddWithValue("@Street", txtStreet.Text.ToString());
                        cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
                        cmd.Parameters.AddWithValue("@City", txtCity.Text.ToString());
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.ToString());
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.ToString());
                        cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);
                        int ApplicationID = (int)cmd.ExecuteScalar();

                        cmd.Connection = con;
                        cmd.CommandText = "UPDATE MedicalInfo SET BloodType=@BloodType, Allergies=@Allergies, " +
                            "CancerHis=@CancerHis, HeartHis=@HeartHis, AsthmaHis=@AsthmaHis, EpilepsyHis=@EpilepsyHis, " +
                            "LiverHis=@LiverHis, Others=@Others WHERE UserID=@UserID";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@BloodType", ddlBloodType.SelectedValue);
                        cmd.Parameters.AddWithValue("@Allergies", txtAllergies.Text.ToString());
                        cmd.Parameters.AddWithValue("@CancerHis", ddlCancerHis.SelectedValue);
                        cmd.Parameters.AddWithValue("@HeartHis", ddlHeartHis.SelectedValue);
                        cmd.Parameters.AddWithValue("@AsthmaHis", ddlAsthmaHis.SelectedValue);
                        cmd.Parameters.AddWithValue("@EpilepsyHis", ddlEpilepsyHis.SelectedValue);
                        cmd.Parameters.AddWithValue("@LiverHis", ddlLiverHis.SelectedValue);
                        cmd.Parameters.AddWithValue("@Others", txtOthers.Text.ToString());
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "INSERT INTO Payments (MembershipID, PaymentStatus, Amount, DepositSlip) " +
                            "VALUES (@MembershipID, @PaymentStatus, @Amount, @DepositSlip)";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@MembershipID", ApplicationID);
                        cmd.Parameters.AddWithValue("@PaymentStatus", "Unpaid");
                        if (ddlMembershiptype.SelectedItem.ToString() == "Household")
                        {
                            cmd.Parameters.AddWithValue("@Amount", 3000);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@Amount", 1000);
                        }
                        cmd.Parameters.AddWithValue("@DepositSlip", "");
                        cmd.ExecuteNonQuery();
                        tran.Commit();

                        var totalEndDate = DateTime.Now.AddYears(1);
                        Helper.Log(Session["userid"].ToString(), "Membership Application", "New Submission", ApplicationID.ToString());
                        if (ddlMembershiptype.SelectedItem.ToString() == "Household")
                        {
                            SendConfirmation(totalEndDate, 3000);
                            Response.Redirect("~/Account/ClientForms/AddDependents.aspx");
                        }
                        else
                        {
                            SendConfirmation(totalEndDate, 1000);
                            Response.Redirect("~/Account/ClientForms/MembershipApplicationTwo.aspx");
                        }


                    }
                    catch (SqlException ex)
                    {
                        tran.Rollback();
                        db_error.Visible = true;
                        Helper.LogException(Session["userid"].ToString(), "Membership Application, Client Forms ",
                                "Exception Type: " + ex.GetType().ToString() + " " +
                                "Exception Message: " + ex.Message.ToString());
                    }


                }
            }
        }
    }

    void SendConfirmation(DateTime totalEndDate, int totalPrice)
    {
        try
        {
            DateTime sDate = Convert.ToDateTime(DateTime.Now);
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("lifelineambulancerescue@gmail.com");
            mm.To.Add(txtEmail.Text.Trim());
            mm.Subject = "Membership - Membership Renewal Confirmation";
            string body = string.Empty;
            body = File.ReadAllText(Server.MapPath("~/Account/ClientForms/ApplicationEmailTemplate.html"));
            body = body.Replace("{Street}", txtStreet.Text.ToString());
            body = body.Replace("{Municipality}", txtMunicipality.Text.ToString());
            body = body.Replace("{City}", txtCity.Text.ToString());
            body = body.Replace("{Phone}", txtPhone.Text.ToString());
            body = body.Replace("{Mobile}", txtMobile.Text.ToString());
            body = body.Replace("{Email}", txtEmail.Text.ToString());
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
            if (ddlMembershiptype.SelectedItem.ToString() == "Household")
            {
                Response.Redirect("~/Account/ClientForms/AddDependents.aspx");
            }
            else
            {
                Response.Redirect("~/Account/ClientForms/MembershipApplicationTwo.aspx");
            }
        }
        catch (SmtpException ex)
        {
            Helper.LogException(Session["userid"].ToString(), "Membership Application, Send Mail ",
                    "Exception Type: " + ex.GetType().ToString() + " " +
                    "Exception Message: " + ex.Message.ToString());
        }
    }
}