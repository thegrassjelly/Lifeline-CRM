using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Operations_ViewResponders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetResponder();
        }
    }

    void GetResponder()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ResponderID, FirstName, LastName, Title, Status, " +
                "DateAdded, DateModified FROM Responder";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Responder");
            lvResponder.DataSource = ds;
            lvResponder.DataBind();
        }
    }

    void SortResponder(string Column, string Dir)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ResponderID, FirstName, LastName, Title, Status, " +
                "DateAdded, DateModified FROM Responder ORDER BY " + Column + " " + Dir;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Responder");
            lvResponder.DataSource = ds;
            lvResponder.DataBind();
        }
    }

    protected void lvResponder_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ddlDirection.SelectedValue != "" && ddlSortBy.SelectedValue != "")
        {
            SortResponder(ddlSortBy.SelectedValue, ddlDirection.SelectedValue);
        }
        else
        {
            GetResponder();
        }
    }

    protected void ddlDirection_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortResponder(sortBy, direction);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var sortBy = ddlSortBy.SelectedValue;
        var direction = ddlDirection.SelectedValue;
        SortResponder(sortBy, direction);
    }
}