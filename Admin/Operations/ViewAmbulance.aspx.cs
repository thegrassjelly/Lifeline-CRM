using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Operations_ViewAmbulance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetAmbulance();
        }  
    }

    void GetAmbulance()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT AmbulanceID, AmbulanceName, PlateNo, AmbulanceStatus, " +
                "DateAdded, DateModified FROM Ambulance";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Ambulance");
            lvAmbulance.DataSource = ds;
            lvAmbulance.DataBind();
        }
    }

    void SortAmbulance(string Column, string Dir)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT AmbulanceID, AmbulanceName, PlateNo, AmbulanceStatus, DateAdded " +
                "FROM Ambulance ORDER BY " + Column + " " + Dir;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Ambulance");
            lvAmbulance.DataSource = ds;
            lvAmbulance.DataBind();
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortAmbulance(ddlSortBy.SelectedValue, ddlDirection.SelectedValue);
        }
        else
        {
            GetAmbulance();
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortAmbulance(sortBy, direction);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortAmbulance(sortBy, direction);
    }

}