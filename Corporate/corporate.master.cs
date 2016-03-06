using System;
using System.Data.SqlClient;

public partial class Corporate_corporate : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateCorporate();
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
            cmd.CommandText = "SELECT Name, Logo, EmployerCode FROM CorporateAccounts WHERE CorporateID=@corpid";
            cmd.Parameters.AddWithValue("@corpid", Session["corporateid"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    if (data["Logo"].ToString() != "")
                    {
                        imgUser.ImageUrl = "~/images/users/" + data["Logo"].ToString();
                        imgUserNav.ImageUrl = "~/images/users/" + data["Logo"].ToString();

                    }
                    else
                    {
                        imgUser.ImageUrl = "~/images/users/placeholder.png";
                        imgUserNav.ImageUrl = "~/images/users/placeholder.png";
                    }
                    txtCompanyName.Text = data["Name"].ToString();
                    txtCode.Text = data["EmployerCode"].ToString();
                    txtCompany2.Text = data["Name"].ToString();
                    txtCode2.Text = data["EmployerCode"].ToString();
                }
            }
        }
    }
}
