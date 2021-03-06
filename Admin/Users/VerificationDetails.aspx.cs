﻿using System;
using System.Data.SqlClient;

public partial class Admin_Users_VerificationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int scanID = 0;
            bool validScanID = int.TryParse(Request.QueryString["ID"].ToString(), out scanID);

            if (validScanID)
            {
                if (!IsPostBack)
                {
                    GetUserInfo(scanID);
                    GetVerificationInfo(scanID);
                }
            }
            else
            {
                Response.Redirect("~/Admin/Users/VerificationLogs.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Users/VerificationLogs.aspx");
        }
        this.Form.DefaultButton = this.btnSubmit.UniqueID;
    }

    private void GetVerificationInfo(int scanID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT VerificationScan FROM Verification WHERE " +
                "ScanID=@ScanID";
            cmd.Parameters.AddWithValue("@ScanID", scanID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        imgIDScan.ImageUrl = "~/verification/" + data["VerificationScan"].ToString();
                        imgIDScanLB.NavigateUrl = "~/verification/" + data["VerificationScan"].ToString();
                    }
                }
            }
        }
    }

    private void GetUserInfo(int scanID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, UserPic, " +
                "Street, Municipality, City, Phone, Mobile, Email, Status, Priority, " +
                "UserType FROM Users INNER JOIN Types ON Users.TypeID=Types.TypeID " +
                "WHERE UserID=(SELECT UserID FROM Verification WHERE " +
                "ScanID=@ScanID)";
            cmd.Parameters.AddWithValue("@ScanID", scanID);
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
                        txtUserType.Text = data["UserType"].ToString();
                        if (txtUserType.Text == "Client")
                        {
                            btnSubmit.Visible = false;
                        }
                        txtUserPriority.Text = data["Priority"].ToString();
                    }
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
            cmd.CommandText = "UPDATE Users SET TypeID=@TypeID " +
            "WHERE UserID=(SELECT UserID FROM Verification WHERE " +
            "ScanID=@ScanID)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ScanID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@TypeID", "9");
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Users/VerificationDetails.aspx?ID=" + Request.QueryString["ID"].ToString());
        }
    }
}