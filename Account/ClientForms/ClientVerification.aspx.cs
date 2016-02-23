using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Account_ClientForms_PendingClient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (CheckVerification())
        {
            verify_pending.Visible = true;
            btnSubmit.Visible = false;
        }
        else
        {
            if (!IsPostBack)
            {
                GetUserInfo();
            }
            if (Session["verification"] != null)
            {
                verify.Visible = true;
                Session.Remove("verification");
            }
        }
        this.Form.DefaultButton = this.btnSubmit.UniqueID;
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

    bool CheckVerification()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            bool hasVerification = true;
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ScanID FROM Verification WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                    hasVerification = true;
                else
                    hasVerification = false;
                con.Close();
                return hasVerification;
            }
        }
    }

    void GetUserInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, UserPic, Street, Municipality, " +
                "City, Phone, Mobile, Email, Status, UserType From Users INNER JOIN Types ON " +
                "Users.TypeID=Types.TypeID WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtFN.Text = data["FirstName"].ToString();
                    txtLN.Text = data["LastName"].ToString();
                    DateTime bDay = Convert.ToDateTime(data["Birthday"].ToString());
                    txtBday.Text = bDay.ToString("yyyy-MM-dd");
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
                    cmd.CommandText = "UPDATE Users SET FirstName=@FirstName, LastName=@LastName, " +
                        "Birthday=@Birthday, Street=@Street, Municipality=@Municipality, " +
                        "City=@City, Phone=@Phone, Mobile=@Mobile, Email=@Email FROM Users WHERE UserID=@UserID";
                    cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
                    cmd.Parameters.AddWithValue("@Birthday", txtBday.Text);
                    cmd.Parameters.AddWithValue("@Street", txtStreet.Text);
                    cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "INSERT INTO Verification (UserID, VerificationScan, UploadDate) " +
                        "VALUES (@UserID, @VerificationScan, @UploadDate) SELECT TOP 1 ScanID FROM " +
                        "Verification ORDER BY ScanID DESC";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());

                    string fileExt = Path.GetExtension(usrIdUpload.FileName);
                    string id = Guid.NewGuid().ToString();
                    cmd.Parameters.AddWithValue("@VerificationScan", id + fileExt);
                    usrIdUpload.SaveAs(Server.MapPath("~/verification/" + id + fileExt));

                    cmd.Parameters.AddWithValue("@UploadDate", DateTime.Now);
                    int ScanID = (int)cmd.ExecuteScalar();
                    tran.Commit();
                    Helper.Log(Session["userid"].ToString(), "Client Forms", "Client Verification", ScanID.ToString());
                    Session["verification"] = "yes";
                    Response.Redirect("ClientVerification.aspx");
                }
                catch (SqlException ex)
                {
                    tran.Rollback();
                    verify_error.Visible = true;
                    Helper.LogException(Session["userid"].ToString(), "Client Forms, Client Verification Form",
                            "Exception Type: " + ex.GetType().ToString() + " " +
                            "Exception Message: " + ex.Message.ToString());
                }
            }
        }
    }
}