using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public partial class Account_SecondaryContacts_View : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetSecondaryContact();
        }
    }

    void GetSecondaryContact()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SecondaryContactID, UserID, FirstName, LastName, TelNo, " +
            "MobileNo, Relationship, Others FROM SecondaryContact INNER JOIN " +
            "ContactCategory ON SecondaryContact.RelationshipID=ContactCategory.RelationshipID " +
            "WHERE UserID=@UserID";
        cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "SecondaryContact");
        lvSecondary.DataSource = ds;
        lvSecondary.DataBind();
        con.Close();
    }
}