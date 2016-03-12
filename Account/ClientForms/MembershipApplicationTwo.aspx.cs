using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Account_ClientForms_MembershipApplicationTwo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsApplied())
        {
            Response.Redirect("~/Account/ClientForms/MembershipApplication.aspx");
        }
        else
        {
            GetBilling();
            GetApplicationDetails();
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

    bool IsApplied()
    {
        bool hasApplied = false;
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ApplicationID FROM Applications " +
                              "WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataReader data = cmd.ExecuteReader();
            if (data.HasRows)
                hasApplied = true;
            else
                hasApplied = false;
            return hasApplied;
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
                "TOP 1 ApplicationID FROM Applications WHERE UserID=@UserID) " +
                "AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@Empty", "");
            int depCount = (int)cmd.ExecuteScalar();
            txtDep.Text = depCount.ToString();
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
                "WHERE UserID=@UserID AND MembershipID = (SELECT TOP 1 ApplicationID FROM  " +
                "Applications WHERE UserID=@UserID) AND FirstName != @Empty";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@Empty", "");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Dependents");
            lvGetDependents.DataSource = ds;
            lvGetDependents.DataBind();
        }
    }

    void GetApplicationDetails()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT PaymentStatus, Amount, DepositSlip FROM Payments " +
                "WHERE MembershipID = (SELECT TOP 1 ApplicationID FROM Applications WHERE " +
                "UserID=@UserID)";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtPayStatus.Text = data["PaymentStatus"].ToString();
                    if (data["Amount"].ToString() == "1000.00")
                    {
                        txtMembershipType.Text = "Individual";
                    }
                    else
                    {
                        txtMembershipType.Text = "Household";
                    }
                    if (txtPayStatus.Text == "Paid")
                    {
                        txtMemStatus.Text = "Active";
                    }
                    else
                    {
                        txtMemStatus.Text = "Inactive";
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
                        btnSubmit.Visible = false;
                        fileDepositSlip.Visible = false;
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

    void GetBilling()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Street, Municipality, " +
                "City, Phone, Mobile, Email, DateSubmitted From Applications " +
                "WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
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
                    txtStartDate.Text = sDate.ToString("MM/dd/yyyy");
                    txtEndDate.Text = sDate.AddYears(1).ToString("MM/dd/yyyy");
                }
            }
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
                "FROM Payments WHERE MembershipID = (SELECT " +
                "TOP 1 ApplicationID FROM Applications WHERE UserID=@UserID) " +
                "SELECT Top 1 ApplicationID FROM Applications WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());

            string fileExt = Path.GetExtension(fileDepositSlip.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
            fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));

            int AppID = (int)cmd.ExecuteScalar();
            con.Close();

            Helper.Log(Session["userid"].ToString(), "Membership Application", "Deposit slip submission", AppID.ToString());
            try
            {
                Helper.DepositConfirmation(txtEmail.Text, PopulateBody());
            }
            catch (Exception ex)
            {
                Helper.LogException(Session["userid"].ToString(), "Membership Application - Payment",
                            "Exception Type: " + ex.GetType().ToString() + " " +
                            "Exception Message: " + ex.Message.ToString());
            }
            finally
            {
                Response.Redirect("~/Account/ClientForms/MembershipApplicationTwo.aspx");
            }
        }
    }

    string PopulateBody()
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/ClientForms/DepositSlipEmailTemplate.html"));
        return body;
    }
}