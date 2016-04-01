using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Membership_MembershipApplicationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        int ApplicationID = 0;
        bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out ApplicationID);

        if (validID)
        {
            if (!IsPostBack)
            {
                GetBilling(ApplicationID);
                GetApplicationDetails(ApplicationID);
                if (txtMembershipType.Text == "Household")
                {
                    GetDependents(ApplicationID);
                    CountDependents(ApplicationID);
                }
                else
                {
                    txtDep.Text = "N/A";
                }
            }
            else
            {
                Response.Redirect("~/Admin/Membership/MembershipApplications.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Membership/MembershipApplications.aspx");
        }
    }

    void CountDependents(int appID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(FirstName) FROM Dependents " +
                "WHERE MembershipID=@MembershipID AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@MembershipID", appID);
            cmd.Parameters.AddWithValue("@Empty", "");
            int depCount = (int)cmd.ExecuteScalar();
            txtDep.Text = depCount.ToString();
        }
    }

    void GetDependents(int appID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DependentID, FirstName, LastName FROM Dependents " +
                "WHERE MembershipID=@MembershipID AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@MembershipID", appID);
            cmd.Parameters.AddWithValue("@Empty", "");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Dependents");
            lvGetDependents.DataSource = ds;
            lvGetDependents.DataBind();
        }
    }

    void GetApplicationDetails(int appID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT PaymentStatus, Amount, DepositSlip FROM Payments " +
                "WHERE MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@MembershipID", appID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtPaymentStatus.Text = data["PaymentStatus"].ToString();
                    if (data["Amount"].ToString() == "1000.00")
                    {
                        txtMembershipType.Text = "Individual";
                        txtMembershipType2.Text = "Individual";
                    }
                    else
                    {
                        txtMembershipType.Text = "Household";
                        txtMembershipType2.Text = "Household";
                    }
                    txtMembershipLength.Text = "1";
                    txtMembershipYears.Text = "1";

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

    void GetBilling(int appID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Street, Municipality, " +
                "City, Phone, Mobile, Email, Status, DateSubmitted From Applications " +
                "WHERE ApplicationID=@ApplicationID";
            cmd.Parameters.AddWithValue("@ApplicationID", appID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    DateTime sDate = Convert.ToDateTime(data["DateSubmitted"].ToString());

                    txtFN.Text = data["FirstName"].ToString();
                    txtLN.Text = data["LastName"].ToString();
                    txtStreet.Text = data["Street"].ToString();
                    txtMunicipality.Text = data["Municipality"].ToString();
                    txtCity.Text = data["City"].ToString();
                    txtPhone.Text = data["Phone"].ToString();
                    txtMobile.Text = data["Mobile"].ToString();
                    txtEmail.Text = data["Email"].ToString();
                    txtMembershipStatus.Text = data["Status"].ToString();
                    if (txtMembershipStatus.Text == "Voided")
                    {
                        btnSubmit.Visible = false;
                        btnVoid.Visible = false;
                        btnUpload.Visible = false;
                        fileDepositSlip.Visible = false;
                    }
                    else if (txtMembershipStatus.Text == "Active")
                    {
                        btnSubmit.Visible = false;
                        btnUpload.Visible = false;
                        fileDepositSlip.Visible = false;
                    }
                    txtStartDate.Text = sDate.ToString("MM/dd/yyyy");
                    txtEndDate.Text = sDate.AddYears(1).ToString("MM/dd/yyyy");
                }
            }

            cmd.CommandText = "SELECT Status, UserType FROM Users INNER JOIN Types ON " +
                "Users.TypeID=Types.TypeID WHERE UserID=(SELECT UserID FROM Applications " +
                "WHERE ApplicationID=@ApplicationID)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ApplicationID", appID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtUserStatus.Text = data["Status"].ToString();
                    txtUserType.Text = data["UserType"].ToString();
                }
            }
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Payments SET DepositSlip=@DepositSlip " +
                "FROM Payments WHERE MembershipID=@AppID";
            cmd.Parameters.AddWithValue("@AppID", Request.QueryString["ID"].ToString());

            string fileExt = Path.GetExtension(fileDepositSlip.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
            fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));

            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Membership/MembershipApplicationDetails.aspx?ID=" + Request.QueryString["ID"].ToString());

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            var appID = Request.QueryString["ID"].ToString();

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Applications SET Status=@Status " +
                "WHERE ApplicationID=@appID";
            cmd.Parameters.AddWithValue("@Status", "Active");
            cmd.Parameters.AddWithValue("@appID", appID);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE Payments SET PaymentStatus=@PaymentStatus " +
                "WHERE MembershipID=@appID";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@PaymentStatus", "Paid");
            cmd.Parameters.AddWithValue("@appID", appID);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE Users SET TypeID=(SELECT TypeID FROM Types WHERE " +
                "UserType=@UserType) WHERE UserID=(SELECT UserID FROM Applications WHERE " +
                "ApplicationID=@appID)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@appID", appID);
            cmd.Parameters.AddWithValue("@UserType", "Client");
            cmd.ExecuteNonQuery();

            Response.Redirect("~/Admin/Membership/MembershipApplicationDetails.aspx?ID=" + appID);
        }
    }

    protected void btnVoid_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Membership/ApplicationVoid.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}