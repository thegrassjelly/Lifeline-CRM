using System;
using System.Data.SqlClient;
using System.IO;


public partial class Admin_Users_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetUserType();
        }
    }

    void GetUserType()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TypeID, UserType FROM Types";
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                ddlUserType.DataSource = dr;
                ddlUserType.DataTextField = "UserType";
                ddlUserType.DataValueField = "TypeID";
                ddlUserType.DataBind();  
            }
        }
    }

    bool IsRecordExisting(string email)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Email FROM Users WHERE Email=@Email";
            cmd.Parameters.AddWithValue("@Email", email);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                bool existing = data.HasRows;
                return existing;  
            }
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (!IsRecordExisting(txtEmail.Text))
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO Users VALUES (@TypeID, @Email, @Password, @FirstName, " +
                "@LastName, @Birthday, @UserPic, @Street, @Municipality, @City, @Phone, @Mobile, @Status, " +
                "@DateAdded, @DateModified, @FacebookID, @Priority); SELECT TOP 1 UserID FROM Users ORDER BY UserID DESC";
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                cmd.Parameters.AddWithValue("@TypeID", ddlUserType.SelectedValue);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
                cmd.Parameters.AddWithValue("@Birthday", txtBday.DbSelectedDate);
                if (!usrPicUpload.HasFile)
                {
                    cmd.Parameters.AddWithValue("@UserPic", "placeholder.png");
                }
                else
                {
                    string fileExt = Path.GetExtension(usrPicUpload.FileName);
                    string id = Guid.NewGuid().ToString();
                    cmd.Parameters.AddWithValue("@UserPic", id + fileExt);
                    usrPicUpload.SaveAs(Server.MapPath("~/images/users/" + id + fileExt));
                }
                cmd.Parameters.AddWithValue("@Street", txtStreet.Text.ToString());
                cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.ToString());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.ToString());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.ToString());
                cmd.Parameters.AddWithValue("@DateModified", "");
                cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                cmd.Parameters.AddWithValue("@FacebookID", "");
                cmd.Parameters.AddWithValue("@Priority", "Normal");
                int UserID = (int)cmd.ExecuteScalar();

                cmd.CommandText = "INSERT INTO MedicalInfo (UserID) VALUES (@UserID)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.ExecuteNonQuery();

                cmd.CommandText = "INSERT INTO AutomaticRenewal (UserID, Status) VALUES (@UserID, 'Disabled')";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.ExecuteNonQuery();

                Response.Redirect("~/Admin/Users/View.aspx"); 
            }
        }
        else
        {
            user.Visible = false;
            error.Visible = true;
        }
    }
}