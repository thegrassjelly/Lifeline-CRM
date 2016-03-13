using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class Account_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetUserInfo();
            GetMessages();
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    bool CheckEmail(string email)
    {
        bool existing = true;
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Email FROM Users WHERE Email=@Email";
            cmd.Parameters.AddWithValue("@Email", email);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                    existing = true;
                else
                    existing = false;
            }
            return existing;
        }
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
                    txtBday.Text = bDay.ToString("yyyy-MM-dd");
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
        if (CheckEmail(txtEmail.Text))
        {
            error.Visible = true;
        }
        else
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
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Birthday", txtBday.Text);

                string fileExt = Path.GetExtension(usrPicUpload.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@UserPic", id + fileExt);
                usrPicUpload.SaveAs(Server.MapPath("~/images/users/" + id + fileExt));

                cmd.Parameters.AddWithValue("@Street", txtStreet.Text);
                cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
                cmd.ExecuteNonQuery();
                profile.Visible = true;
            }
        }
    }

    void GetMessages()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand()) 
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MessageID, Category, MessageCat, Subject, DateSubmitted, Messages.Status, FirstName, LastName " +
                "FROM Messages INNER JOIN Users ON Messages.UserID=Users.UserID WHERE Messages.UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            lvUserMessage.DataSource = ds;
            lvUserMessage.DataBind();
        }
    }

    void SortMessages(string Column, string Dir)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MessageID, Category, MessageCat, Subject, DateSubmitted, Messages.Status, FirstName, LastName " +
                "FROM Messages INNER JOIN Users ON Messages.UserID=Users.UserID WHERE Messages.UserID=@UserID " +
                "ORDER BY " + Column + " " + Dir;
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            lvUserMessage.DataSource = ds;
            lvUserMessage.DataBind(); 
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortMessages(ddlSortBy.SelectedValue, ddlDirection.SelectedValue);
        }
        else
        {
            GetMessages();
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortMessages(sortBy, direction);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortMessages(sortBy, direction);
    }

    protected void btnAddEmployer_Click(object sender, EventArgs e)
    {
        if (CheckEmployerCode())
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT CorporateID FROM CorporateAccounts " +
                                  "WHERE EmployerCode=@EmployerCode";
                cmd.Parameters.AddWithValue("@EmployerCode", txtEmployerCode.Text);
                int corporateID = (int) cmd.ExecuteScalar();

                cmd.CommandText = "UPDATE Users SET CorporateID=@CorporateID, TypeID='9' " +
                                  "WHERE UserID=@UserID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                cmd.Parameters.AddWithValue("@CorporateID", corporateID);
                cmd.ExecuteNonQuery();
                employercorrect.Visible = true;
                employererror.Visible = false;
            }
        }
        else
        {
            employererror.Visible = true;
            employercorrect.Visible = false;
        }
    }

    bool CheckEmployerCode()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT EmployerCode FROM CorporateAccounts " +
                              "WHERE EmployerCode=@EmployerCode";
            cmd.Parameters.AddWithValue("@EmployerCode", txtEmployerCode.Text.ToString());
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                var validCode = da.HasRows;
                return validCode;  
            }
        }
    }
}