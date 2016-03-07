﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class Corporate_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateCorporate();
        int corpID = int.Parse(Session["corporateid"].ToString());
        if (!IsPostBack)
        {
            GetEmployerDetails(corpID);
            GetPaymentHistory(corpID);
            GetEmployees(txtSearch.Text);
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
        this.Form.DefaultButton = this.btnSearch.UniqueID;
    }

    void GetEmployees(string keyword)
    {
        using (SqlCommand cmd = new SqlCommand())
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserID, FirstName, LastName, Email, Phone, Mobile, " +
                "Street, Municipality, City, Status FROM Users WHERE " +
                "(UserID LIKE '" + keyword + "%' OR " +
                "FirstName LIKE '" + keyword + "%' OR " +
                "LastName LIKE '" + keyword + "%' OR " +
                "Email LIKE '" + keyword + "%' OR " +
                "Phone LIKE '" + keyword + "%' OR " +
                "Mobile LIKE '" + keyword + "%' OR " +
                "Street LIKE '" + keyword + "%' OR " +
                "Municipality LIKE '" +keyword + "%' OR " +
                "City LIKE '" + keyword + "%' OR " +
                "Status LIKE '" + keyword + "%') AND CorporateID=@corpid ORDER BY LastName ASC";
            cmd.Parameters.AddWithValue("@corpid", Session["corporateid"].ToString());
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Users");
            lvEmployees.DataSource = ds;
            lvEmployees.DataBind();
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

    void GetPaymentHistory(int corpID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP 1 CorporatePaymentID FROM CorporatePayments " +
                              "WHERE CorporateID=@CorporateID ORDER BY CorporatePaymentID DESC";
            cmd.Parameters.AddWithValue("@CorporateID", corpID);
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

    void GetEmployerDetails(int corpID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserName, Name, NatureOfBusiness, Address, Municipality, " +
                              "City, Phone, Fax, Email, Others, Status, EmployerCode, " +
                              "PaymentTerms, Balance, DiscountRate, Length " +
                              "FROM CorporateAccounts INNER JOIN CorporatePayments ON " +
                              "CorporateAccounts.CorporateID=CorporatePayments.CorporateID " +
                              "WHERE CorporateAccounts.CorporateID=@CorporateID";
            cmd.Parameters.AddWithValue("@CorporateID", corpID);
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                if (da.HasRows)
                {
                    while (da.Read())
                    {
                        txtUserName.Text = da["UserName"].ToString();
                        ltEmployerCode.Text = da["EmployerCode"].ToString();
                        txtName.Text = da["Name"].ToString();
                        ddlNature.SelectedValue = da["NatureOfBusiness"].ToString();
                        txtOthers.Text = da["Others"].ToString();
                        txtStatus.Text = da["Status"].ToString();
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
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            string corporateID = Session["corporateid"].ToString();

            con.Open();
            cmd.Connection = con;
            if (txtPassword.Text.Trim() == "")
            {
                cmd.CommandText = "UPDATE CorporateAccounts SET NatureOfBusiness=@NatureOfBusiness, " +
            "Others=@Others,Phone=@Phone, Fax=@Fax, Address=@Address, " +
            "Municipality=@Municipality, City=@City, Email=@Email WHERE CorporateID=@CorporateID";
            }
            else
            {
                cmd.CommandText = "UPDATE CorporateAccounts SET Password=@Password, NatureOfBusiness=@NatureOfBusiness, " +
            "Others=@Others,Phone=@Phone, Fax=@Fax, Address=@Address, " +
            "Municipality=@Municipality, City=@City, Email=@Email WHERE CorporateID=@CorporateID";
            }
            cmd.Parameters.AddWithValue("@NatureOfBusiness", ddlNature.SelectedValue);
            cmd.Parameters.AddWithValue("@Others", txtOthers.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Fax", txtFax.Text);
            cmd.Parameters.AddWithValue("@Address", txtStreet.Text);
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@CorporateID", corporateID);
            cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
            cmd.ExecuteNonQuery();

            Session["employerup"] = "yes";
            Response.Redirect("Default.aspx");
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
                    Helper.LogException(Session["corporateid"].ToString(), "Corporate Account, Corporate Payments ",
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

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetEmployees(txtSearch.Text);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetEmployees(txtSearch.Text);
    }

    protected void lvEmployees_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpEmployees.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetEmployees(txtSearch.Text);
    }

    protected void lvEmployees_DataBound(object sender, EventArgs e)
    {
        dpEmployees.Visible = dpEmployees.PageSize < dpEmployees.TotalRowCount;
    }

}