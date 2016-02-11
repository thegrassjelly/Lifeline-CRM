using System;
using System.Data.SqlClient;

public partial class Admin_admin : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["typeid"] != null)
        {
            if (Session["typeid"].ToString() != "10")
            {
                Session.Clear();
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                Helper.ValidateAdmin();
            }
        }
        else
        {
            Helper.ValidateAdmin();
        }
        if (!IsPostBack)
        {
            GetUserInfo();
        }
    }

    void GetUserInfo()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT FirstName, LastName, UserPic, UserType FROM Users INNER JOIN Types ON " +
            "Users.TypeID=Types.TypeID WHERE UserID=@UserID";
        cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            if (data["UserPic"].ToString() != "")
            {
                imgUser.ImageUrl = "~/images/users/" + data["UserPic"].ToString();
                imgUserNav.ImageUrl = "~/images/users/" + data["UserPic"].ToString();

            }
            else
            {
                imgUser.ImageUrl = "~/images/users/placeholder.png";
                imgUserNav.ImageUrl = "~/images/users/placeholder.png";
            }
            txtFirstName.Text = data["FirstName"].ToString();
            txtNavFN.Text = data["FirstName"].ToString();
            txtLastName.Text = data["LastName"].ToString();
            txtNavLN.Text = data["LastName"].ToString();
            txtUserType.Text = data["UserType"].ToString();
        }
        con.Close();
    }
}
