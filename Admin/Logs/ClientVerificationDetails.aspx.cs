using System;
using System.Data.SqlClient;

public partial class Admin_Logs_ClientVerificationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int scanID = 0;
            bool validScanID = int.TryParse(Request.QueryString["ID"].ToString(), out scanID);

            if (validScanID)
            {
                if (!IsPostBack)
                {
                    GetUserInfo(scanID);
                    GetVerificationInfo(scanID);
                    GetTypes();
                }
            }
            else
            {
                Response.Redirect("~/Admin/Logs/ClientVerificationLogs.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Logs/ClientVerificationLogs.aspx");
        }
        this.Form.DefaultButton = this.btnSubmit.UniqueID;
    }

    private void GetVerificationInfo(int scanID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT VerificationScan FROM Verification WHERE " +
                "ScanID=@ScanID";
            cmd.Parameters.AddWithValue("@ScanID", scanID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        imgIDScan.ImageUrl = "~/verification/" + data["VerificationScan"].ToString();
                        imgIDScanLB.NavigateUrl = "~/verification/" + data["VerificationScan"].ToString();
                    }
                }
            }
        }
    }

    private void GetUserInfo(int scanID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, UserPic, " +
                "Street, Municipality, City, Phone, Mobile, Email, Status, Priority, " +
                "TypeID FROM Users WHERE UserID=(SELECT UserID FROM Verification WHERE " +
                "ScanID=@ScanID)";
            cmd.Parameters.AddWithValue("@ScanID", scanID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtFirstName.Text = data["FirstName"].ToString();
                        txtLastName.Text = data["LastName"].ToString();
                        DateTime bDay = Convert.ToDateTime(data["Birthday"].ToString());
                        txtBday.Text = bDay.ToString("MM/dd/yyyy");
                        imgUser.ImageUrl = "~/images/users/" + data["UserPic"].ToString();
                        imgUserLb.NavigateUrl = "~/images/users/" + data["UserPic"].ToString();
                        txtStreet.Text = data["Street"].ToString();
                        txtMunicipality.Text = data["Municipality"].ToString();
                        txtCity.Text = data["City"].ToString();
                        txtPhone.Text = data["Phone"].ToString();
                        txtMobile.Text = data["Mobile"].ToString();
                        txtEmail.Text = data["Email"].ToString();
                        txtUserStatus.Text = data["Status"].ToString();
                        ddlUserType.Text = data["TypeID"].ToString();
                        txtUserPriority.Text = data["Priority"].ToString();
                    }
                }
            }
        }
    }

    private void GetTypes()
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Users SET TypeID=@TypeID " +
            "WHERE UserID=(SELECT UserID FROM Verification WHERE " +
            "ScanID=@ScanID)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ScanID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@TypeID", ddlUserType.SelectedValue);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Logs/ClientVerificationDetails.aspx?ID=" + Request.QueryString["ID"].ToString());
        }
    }
}