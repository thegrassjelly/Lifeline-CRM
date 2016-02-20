using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Account_Membership_RenewalTwo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetMembershipInfo();
            GetUserInfo();
            GetPaymentSummary();
            if (txtMembershipType.Text == "Household")
            {
                GetDependents();
                CountDependents();
            }
            else
            {
                txtDep.Text = "N/A";
            }

        }
        this.Form.DefaultButton = this.btnSubmit.UniqueID;
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

    void GetMembershipInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT StartDate, EndDate, Length, PaymentStatus, MembershipStatus, " +
                "Type From Memberships INNER JOIN Payments ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE UserID=@UserID AND Memberships.MembershipID = (SELECT TOP 1 MembershipID FROM Memberships " +
                "ORDER BY MembershipID DESC)";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    DateTime sDate = Convert.ToDateTime(data["StartDate"].ToString());
                    DateTime eDate = Convert.ToDateTime(data["EndDate"].ToString());

                    txtStartDate.Text = sDate.ToString("MM/dd/yyyy");
                    txtEndDate.Text = eDate.ToString("MM/dd/yyyy");
                    txtMembershipLength.Text = data["Length"].ToString();
                    txtPayStatus.Text = data["PaymentStatus"].ToString();
                    txtMembershipType.Text = data["Type"].ToString();
                    txtMemStatus.Text = data["MembershipStatus"].ToString();
                }
            }
        }
    }

    void GetPaymentSummary()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Length, Type, Amount, DepositSlip FROM Memberships " +
                "INNER JOIN Payments ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE Memberships.UserID=@UserID AND Memberships.MembershipID = (SELECT " +
                "TOP 1 MembershipID FROM Memberships ORDER BY MembershipID DESC)";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
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

    void GetDependents()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DependentID, FirstName, LastName FROM Dependents " +
                "WHERE UserID=@UserID AND MembershipID = (SELECT " +
                "TOP 1 MembershipID FROM Memberships WHERE Type='Household'" +
                "AND UserID=@UserID ORDER BY MembershipID DESC) AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@Empty", "");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Dependents");
            lvGetDependents.DataSource = ds;
            lvGetDependents.DataBind();
        }
    }

    void CountDependents()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(FirstName) FROM Dependents " +
                "WHERE UserID=@UserID AND MembershipID = (SELECT " +
                "TOP 1 MembershipID FROM Memberships WHERE Type='Household'" +
                "AND UserID=@UserID ORDER BY MembershipID DESC) AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@Empty", "");
            int depCount = (int)cmd.ExecuteScalar();
            txtDep.Text = depCount.ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Payments SET DepositSlip=@DepositSlip " +
                "FROM Payments INNER JOIN Memberships ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE UserID=@UserID AND Memberships.MembershipID = (SELECT " +
                "TOP 1 MembershipID FROM Memberships ORDER BY MembershipID DESC); " +
                "SELECT TOP 1 MembershipID FROM Memberships ORDER BY MembershipID DESC";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());

            string fileExt = Path.GetExtension(fileDepositSlip.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
            fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));

            int memID = (int)cmd.ExecuteScalar();
            con.Close();
            Helper.Log(Session["userid"].ToString(), "Membership Renewal", "Deposit slip submission", memID.ToString());
            Helper.DepositConfirmation(txtEmail.Text.ToString(), PopulateBody());
            Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
        }
    }

    string PopulateBody()
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/Membership/DepositSlipEmailTemplate.html"));
        return body;
    }
}