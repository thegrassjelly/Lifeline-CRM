using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Medical_View : System.Web.UI.Page
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
            cmd.CommandText = "SELECT UserID, UserPic, FirstName, LastName, UserType, DateAdded, Status " +
                "FROM Users INNER JOIN Types ON Users.TypeID=Types.TypeID ORDER BY Users.UserID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Users");
            return ds;
        }
    }

    protected void gvUsers_OnDataBinding(object sender, EventArgs e)
    {
        gvUsers.DataSource = GetUserList();
    }
}