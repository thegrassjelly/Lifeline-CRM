﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;

public partial class Account_Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = this.btnRegister.UniqueID;
        GetUserIP();
    }

    bool IsRecordExisting(string email)
    {
        bool existing = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Email FROM Users WHERE Email=@Email";
        cmd.Parameters.AddWithValue("@Email", email);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    public static string GetUserIP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        if (VisitorsIPAddr == "::1")
            VisitorsIPAddr = "127.0.0.1";
        return VisitorsIPAddr;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (!IsRecordExisting(txtEmail.Text))
        {
            string activationCode = Guid.NewGuid().ToString();
            string rurl = Request.Url.AbsoluteUri.Replace("Register.aspx", 
                "Activation.aspx?ActivationCode=" + activationCode);

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Users VALUES (@TypeID, @Email, @Password, @FirstName, " +
            "@LastName, @Birthday, @UserPic, @Street, @Municipality, @City, @AreaCode, @Extension, @Phone, @Mobile, @Status, " +
            "@DateAdded, @DateModified, @FacebookID, @Priority, @CorporateID); SELECT TOP 1 UserID FROM Users ORDER BY UserID DESC";
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
            if (ddlUserType.SelectedItem.ToString() == "Guest")
            {
                cmd.Parameters.AddWithValue("@TypeID", "1");
            }
            else if (ddlUserType.SelectedItem.ToString() == "Pending Client")
            {
                cmd.Parameters.AddWithValue("@TypeID", "5");
            }
            cmd.Parameters.AddWithValue("@Status", "Pending");
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Birthday", txtBday.Text);
            cmd.Parameters.AddWithValue("@UserPic", "placeholder.png");
            cmd.Parameters.AddWithValue("@Street", "");
            cmd.Parameters.AddWithValue("@Municipality", "");
            cmd.Parameters.AddWithValue("@City", "");
            cmd.Parameters.AddWithValue("@AreaCode", "");
            cmd.Parameters.AddWithValue("@Extension", "");
            cmd.Parameters.AddWithValue("@Phone", "");
            cmd.Parameters.AddWithValue("@Mobile", "");
            cmd.Parameters.AddWithValue("@DateModified", "");
            cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
            cmd.Parameters.AddWithValue("@FacebookID", "");
            cmd.Parameters.AddWithValue("@Priority", "Normal");
            cmd.Parameters.AddWithValue("@CorporateID", "");
            int UserID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "INSERT INTO UserIP (UserID, IPAddr) VALUES (@UserID, @IPAddr)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@IPAddr", GetUserIP());
            cmd.ExecuteNonQuery();

            cmd.CommandText = "INSERT INTO MedicalInfo (UserID) VALUES (@UserID)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "INSERT INTO AutomaticRenewal (UserID, Status) VALUES (@UserID, 'Disabled')";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserId", UserID);
            cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
            cmd.ExecuteNonQuery();

            con.Close();
            success.Visible = true;
            error.Visible = false;
            Helper.SendActivationEmail(txtEmail.Text.ToString(), txtFirstName.Text.ToString(),
              ddlUserType.SelectedItem.ToString(), PopulateBody
              (txtFirstName.Text.ToString(), ddlUserType.SelectedItem.ToString(), rurl));
        }
        else
        {
            success.Visible = false;
            error.Visible = true;
        }
    }

    string PopulateBody(string name, string usertype, string requesturl)
    {
        string body = string.Empty;
        body = File.ReadAllText(Server.MapPath("~/Account/ActivationEmailTemplate.html"));
        body = body.Replace("{FirstName}", name);
        body = body.Replace("{UserType}", usertype);
        body = body.Replace("{RequestUrl}", requesturl);
        return body;
    }
}
