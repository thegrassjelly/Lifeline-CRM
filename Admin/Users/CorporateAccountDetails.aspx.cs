using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class Admin_Users_CorporateAccountDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int corporateID = 0;
            bool validCorporateID = int.TryParse(Request.QueryString["ID"].ToString(), out corporateID);

            if (validCorporateID)
            {
                if (!IsPostBack)
                {
                    GetEmployerDetails(corporateID);
                    GetPaymentHistory(corporateID);
                    if (Session["employerup"] != null)
                    {
                        employer_up.Visible = true;
                        Session.Remove("employerup");
                    }
                    else
                    {
                        employer_up.Visible = false;
                    }
                    if (Session["dberror"] != null)
                    {
                        db_error.Visible = true;
                        Session.Remove("dberror");
                    }
                }
            }
            else
            {
                Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
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

    void GetPaymentHistory(int corporateID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP 1 CorporatePaymentID FROM CorporatePayments " +
                              "WHERE CorporateID=@CorporateID ORDER BY CorporatePaymentID DESC";
            cmd.Parameters.AddWithValue("@CorporateID", corporateID);
            Session["corporatePaymentID"] = (int)cmd.ExecuteScalar();

            cmd.CommandText = "SELECT DepositID, PaymentDate, Amount FROM DepositPayments " +
                              "WHERE CorporatePaymentID=@CorporatePaymentID ORDER BY DepositID DESC";
            cmd.Parameters.AddWithValue("@CorporatePaymentID", Session["corporatePaymentID"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lvPaymentHistory.DataSource = ds;
            lvPaymentHistory.DataBind();  
        }
    }

    void SortPaymentHistory(string column, string dir)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DepositID, PaymentDate, Amount FROM DepositPayments " +
                              "WHERE CorporatePaymentID=@CorporatePaymentID ORDER BY " + column + " " + dir;
            cmd.Parameters.AddWithValue("@CorporatePaymentID", Session["corporatePaymentID"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lvPaymentHistory.DataSource = ds;
            lvPaymentHistory.DataBind(); 
        }
    }

    void GetEmployerDetails(int corporateID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Name, NatureOfBusiness, Address, Municipality, " +
                              "City, Phone, Fax, Email, Others, Status, EmployerCode, " +
                              "PaymentTerms, Balance, DiscountRate, Length " +
                              "FROM CorporateAccounts INNER JOIN CorporatePayments ON " +
                              "CorporateAccounts.CorporateID=CorporatePayments.CorporateID " +
                              "WHERE CorporateAccounts.CorporateID=@CorporateID";
            cmd.Parameters.AddWithValue("@CorporateID", corporateID);
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                if (da.HasRows)
                {
                    while (da.Read())
                    {
                        ltEmployerCode.Text = da["EmployerCode"].ToString();
                        txtName.Text = da["Name"].ToString();
                        ddlNature.SelectedValue = da["NatureOfBusiness"].ToString();
                        txtOthers.Text = da["Others"].ToString();
                        ddlStatus.SelectedValue = da["Status"].ToString();
                        txtPhone.Text = da["Phone"].ToString();
                        txtFax.Text = da["Fax"].ToString();
                        txtStreet.Text = da["Address"].ToString();
                        txtMunicipality.Text = da["Municipality"].ToString();
                        txtCity.Text = da["City"].ToString();
                        txtEmail.Text = da["Email"].ToString();
                        txtLength.Text = da["Length"].ToString();
                        txtPaymentTerms.Text = da["PaymentTerms"].ToString();
                        txtDiscountRate.Text = da["DiscountRate"].ToString();
                        Session["corporatebalance"] = da["Balance"].ToString();
                        double bal = Convert.ToDouble(da["Balance"].ToString());
                        txtBalance.Text = bal.ToString("₱ #,###.00");
                        if (bal <= 0) 
                        {
                            txtDepositAmount.Visible = false;
                            btnSubmit.Visible = false;
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
                }  
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            string corporateID = Request.QueryString["ID"].ToString();

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE CorporateAccounts SET Name=@Name, NatureOfBusiness=@NatureOfBusiness, " +
                              "Others=@Others, Status=@Status, Phone=@Phone, Fax=@Fax, Address=@Address, " +
                              "Municipality=@Municipality, City=@City, Email=@Email WHERE CorporateID=@CorporateID";
            cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
            cmd.Parameters.AddWithValue("@NatureOfBusiness", ddlNature.SelectedValue);
            cmd.Parameters.AddWithValue("@Others", txtOthers.Text.ToString());
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.ToString());
            cmd.Parameters.AddWithValue("@Fax", txtFax.Text.ToString());
            cmd.Parameters.AddWithValue("@Address", txtStreet.Text.ToString());
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
            cmd.Parameters.AddWithValue("@City", txtCity.Text.ToString());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
            cmd.Parameters.AddWithValue("@CorporateID", corporateID);
            cmd.ExecuteNonQuery();

            Session["employerup"] = "yes";
            Response.Redirect(Request.RawUrl); 
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        int corporateID = Convert.ToInt32(Request.QueryString["ID"]);
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortPaymentHistory(ddlSortBy.SelectedValue, ddlDirection.SelectedValue);
        }
        else
        {
            GetPaymentHistory(corporateID);
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortPaymentHistory(sortBy, direction);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortPaymentHistory(sortBy, direction);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
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
                    cmd.CommandText = "INSERT INTO DepositPayments (CorporatePaymentID, " +
                                      "DepositSlip, PaymentDate, Amount) VALUES (@CorporatePaymentID, " +
                                      "@DepositSlip, @PaymentDate, @Amount)";
                    cmd.Parameters.AddWithValue("@CorporatePaymentID", Session["corporatePaymentID"].ToString());
                    string fileExt = Path.GetExtension(fileDepositSlip.FileName);
                    string id = Guid.NewGuid().ToString();
                    cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
                    fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));
                    cmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);
                    if (txtDepositAmount.Text.Trim() == "")
                    {
                        cmd.Parameters.AddWithValue("@Amount", "");
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                    cmd.Parameters.AddWithValue("@Amount", txtDepositAmount.Text);
                    cmd.ExecuteNonQuery();
                    

                    double grossAmount = Convert.ToDouble(Session["corporatebalance"].ToString()) -
                    Convert.ToDouble(txtDepositAmount.Text);
                    cmd.CommandText = "UPDATE CorporatePayments SET Balance=@Balance " +
                                      "WHERE CorporatePaymentID=@CorporatePaymentID";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@Balance", grossAmount);
                    cmd.Parameters.AddWithValue("@CorporatePaymentID", Session["corporatePaymentID"].ToString());
                    cmd.ExecuteNonQuery();
                    Session.Remove("corporatebalance");
                    }
                    tran.Commit();
                }
                catch (SqlException ex)
                {
                    tran.Rollback();
                    Session["dberror"] = "yes";
                    Helper.LogException(Session["userid"].ToString(), "User Management, Corporate Payments ",
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
