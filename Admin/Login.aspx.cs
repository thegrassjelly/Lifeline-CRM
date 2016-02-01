using System;
using System.Data.SqlClient;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Session["TypeID"] != null)
        {
            Response.Redirect("~/Admin/Default.aspx");
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
                cmd.CommandText = "SELECT UserID, TypeID FROM Users WHERE Email=@Email AND " +
                    "Password=@Password AND TypeID='10'";
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                SqlDataReader data = cmd.ExecuteReader();
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        Session["userid"] = data["UserID"].ToString();
                        Session["typeid"] = data["TypeID"].ToString();
                    }
                    con.Close();
                    Response.Redirect("~/Admin/Default.aspx");
                }
                else
                {
                    con.Close();
                    error.Visible = true;
                }
            }
            catch (SqlException ex)
            {
                db_error.Visible = true;
            }
        }

    }
}