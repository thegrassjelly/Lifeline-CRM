using System;
using System.Data.SqlClient;

public partial class Admin_Users_AddEmployees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        this.Form.DefaultButton = this.btnAdd.UniqueID;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Responder (FirstName, LastName, Title, Status, DateAdded) " +
                "VALUES (@FirstName, @LastName, @Title, @Status, @DateAdded)";
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Title", ddlTitle.SelectedValue);
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewResponders.aspx");
        }
    }
}