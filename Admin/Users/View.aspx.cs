using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

public partial class Admin_Users_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetUserList();
            gvUsers.DataBind();
            
        }
    }

    DataSet GetUserList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT UserID, UserPic, FirstName, LastName, UserType, Priority, DateAdded, Status " +
                              "FROM Users INNER JOIN Types ON Users.TypeID=Types.TypeID ORDER BY UserID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");
            return ds;
        }
    }


    protected void grid_DataBinding(object sender, EventArgs e)
    {
        gvUsers.DataSource = GetUserList();
    }

    protected void gvUserDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["UserID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvUserMessages_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["UserID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvUserRenewals_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["UserID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvSecondaryContacts_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["UserID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvMedicalInfo_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["UserID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void gvUserEmployer_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["UserID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}
