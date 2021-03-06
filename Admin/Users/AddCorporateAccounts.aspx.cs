﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

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
                    string yearNow = DateTime.Now.Year.ToString();

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO CorporateAccounts (UserName, Password, Name, NatureOfBusiness, " +
                                      "Address, Municipality, City, Phone, Fax, Email, Others, Status, DateAdded, EmployerCode) " +
                                      "VALUES (@UserName, @Password, @Name, @NatureOfBusiness, @Address, @Municipality, @City, @Phone, " +
                                      "@Fax, @Email, @Others, @Status, @DateAdded, @EmployerCode); SELECT TOP 1 CorporateID " +
                                      "FROM CorporateAccounts ORDER By CorporateID DESC";
                    cmd.Parameters.AddWithValue("@UserName", txtCompanyName.Text.ToLower().Replace(" ", String.Empty) + guid.Remove(guid.Length - 34));
                    cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(employerCode.ToString()));
                    cmd.Parameters.AddWithValue("@Name", txtCompanyName.Text);
                    cmd.Parameters.AddWithValue("@NatureOfBusiness", ddlNature.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtStreet.Text);
                    cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Fax", txtFax.Text);
                    cmd.Parameters.AddWithValue("@Others", txtOthers.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
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
                    Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
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