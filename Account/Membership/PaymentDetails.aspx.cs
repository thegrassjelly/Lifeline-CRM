using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Account_Membership_PaymentDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (Request.QueryString["ID"] != null)
        {
            int membershipID = 0;
            bool validMemID = int.TryParse(Request.QueryString["ID"].ToString(), out membershipID);

            if (validMemID)
            {
                if (!IsPostBack)
                {
                    GetMembershipInfo(membershipID);
                    GetUserInfo();
                    GetPaymentSummary(membershipID);
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
                Response.Redirect("~/Account/Membership/Payments.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Account/Membership/Payments.aspx");
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

    void GetMembershipInfo(int membershipID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT StartDate, EndDate, Length, PaymentStatus, MembershipStatus, " +
                "Type From Memberships INNER JOIN Payments ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE UserID=@UserID AND Memberships.MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
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
                    txtPayStatus.Text = data["PaymentStatus"].ToString();
                    txtMembershipType.Text = data["Type"].ToString();
                    txtMemStatus.Text = data["MembershipStatus"].ToString();
                }
            }
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
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
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

    void GetDependents(int membershipID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DependentID, FirstName, LastName FROM Dependents " +
                "WHERE UserID=@UserID AND MembershipID=@MembershipID AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
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
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@MembershipID", membershipID);
            cmd.Parameters.AddWithValue("@Empty", "");
            int depCount = (int)cmd.ExecuteScalar();
            txtDep.Text = depCount.ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string memID = Request.QueryString["ID"].ToString();
        string userID = Session["userid"].ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Payments SET DepositSlip=@DepositSlip " +
                "FROM Payments INNER JOIN Memberships ON Memberships.MembershipID=Payments.MembershipID " +
                "WHERE UserID=@UserID AND Memberships.MembershipID=@MembershipID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@MembershipID", memID);
            string fileExt = Path.GetExtension(fileDepositSlip.FileName);
            string id = Guid.NewGuid().ToString();
            if (fileDepositSlip.HasFile)
            {
                cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
                fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));
            }
            else
            {
                cmd.Parameters.AddWithValue("@DepositSlip", "~/scans/placeholder.png");
            }
            cmd.ExecuteNonQuery();
            con.Close();
            Helper.Log(userID, "Membership Renewal", "Deposit slip submission", memID);
            Helper.DepositConfirmation(txtEmail.Text.ToString(), PopulateBody());
            Response.Redirect("~/Account/Membership/PaymentDetails.aspx?ID=" + memID);
        }
    }

    string PopulateBody()
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/Membership/DepositSlipEmailTemplate.html"));
        return body;
    }
}