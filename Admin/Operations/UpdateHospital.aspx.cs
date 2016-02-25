using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

public partial class Admin_Operations_UpdateHospital : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int hospitalID = 0;
            bool validHospital = int.TryParse(Request.QueryString["ID"].ToString(), out hospitalID);

            if (validHospital)
            {
                if (!IsPostBack)
                {
                    GetHospital(hospitalID);
                };
            }
            else
            {
                Response.Redirect("~/Admin/Operations/ViewHospitals.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Operations/ViewHospitals.aspx");
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    void GetHospital(int hospitalID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT HospitalName, Address, Municipality, " +
                "City FROM Hospitals WHERE HospitalID=@hospitalID";
            cmd.Parameters.AddWithValue("@hospitalID", hospitalID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtHospital.Text = data["HospitalName"].ToString();
                        txtAddress.Text = data["Address"].ToString();
                        txtMunicipality.Text = data["Municipality"].ToString();
                        txtCity.Text = data["City"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
                }
            }
        }
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE Hospitals SET HospitalName=@HospitalName, Address=@Address, " +
                "Municipality=@Municipality, City=@City, DateModified=@DateModified WHERE HospitalID=@hospitalID";
            cmd.Parameters.AddWithValue("@hospitalID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@HospitalName", txtHospital.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewHospitals.aspx");
        }
    }
}