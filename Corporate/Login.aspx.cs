using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Corporate_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Session["TypeID"] != null)
        {
            Response.Redirect("~/Corporate/Default.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT CorporateID FROM CorporateAccounts WHERE UserName=@UserName AND " +
                    "Password=@Password";
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                using (SqlDataReader data = cmd.ExecuteReader())
                {
                    if (data.HasRows)
                    {
                        while (data.Read())
                        {
                            Session["corporateid"] = data["CorporateID"].ToString();
                        }
                        con.Close();
                        Response.Redirect("~/Corporate/Default.aspx");
                    }
                    else
                    {
                        con.Close();
                        error.Visible = true;
                    }
                }
            }
            catch (SqlException ex)
            {
                db_error.Visible = true;
            }
        }
    }
}