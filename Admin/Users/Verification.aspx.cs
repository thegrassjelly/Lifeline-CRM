using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

public partial class Admin_Users_Verification : System.Web.UI.Page
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
            cmd.CommandText = "SELECT ScanID, Users.UserID, UserPic, FirstName, LastName, UserType, Status, " +
                              "UploadDate FROM Users INNER JOIN Types ON Users.TypeID=Types.TypeID INNER JOIN Verification " +
                              "ON Users.UserID=Verification.UserID ORDER BY UserID DESC";
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
}