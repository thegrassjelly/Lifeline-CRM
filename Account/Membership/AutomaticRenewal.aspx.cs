using System;
using System.Data.SqlClient;

public partial class Account_Membership_AutomaticRenewal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetUserInfo();
            GetCurrentMembership();
            GetAutomaticRenewal();

            double cAmount = Convert.ToDouble(1000);
            txtPriceLit.Text = cAmount.ToString("₱ #,###.00");
            txtGross.Text = (cAmount * .88).ToString("₱ #,###.00");
            txtVat.Text = (cAmount * .12).ToString("₱ #,###.00");
        }
        if (Session["password"] != null)
        {
            error.Visible = true;
            Session.Remove("password");
        }
        else if (Session["disabled"] != null)
        {
            disable.Visible = true;
            Session.Remove("disabled");
        }
        else if (Session["enabled"] != null)
        {
            enable.Visible = true;
            Session.Remove("enabled");
        }
    }

    private void GetUserInfo()
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

    void GetCurrentMembership()
    {
        string userID = Session["UserID"].ToString();

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

                cmd.CommandText = "SELECT TOP 1 StartDate FROM Memberships INNER JOIN Payments ON " +
                                  "Memberships.MembershipID=Payments.MembershipID WHERE UserID=@UserID " +
                                  "AND MembershipStatus='Active' AND PaymentStatus='Paid'";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", userID);
                DateTime endDate = (DateTime)cmd.ExecuteScalar();
                DateTime totalEndDate = endDate.AddYears(totalYears);
                txtEndDate.Text = totalEndDate.ToString("D");
            }
        }
        else
        {
            txtEndDate.Text = "N/A";
            nomem.Visible = true;
            btnDisable.Visible = false;
            btnEnable.Visible = false;
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
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                var hasMembership = data.HasRows;
                con.Close();
                return hasMembership;
            }
        }
    }

    void GetAutomaticRenewal()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT RemindMe, Status, Type FROM AutomaticRenewal " +
                "WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    ddlReminder.SelectedValue = data["RemindMe"].ToString();
                    txtStatus.Text = data["Status"].ToString();
                    ddlMembershiptype.SelectedValue = data["Type"].ToString();
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
                bool isCorrect = data.HasRows;
                return isCorrect;
            }
        }
    }

    protected void btnEnable_OnClick(object sender, EventArgs e)
    {
        if (!IsPasswordCorrect())
        {
            Session["password"] = "yes";
            Response.Redirect("~/Account/Membership/AutomaticRenewal.aspx");
        }
        else
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE AutomaticRenewal SET STATUS='Enabled', " +
                    "RemindMe=@RemindMe, Type=@Type, RemindMeStatus='Unsent' WHERE UserID=@UserID";
                cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
                cmd.Parameters.AddWithValue("@RemindMe", ddlReminder.SelectedValue);
                cmd.Parameters.AddWithValue("@Type", ddlMembershiptype.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                Session["enabled"] = "yes";
                Response.Redirect("~/Account/Membership/AutomaticRenewal.aspx");
            }
        }
    }

    protected void btnDisable_OnClick(object sender, EventArgs e)
    {
        if (!IsPasswordCorrect())
        {
            Session["password"] = "yes";
            Response.Redirect("~/Account/Membership/AutomaticRenewal.aspx");
        }
        else
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE AutomaticRenewal SET STATUS='Disabled' " +
                    "WHERE UserID=@UserID";
                cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
                cmd.ExecuteNonQuery();
                con.Close();
                Session["disabled"] = "yes";
                Response.Redirect("~/Account/Membership/AutomaticRenewal.aspx");
            }
        }
    }
}