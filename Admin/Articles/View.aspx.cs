using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Articles_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetArticles();
        }
    }

    void GetArticles()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ArticleID, ArticleType, Others, DateSubmitted, " +
                "ArticlePic, Title, Summary, FirstName, LastName FROM Articles INNER JOIN " +
                "Users on Articles.UserID=Users.UserID ORDER BY DateSubmitted DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Articles");
            lvArticles.DataSource = ds;
            lvArticles.DataBind();
        }
    }

    protected void lv_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        lvDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetArticles();
    }
}