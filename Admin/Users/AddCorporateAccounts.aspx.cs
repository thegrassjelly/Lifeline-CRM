using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Users_AddCorporateAccounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Session["employer"] != null)
        {
            employer.Visible = true;
            Session.Remove("employer");
        }
        if (Session["transacterror"] != null)
        {
            db_error.Visible = true;
            Session.Remove("transacterror");
        }
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
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
                    string guid = Guid.NewGuid().ToString();
                    string employerCode = guid.Remove(guid.Length - 28);

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO CorporateAccounts (Name, NatureOfBusiness, " +
                                      "Address, Municipality, City, Phone, Fax, Email, Others, Status, DateAdded, EmployerCode) " +
                                      "VALUES (@Name, @NatureOfBusiness, @Address, @Municipality, @City, @Phone, " +
                                      "@Fax, @Email, @Others, @Status, @DateAdded, @EmployerCode); SELECT TOP 1 CorporateID " +
                                      "FROM CorporateAccounts ORDER By CorporateID DESC";
                    cmd.Parameters.AddWithValue("@Name", txtCompanyName.Text.ToString());
                    cmd.Parameters.AddWithValue("@NatureOfBusiness", ddlNature.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtStreet.Text.ToString());
                    cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
                    cmd.Parameters.AddWithValue("@City", txtCity.Text.ToString());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.ToString());
                    cmd.Parameters.AddWithValue("@Fax", txtFax.Text.ToString());
                    cmd.Parameters.AddWithValue("@Others", txtOthers.Text.ToString());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                    cmd.Parameters.AddWithValue("@EmployerCode", employerCode);
                    int corporateID = (int) cmd.ExecuteScalar();

                    cmd.CommandText = "INSERT INTO CorporatePayments (CorporateID, PaymentTerms, Balance, " +
                                      "DiscountRate, Length) VALUES " +
                                      "(@CorporateID, @PaymentTerms, @Balance, @DiscountRate, @Length)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@CorporateID", corporateID);
                    cmd.Parameters.AddWithValue("@PaymentTerms", ddlPaymentTerms.SelectedValue);
                    if (txtBalance.Text == "")
                    {
                        cmd.Parameters.AddWithValue("@Balance", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Balance", txtBalance.Text.ToString());
                    }
                    if (txtDiscountRate.Text == "")
                    {
                        cmd.Parameters.AddWithValue("@DiscountRate", 0);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@DiscountRate", txtDiscountRate.Text.ToString());
                    }
                    cmd.Parameters.AddWithValue("@Length", txtLength.Text.ToString());
                    cmd.ExecuteNonQuery();
                    tran.Commit();

                    Session["employer"] = "yes";
                }
                catch (SqlException ex)
                {
                    tran.Rollback();
                    Session["transacterror"] = "yes";
                    Helper.LogException(Session["userid"].ToString(), "User Management, Add Corporate Accounts ",
                        "Exception Type: " + ex.GetType().ToString() + " " +
                        "Exception Message: " + ex.Message.ToString());
                }
                finally
                {
                    Response.Redirect(Request.RawUrl);
                }
            } 
        }
    }
}