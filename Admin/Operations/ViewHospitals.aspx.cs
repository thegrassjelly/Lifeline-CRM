using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Operations_ViewHospitals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetHospital();
        } 
    }

    void GetHospital()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT HospitalID, HospitalName, Address, Municipality, " +
                "City, DateAdded, DateModified FROM Hospitals";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Hospitals");
            lvHospital.DataSource = ds;
            lvHospital.DataBind();
        }
    }

    void SortHospital(string Column, string Dir)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT HospitalID, HospitalName, Address, Municipality, " +
                "City, DateAdded, DateModified FROM Hospitals ORDER BY " + Column + " " + Dir;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Ambulance");
            lvHospital.DataSource = ds;
            lvHospital.DataBind();
        }

    }

    protected void lvHospital_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortHospital(ddlSortBy.SelectedValue, ddlDirection.SelectedValue);
        }
        else
        {
            GetHospital();
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortHospital(sortBy, direction);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortHospital(sortBy, direction);
    }
}