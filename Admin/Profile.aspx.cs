using System;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Session["profile"] != null)
        {
            profile.Visible = true;
            Session.Remove("profile");
        }
        else
        {
            profile.Visible = false;
        }

        if (!IsPostBack)
        {
            GetUserInfo();
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

                    txtFirstName.Text = data["FirstName"].ToString();
                    txtLastName.Text = data["LastName"].ToString();
                    DateTime bDay = Convert.ToDateTime(data["Birthday"].ToString());
                    txtBday.DbSelectedDate = bDay.ToString("MM/dd/yyyy");
                    imgUser.ImageUrl = "~/images/users/" + data["UserPic"].ToString();
                    imgUserLb.NavigateUrl = "~/images/users/" + data["UserPic"].ToString();
                    txtStreet.Text = data["Street"].ToString();
                    txtMunicipality.Text = data["Municipality"].ToString();
                    txtCity.Text = data["City"].ToString();
                    txtPhone.Text = data["Phone"].ToString();
                    txtMobile.Text = data["Mobile"].ToString();
                    txtEmail.Text = data["Email"].ToString();
                    txtStatus.Text = data["Status"].ToString();
                    txtType.Text = data["UserType"].ToString();
                } 
            } 
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            if (txtPassword.Text.Trim() == "")
            {
                if (usrPicUpload.HasFile)
                {
                    cmd.CommandText = "UPDATE Users SET Email=@Email, FirstName=@FirstName, LastName=@LastName, Birthday=@Birthday, UserPic=@UserPic, Street=@Street, " +
                    "Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, DateModified=@DateModified WHERE UserID=@UserID";
                }
                else
                {
                    cmd.CommandText = "UPDATE Users SET Email=@Email, FirstName=@FirstName, LastName=@LastName, Birthday=@Birthday, Street=@Street, " +
                    "Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, DateModified=@DateModified WHERE UserID=@UserID";
                }
            }
            else
            {
                if (usrPicUpload.HasFile)
                {
                    cmd.CommandText = "UPDATE Users SET Email=@Email, FirstName=@FirstName, LastName=@LastName, Birthday=@Birthday, UserPic=@UserPic, Street=@Street, " +
                    "Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, DateModified=@DateModified, Password=@Password WHERE UserID=@UserID";
                }
                else
                {
                    cmd.CommandText = "UPDATE Users SET Email=@Email, FirstName=@FirstName, LastName=@LastName, Birthday=@Birthday, Street=@Street, " +
                    "Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, DateModified=@DateModified, Password=@Password WHERE UserID=@UserID";
                }
            }
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
            cmd.Parameters.AddWithValue("@Birthday", txtBday.DbSelectedDate);

            string fileExt = Path.GetExtension(usrPicUpload.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@UserPic", id + fileExt);
            usrPicUpload.SaveAs(Server.MapPath("~/images/users/" + id + fileExt));

            cmd.Parameters.AddWithValue("@Street", txtStreet.Text.ToString());
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
            cmd.Parameters.AddWithValue("@City", txtCity.Text.ToString());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.ToString());
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.ToString());
            cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
            cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.ExecuteNonQuery();

            Session["profile"] = "yes";
            Response.Redirect("Profile.aspx"); 
        }
    }
}