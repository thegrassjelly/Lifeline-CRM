using System;
using System.Data.SqlClient;

public partial class Account_customer : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        switch (Session["TypeID"].ToString())
        {
            case "9":
                medinfo.Visible = true;
                renewals.Visible = true;
                break;
            case "10":
                medinfo.Visible = true;
                renewals.Visible = true;
                break;
            case "1":
                clientforms.Visible = true;
                break;
            case "5":
                clientforms.Visible = true;
                break;
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
            cmd.CommandText = "SELECT FirstName, LastName, UserPic, UserType FROM Users INNER JOIN Types ON " +
                "Users.TypeID=Types.TypeID WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
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
            }
        }
    }
}
