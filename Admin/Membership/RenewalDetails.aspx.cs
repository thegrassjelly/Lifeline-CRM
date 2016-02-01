using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Membership_RenewalsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int membershipID = 0;
            bool validMemID = int.TryParse(Request.QueryString["ID"].ToString(), out membershipID);

            if (validMemID)
            {
                if (!IsPostBack)
                {
                    GetMembershipInfo(membershipID);
                    GetPaymentSummary(membershipID);
                    GetUserInfo();
                    GetTypes();
                    if (txtMembershipType.Text == "Household")
                    {
                        GetDependents(membershipID);
                        CountDependents(membershipID);
                    }
                    else
                    {
                        txtDep.Text = "N/A";
                    }
                }
            }
            else
            {
                Response.Redirect("~/Admin/Membership/Renewals.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Membership/Renewals.aspx");
        }
    }

    void GetMembershipInfo(int membershipID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserID, StartDate, EndDate, Length, PaymentStatus, MembershipStatus, " +
                "Type From Memberships INNER JOIN Payments ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE Memberships.MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@MembershipID", membershipID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    DateTime sDate = Convert.ToDateTime(data["StartDate"].ToString());
                    DateTime eDate = Convert.ToDateTime(data["EndDate"].ToString());

                    txtStartDate.Text = sDate.ToString("MM/dd/yyyy");
                    txtEndDate.Text = eDate.ToString("MM/dd/yyyy");
                    txtMembershipLength.Text = data["Length"].ToString();
                    ddlPaymentStatus.SelectedValue = data["PaymentStatus"].ToString();
                    txtMembershipType.Text = data["Type"].ToString();
                    ddlMembershipStatus.SelectedValue = data["MembershipStatus"].ToString();
                    Session["localUserID"] = data["UserID"].ToString();
                }  
            }
        }
    }

    void GetTypes()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TypeID, UserType FROM Types";
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                ddlUserType.DataSource = dr;
                ddlUserType.DataTextField = "UserType";
                ddlUserType.DataValueField = "TypeID";
                ddlUserType.DataBind();  
            }
        }
    }

    void GetUserInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, UserPic, " +
                "Street, Municipality, City, Phone, Mobile, Email, Status, Priority, " +
                "TypeID FROM Users WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["localUserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtFirstName.Text = data["FirstName"].ToString();
                        txtLastName.Text = data["LastName"].ToString();
                        DateTime bDay = Convert.ToDateTime(data["Birthday"].ToString());
                        txtBday.Text = bDay.ToString("MM/dd/yyyy");
                        imgUser.ImageUrl = "~/images/users/" + data["UserPic"].ToString();
                        imgUserLb.NavigateUrl = "~/images/users/" + data["UserPic"].ToString();
                        txtStreet.Text = data["Street"].ToString();
                        txtMunicipality.Text = data["Municipality"].ToString();
                        txtCity.Text = data["City"].ToString();
                        txtPhone.Text = data["Phone"].ToString();
                        txtMobile.Text = data["Mobile"].ToString();
                        txtEmail.Text = data["Email"].ToString();
                        txtUserStatus.Text = data["Status"].ToString();
                        ddlUserType.Text = data["TypeID"].ToString();
                        txtUserPriority.Text = data["Priority"].ToString();
                    }
                }  
            }
        }
    }

    void GetDependents(int membershipID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DependentID, FirstName, LastName FROM Dependents " +
                "WHERE UserID=@UserID AND MembershipID=@MembershipID AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["localUserID"].ToString());
            cmd.Parameters.AddWithValue("@MembershipID", membershipID);
            cmd.Parameters.AddWithValue("@Empty", "");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Dependents");
            lvGetDependents.DataSource = ds;
            lvGetDependents.DataBind(); 
        }
    }

    void CountDependents(int membershipID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(FirstName) FROM Dependents " +
                "WHERE UserID=@UserID AND MembershipID=@MembershipID AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["localUserID"].ToString());
            cmd.Parameters.AddWithValue("@MembershipID", membershipID);
            cmd.Parameters.AddWithValue("@Empty", "");
            int depCount = (int)cmd.ExecuteScalar();
            txtDep.Text = depCount.ToString(); 
        }
    }

    void GetPaymentSummary(int membershipID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Length, Type, Amount, DepositSlip FROM Memberships " +
                "INNER JOIN Payments ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE Memberships.UserID=@UserID AND Memberships.MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@UserID", Session["localUserID"].ToString());
            cmd.Parameters.AddWithValue("@MembershipID", membershipID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtRenewYears.Text = data["Length"].ToString();
                    txtRenewalType.Text = data["Type"].ToString();
                    Double cAmount = Convert.ToDouble(data["Amount"].ToString());
                    txtPriceLit.Text = cAmount.ToString("₱ #,###.00");
                    txtGross.Text = (cAmount * .88).ToString("₱ #,###.00");
                    txtVat.Text = (cAmount * .12).ToString("₱ #,###.00");
                    if (data["DepositSlip"].ToString() != "")
                    {
                        imgDepositSlip.ImageUrl = "~/scans/" + data["DepositSlip"].ToString();
                        imgDepositSlipLb.NavigateUrl = "~/scans/" + data["DepositSlip"].ToString();
                    }
                    else
                    {
                        imgDepositSlip.ImageUrl = "~/scans/placeholder.png";
                        imgDepositSlipLb.NavigateUrl = "~/scans/placeholder.png";
                    }
                }  
            }
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            var memID = Request.QueryString["ID"].ToString();

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Payments SET DepositSlip=@DepositSlip " +
                "FROM Payments INNER JOIN Memberships ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE UserID=@UserID AND Memberships.MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@UserID", Session["localUserID"].ToString());
            cmd.Parameters.AddWithValue("@MembershipID", memID);

            string fileExt = Path.GetExtension(fileDepositSlip.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
            fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));

            cmd.ExecuteNonQuery();
            Helper.Log(Session["userid"].ToString(), "Membership Renewal", "Deposit slip submission", memID.ToString());
            Response.Redirect("~/Admin/Membership/RenewalDetails.aspx?ID=" + memID); 
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            var memID = Request.QueryString["ID"].ToString();

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Memberships SET MembershipStatus=@MembershipStatus " +
                "WHERE MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@MembershipStatus", ddlMembershipStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@MembershipID", memID);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE Payments SET PaymentStatus=@PaymentStatus " +
                "WHERE MembershipID=@MembershipID";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@PaymentStatus", ddlPaymentStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@MembershipID", memID);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE Users SET TypeID=@TypeID " +
                "WHERE UserID=@UserID";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", Session["localUserID"].ToString());
            cmd.Parameters.AddWithValue("@TypeID", ddlUserType.SelectedValue);
            cmd.ExecuteNonQuery();

            Response.Redirect("~/Admin/Membership/RenewalDetails.aspx?ID=" + memID); 
        }
    }

    protected void btnVoid_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Membership/VoidRenewal.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}