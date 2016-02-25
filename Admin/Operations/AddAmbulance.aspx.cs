using System;
using System.Data.SqlClient;

public partial class Admin_Operations_AddAmbulance : System.Web.UI.Page
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
            cmd.CommandText = "INSERT INTO Ambulance (AmbulanceName, AmbulanceStatus, PlateNo, DateAdded) " +
                "VALUES (@AmbulanceName, @AmbulanceStatus, @PlateNo, @DateAdded)";
            cmd.Parameters.AddWithValue("@AmbulanceName", txtAmbulance.Text);
            cmd.Parameters.AddWithValue("@AmbulanceStatus", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@PlateNo", txtPlate.Text);
            cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
        }
    }
}