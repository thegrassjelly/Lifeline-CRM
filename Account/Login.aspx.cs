using System;
using System.Data.SqlClient;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Session["TypeID"] != null)
        {
            Response.Redirect("~/Account/Default.aspx");
        }
        if (Session["Activated"] != null)
        {
            active.Visible = true;
            Session.Remove("Activated");
        }
        if (Session["Activatefail"] != null)
        {
            activatefail.Visible = true;
            Session.Remove("Activatefail");
        }
        FaceBookConnect.API_Key = "1480870348883838";
        FaceBookConnect.API_Secret = "bd8401dc29666182dc0f992f62d31048";
        if (!IsPostBack)
        {
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                fb_error.Visible = true;
                return;
            }

            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me");
                FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                pnlFaceBookUser.Visible = true;
                lblId.Text = faceBookUser.Id;
                lblName.Text = faceBookUser.Name;
                lblEmail.Text = faceBookUser.Email;
                RegisterFB();
            }
        }
    }

    protected void Login(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("email", Request.Url.AbsoluteUri.Split('?')[0]);
    }

    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
    }

    bool IsRecordExisting(string email)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FacebookID FROM Users WHERE FacebookID=@FacebookID";
            cmd.Parameters.AddWithValue("@FacebookID", lblId.Text.ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                bool existing = data.HasRows;
                return existing;  
            }
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
                    "Password=@Password";
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                using (SqlDataReader data = cmd.ExecuteReader())
                {
                    if (data.HasRows)
                    {
                        while (data.Read())
                        {
                            Session["userid"] = data["UserID"].ToString();
                            Session["typeid"] = data["TypeID"].ToString();
                        }
                        con.Close();
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        con.Close();
                        error.Visible = true;
                    } 
                }
            }
            catch (SqlException ex)
            {
                db_error.Visible = true;
            }
        }
    }

    void RegisterFB()
    {
        if (!IsRecordExisting(lblId.Text))
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
                        cmd.CommandText = "INSERT INTO Users VALUES (@TypeID, @Email, @Password, @FirstName, " +
                        "@LastName, @Birthday, @UserPic, @Street, @Municipality, @City, @Phone, @Mobile, @Status, " +
                        "@DateAdded, @DateModified, @FacebookID, @Priority, @CorporateID); SELECT TOP 1 UserID FROM Users ORDER BY UserID DESC";
                        cmd.Parameters.AddWithValue("@Email", lblEmail.Text);
                        cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                        cmd.Parameters.AddWithValue("@TypeID", "1");
                        cmd.Parameters.AddWithValue("@Status", "Active");
                        cmd.Parameters.AddWithValue("@FirstName", lblName.Text);
                        cmd.Parameters.AddWithValue("@LastName", "");
                        cmd.Parameters.AddWithValue("@Birthday", "01/01/1950");
                        cmd.Parameters.AddWithValue("@UserPic", "placeholder.png");
                        cmd.Parameters.AddWithValue("@Street", "");
                        cmd.Parameters.AddWithValue("@Municipality", "");
                        cmd.Parameters.AddWithValue("@City", "");
                        cmd.Parameters.AddWithValue("@Phone", "");
                        cmd.Parameters.AddWithValue("@Mobile", "");
                        cmd.Parameters.AddWithValue("@DateModified", "");
                        cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                        cmd.Parameters.AddWithValue("@FacebookID", lblId.Text);
                        cmd.Parameters.AddWithValue("@Priority", "Normal");
                        cmd.Parameters.AddWithValue("@CorporateID", "");
                        int UserID = (int)cmd.ExecuteScalar();

                        cmd.CommandText = "INSERT INTO MedicalInfo (UserID) VALUES (@UserID)";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "INSERT INTO AutomaticRenewal (UserID, Status) VALUES (@UserID, 'Disabled')";
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.ExecuteNonQuery();
                        tran.Commit();

                        LoginFB();
                    }
                    catch (Exception)
                    {
                        tran.Rollback();
                        fb_error.Visible = true;
                    }
                } 
            }
        }
        else
        {
            LoginFB();
        }

    }

    void LoginFB()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserID, TypeID FROM Users WHERE FacebookID=@FacebookID " +
                "AND Status='Active'";
            cmd.Parameters.AddWithValue("@FacebookID", lblId.Text.ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        Session["userid"] = data["UserID"].ToString();
                        Session["typeid"] = data["TypeID"].ToString();
                    }
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    error.Visible = true;
                }  
            }
        }
    }
}