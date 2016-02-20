using System;
using System.Data.SqlClient;

public partial class Account_SecondaryContacts_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (Request.QueryString["ID"] != null)
        {
            int contactID = 0;
            bool validContact = int.TryParse(Request.QueryString["ID"].ToString(), out contactID);

            if (validContact)
            {
                if (!IsPostBack)
                {
                    GetContactInfo(contactID);
                    Session["ContactID"] = contactID;
                }
            }
            else
            {
                Response.Redirect("~/Account/SecondaryContacts/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Account/SecondaryContacts/View.aspx");
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    void GetContactInfo(int ID)
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE SecondaryContact SET FirstName=@FirstName, LastName=@LastName, " +
                "Telno=@Telno, MobileNo=@MobileNo WHERE SecondaryContactID=@ID";
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
            cmd.Parameters.AddWithValue("@Telno", txtPhone.Text.ToString());
            cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text.ToString());
            cmd.Parameters.AddWithValue("@ID", Session["ContactID"].ToString());
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Account/SecondaryContacts/View.aspx"); 
        }
    }
}