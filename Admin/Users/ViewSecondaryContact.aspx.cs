using System;
using System.Data.SqlClient;

public partial class Admin_Users_ViewSecondaryContact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int contactID = 0;
            bool validContact = int.TryParse(Request.QueryString["ID"].ToString(), out contactID);

            if (validContact)
            {
                if (!IsPostBack)
                {
                    GetSecondaryContact(contactID);
                }
            }
            else
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
        }
        else
        {
            Response.Redirect(Request.UrlReferrer.ToString());
        }
    }

    void GetSecondaryContact(int ID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, TelNo, MobileNo, " +
                "Relationship, Others From SecondaryContact INNER JOIN ContactCategory ON " +
                "SecondaryContact.RelationshipID=ContactCategory.RelationshipID WHERE SecondaryContactID=@SecondaryContactID";
            cmd.Parameters.AddWithValue("@SecondaryContactID", ID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtFirstName.Text = data["FirstName"].ToString();
                    txtLastName.Text = data["LastName"].ToString();
                    txtPhone.Text = data["TelNo"].ToString();
                    txtMobile.Text = data["MobileNo"].ToString();
                    txtContactRel.Text = data["Relationship"].ToString();
                    txtOthers.Text = data["Others"].ToString();
                }  
            }
        }
    }
}