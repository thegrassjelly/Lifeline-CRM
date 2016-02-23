using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class Admin_Users_Update : System.Web.UI.Page
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
        if (Request.QueryString["ID"] != null)
        {
            int userID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

            if (validUser)
            {
                if (!IsPostBack)
                {
                    GetUserInfo(userID);
                    GetMedicalInfo(userID);
                    GetTypes();
                    GetSecondaryContact(userID);
                    GetUserMessages(userID);
                    GetUserRenewals(userID);
                };
            }
            else
            {
                Response.Redirect("~/Admin/Users/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Users/View.aspx");
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

    void GetTypes()
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

    void GetUserInfo(int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, UserPic, " +
                "Street, Users.Municipality, Users.City, Users.Phone, Mobile, Users.Email, Users.Status, TypeID, Priority " +
                "FROM Users WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
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
                        ddlStatus.SelectedValue = data["Status"].ToString();
                        ddlUserType.SelectedValue = data["TypeID"].ToString();
                        ddlPriority.SelectedValue = data["Priority"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Users/View.aspx");
                }  
            }
        }
    }

    void GetMedicalInfo(int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT BloodType, Allergies, CancerHis, HeartHis, " +
                "AsthmaHis, EpilepsyHis, LiverHis, Others FROM MedicalInfo WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        ddlBloodType.SelectedValue = data["BloodType"].ToString();
                        txtAllergies.Text = data["Allergies"].ToString();
                        ddlCancerHis.SelectedValue = data["CancerHis"].ToString();
                        ddlHeartHis.SelectedValue = data["HeartHis"].ToString();
                        ddlAsthmaHis.SelectedValue = data["AsthmaHis"].ToString();
                        ddlEpilepsyHis.SelectedValue = data["EpilepsyHis"].ToString();
                        ddlLiverHis.SelectedValue = data["LiverHis"].ToString();
                        txtOthers.Text = data["Others"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Users/View.aspx");
                }  
            }
        }
    }

    void GetSecondaryContact(int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT SecondaryContactID, FirstName, LastName " +
                "FROM SecondaryContact WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "SecondaryContact");
            lvSecondaryContact.DataSource = ds;
            lvSecondaryContact.DataBind(); 
        }
    }

    void GetUserRenewals(int userId)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand()) 
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Memberships.MembershipID, StartDate, " +
                "EndDate, Length, MembershipStatus, Type, PaymentStatus FROM Memberships " +
                "INNER JOIN Users ON Memberships.UserID=Users.UserID INNER JOIN Payments " +
                "ON Memberships.MembershipID=Payments.MembershipID WHERE Memberships.UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Memberships");
            lvUserRenewals.DataSource = ds;
            lvUserRenewals.DataBind();
        }
    }

    void SortUserRenewals(string column, string dir, int userid)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Memberships.MembershipID, FirstName, LastName, StartDate, " +
                "EndDate, Length, MembershipStatus, Type, PaymentStatus FROM Memberships " +
                "INNER JOIN Users ON Memberships.UserID=Users.UserID INNER JOIN Payments " +
                "ON Memberships.MembershipID=Payments.MembershipID WHERE Memberships.UserID=@UserID " +
                "ORDER BY " + column + " " + dir;
            cmd.Parameters.AddWithValue("@UserID", userid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Memberships");
            lvUserRenewals.DataSource = ds;
            lvUserRenewals.DataBind();
        }
    }

    protected void lvRenewals_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        int userID = Convert.ToInt32(Request.QueryString["ID"]);
        lvRenewalPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlRenewalCategory.SelectedValue != "" && ddlRenewalDirection.SelectedValue != "")
        {
            SortUserRenewals(ddlRenewalCategory.SelectedValue, ddlRenewalDirection.SelectedValue, userID);
        }
        else
        {
            GetUserRenewals(userID);
        }
    }

    protected void ddlRenewalDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        int userID = Convert.ToInt32(Request.QueryString["ID"]);
        var sortBy = ddlRenewalCategory.SelectedValue;
        var direction = ddlRenewalDirection.SelectedValue;
        SortUserRenewals(sortBy, direction, userID);
    }

    protected void ddlRenewalCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int userID = Convert.ToInt32(Request.QueryString["ID"]);
        var sortBy = ddlRenewalCategory.SelectedValue;
        var direction = ddlRenewalDirection.SelectedValue;
        SortUserRenewals(sortBy, direction, userID);
    }

    void GetUserMessages(int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MessageID, Category, MessageCat, Subject, DateSubmitted, Messages.Status, FirstName, LastName " +
                "FROM Messages INNER JOIN Users ON Messages.UserID=Users.UserID WHERE Messages.UserID=@UserID ORDER BY MessageID DESC";
            cmd.Parameters.AddWithValue("@UserID", userID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            lvUserMessage.DataSource = ds;
            lvUserMessage.DataBind(); 
        }
    }

    void SortMessages(string Column, string Dir, int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MessageID, Category, MessageCat, Subject, DateSubmitted, Messages.Status, FirstName, LastName " +
                "FROM Messages INNER JOIN Users ON Messages.UserID=Users.UserID WHERE Messages.UserID=@UserID " +
                "ORDER BY " + @Column + " " + @Dir;
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@Column", Column);
            cmd.Parameters.AddWithValue("@Dir", Dir);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            lvUserMessage.DataSource = ds;
            lvUserMessage.DataBind(); 
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        int userID = Convert.ToInt32(Request.QueryString["ID"]);
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortMessages(ddlSortBy.SelectedValue, ddlDirection.SelectedValue, userID);
        }
        else
        {
            GetUserMessages(userID);
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        int userID = Convert.ToInt32(Request.QueryString["ID"]);
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortMessages(sortBy, direction, userID);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int userID = Convert.ToInt32(Request.QueryString["ID"]);
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortMessages(sortBy, direction, userID);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            if (usrPicUpload.HasFile)
            {
                cmd.CommandText = "UPDATE Users SET Email=@Email, FirstName=@FirstName, LastName=@LastName, Birthday=@Birthday, UserPic=@UserPic, Street=@Street, " +
                "Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, Status=@Status, TypeID=@TypeID, Priority=@Priority, DateModified=@DateModified WHERE UserID=@UserID";
            }
            else
            {
                cmd.CommandText = "UPDATE Users SET Email=@Email, FirstName=@FirstName, LastName=@LastName, Birthday=@Birthday, Street=@Street, " +
                "Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, Status=@Status, TypeID=@TypeID, Priority=@Priority, DateModified=@DateModified WHERE UserID=@UserID";
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
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@TypeID", ddlUserType.SelectedValue);
            cmd.Parameters.AddWithValue("@Priority", ddlPriority.SelectedValue);
            cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            cmd.ExecuteNonQuery();

            UpdateMedicalInfo();
            Session["profile"] = "yes";
            Response.Redirect(Request.RawUrl); 
        }
    }

    void UpdateMedicalInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE MedicalInfo SET BloodType=@BloodType, Allergies=@Allergies, " +
                "CancerHis=@CancerHis, HeartHis=@HeartHis, AsthmaHis=@AsthmaHis, EpilepsyHis=@EpilepsyHis, " +
                "LiverHis=@LiverHis, Others=@Others WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@BloodType", ddlBloodType.SelectedValue);
            cmd.Parameters.AddWithValue("@Allergies", txtAllergies.Text);
            cmd.Parameters.AddWithValue("@CancerHis", ddlCancerHis.SelectedValue);
            cmd.Parameters.AddWithValue("@HeartHis", ddlHeartHis.SelectedValue);
            cmd.Parameters.AddWithValue("@AsthmaHis", ddlAsthmaHis.SelectedValue);
            cmd.Parameters.AddWithValue("@EpilepsyHis", ddlEpilepsyHis.SelectedValue);
            cmd.Parameters.AddWithValue("@LiverHis", ddlLiverHis.SelectedValue);
            cmd.Parameters.AddWithValue("@Others", txtOthers.Text);
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            cmd.ExecuteNonQuery(); 
        }
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Users/Reports/UserIndividualReports.aspx?ID=" + Request.QueryString["ID"].ToString());
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
                int corporateID = (int)cmd.ExecuteScalar();

                cmd.CommandText = "UPDATE Users SET CorporateID=@CorporateID " +
                                  "WHERE UserID=@UserID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
                cmd.Parameters.AddWithValue("@CorporateID", corporateID);
                cmd.ExecuteNonQuery();

                employercorrect.Visible = true; 
            }
        }
        else
        {
            employererror.Visible = true;
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
            cmd.Parameters.AddWithValue("@EmployerCode", txtEmployerCode.Text);
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                var validCode = da.HasRows;
                return validCode;  
            }
        }
    }
}