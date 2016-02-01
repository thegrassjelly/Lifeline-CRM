using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

public partial class Admin_OpportunityTracking_ViewOpportunityList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOpportunityList();
            gvOpportunityList.DataBind();
        }    
    }

    DataSet GetOpportunityList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Distinct OpportunityID, ClientName, AccountName, Rating, " +
                              "Source, DateAdded, CloseDate, Amount, Probability, Stage, " +
                              "Priority FROM OpportunityTracking";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }

    protected void gvOpportunityList_OnDataBinding(object sender, EventArgs e)
    {
        gvOpportunityList.DataSource = GetOpportunityList();
    }

    protected void gvOpportunityDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["OpportunityID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvOpportunityActivity_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["OpportunityID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}