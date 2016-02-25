using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

public partial class Admin_Operations_AddHospitals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        this.Form.DefaultButton = this.btnAdd.UniqueID;
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Hospitals (HospitalName, Address, Municipality, City, DateAdded) " +
                "VALUES (@HospitalName, @Address, @Municipality, @City, @DateAdded)";
            cmd.Parameters.AddWithValue("@HospitalName", txtHospital.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewHospitals.aspx");
        }
    }
}