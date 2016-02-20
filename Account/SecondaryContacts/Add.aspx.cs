using System;
using System.Data.SqlClient;

public partial class Account_Secondary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetContactCat();
        }
        this.Form.DefaultButton = this.btnInsert.UniqueID;
    }

    void GetContactCat()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT RelationshipID, Relationship FROM ContactCategory";
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                ddlContact.DataSource = dr;
                ddlContact.DataTextField = "Relationship";
                ddlContact.DataValueField = "RelationshipID";
                ddlContact.DataBind();  
            }
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO SecondaryContact VALUES (@UserID, @FirstName, @LastName, @TelNo, " +
            "@MobileNo, @RelationshipID, @Others)";
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
            cmd.Parameters.AddWithValue("@TelNo", txtPhone.Text.ToString());
            cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text.ToString());
            cmd.Parameters.AddWithValue("@RelationshipID", ddlContact.SelectedValue);
            cmd.Parameters.AddWithValue("@Others", txtOthers.Text.ToString());
            cmd.ExecuteNonQuery();
            Response.Redirect("View.aspx"); 
        }
    }
}