using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Account_Membership_Renewal : System.Web.UI.Page
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

    [WebMethod]
    public static List<string> SearchCity(string prefixText)
    {

        List<string> cities = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT Name FROM Cities WHERE " +
                    "Name LIKE @SearchText + '%'";
            cmd.Parameters.AddWithValue("@SearchText", prefixText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    cities.Add(dr["Name"].ToString());
                }
            }
            con.Close();
        }
        return cities;
    }

    void GetUserInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Street, Municipality, " +
                "City, Phone, Mobile, Email From Users WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtFN.Text = data["FirstName"].ToString();
                    txtLN.Text = data["LastName"].ToString();
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
            Response.Redirect("~/Account/Membership/Renewal.aspx");
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
                        cmd.CommandText = "INSERT INTO Memberships VALUES (@UserID, @StartDate, @EndDate, " +
                            "@Length, @MembershipStatus, @Type) SELECT TOP 1 MembershipID FROM Memberships ORDER BY MembershipID DESC";
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@StartDate", DateTime.Now);

                        var RenewYears = int.Parse(txtRenewYears.Text);
                        var totalEndDate = Convert.ToDateTime(DateTime.Now.AddYears(RenewYears));
                        var totalPrice = RenewYears * 1000;
                        var householdPrice = RenewYears * 3000;

                        cmd.Parameters.AddWithValue("@EndDate", totalEndDate.ToString("MM/dd/yyyy"));
                        cmd.Parameters.AddWithValue("@Length", txtRenewYears.Text.ToString());
                        cmd.Parameters.AddWithValue("@MembershipStatus", "Inactive");
                        cmd.Parameters.AddWithValue("@Type", ddlMembershiptype.SelectedValue);
                        int MembershipID = (int)cmd.ExecuteScalar();

                        cmd.CommandText = "INSERT INTO Payments (MembershipID, PaymentStatus, Amount, DepositSlip) " +
                            "VALUES (@MembershipID, @PaymentStatus, @Amount, @DepositSlip)";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@MembershipID", MembershipID);
                        cmd.Parameters.AddWithValue("@PaymentStatus", "Unpaid");
                        if (ddlMembershiptype.SelectedItem.ToString() == "Household")
                        {
                            cmd.Parameters.AddWithValue("@Amount", householdPrice);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@Amount", totalPrice);
                        }
                        cmd.Parameters.AddWithValue("@DepositSlip", "");
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "UPDATE Users SET Street=@Street, Municipality=@Municipality, " +
                            "City=@City, Phone=@Phone, Mobile=@Mobile, " +
                            "Email=@Email FROM Users WHERE UserID=@UserID";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@Street", txtCity.Text);
                        cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
                        cmd.Parameters.AddWithValue("@City", txtCity.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.ExecuteNonQuery();
                        tran.Commit();

                        Helper.Log(Session["userid"].ToString(), "Membership Renewal", "New Submission", MembershipID.ToString());
                        if (ddlMembershiptype.SelectedItem.ToString() == "Household")
                        {
                            SendConfirmation(totalEndDate, householdPrice);
                            Response.Redirect("~/Account/Membership/AddDependents.aspx");
                        }
                        else
                        {
                            SendConfirmation(totalEndDate, totalPrice);
                            Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
                        }
                    }
                    catch (SqlException ex)
                    {
                        tran.Rollback();
                        db_error.Visible = true;
                        Helper.LogException(Session["userid"].ToString(), "Membership Renewal, Renewal Form ",
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
            body = File.ReadAllText(Server.MapPath("~/Account/Membership/RenewalEmailTemplate.html"));
            body = body.Replace("{Street}", txtStreet.Text.ToString());
            body = body.Replace("{Municipality}", txtMunicipality.Text.ToString());
            body = body.Replace("{City}", txtCity.Text.ToString());
            body = body.Replace("{Phone}", txtPhone.Text.ToString());
            body = body.Replace("{Mobile}", txtMobile.Text.ToString());
            body = body.Replace("{Email}", txtEmail.Text.ToString());
            body = body.Replace("{Years}", txtRenewYears.Text.ToString());
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
                Response.Redirect("~/Account/Membership/AddDependents.aspx");
            }
            else
            {
                Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
            }
        }
        catch (SmtpException ex)
        {
            Helper.LogException(Session["userid"].ToString(), "Membership Renewal, Send Mail ",
                    "Exception Type: " + ex.GetType().ToString() + " " +
                    "Exception Message: " + ex.Message.ToString());
        }
    }

}