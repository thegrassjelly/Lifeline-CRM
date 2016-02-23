using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Operations_AddAmbulance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Ambulance (AmbulanceName, AmbulanceStatus) " +
                "VALUES (@AmbulanceName, @AmbulanceStatus)";
            cmd.Parameters.AddWithValue("@AmbulanceName", txtAmbulance.Text);
            cmd.Parameters.AddWithValue("@AmbulanceStatus", ddlStatus.SelectedValue);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
        }
    }
}