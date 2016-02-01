using System;
using System.Data.SqlClient;

public partial class Account_ArticleView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (Request.QueryString["ID"] != null)
        {
            fbdiv.Attributes["data-href"] = Request.Url.Authority + Request.RawUrl;
            int articleID = 0;
            bool validArticle = int.TryParse(Request.QueryString["ID"].ToString(), out articleID);

            if (validArticle)
            {
                if (!IsPostBack)
                {
                    GetArticle(articleID);
                }
            }
            else
            {
                Response.Redirect("~/Account/Default.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Account/Default.aspx");
        }
    }

    void GetArticle(int articleID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, ArticleType, Others, DateSubmitted, ArticlePic, " +
                "Title, Summary, Body FROM Articles INNER JOIN Users ON Articles.UserID=" +
                "Users.UserID WHERE ArticleID=@ArticleID";
            cmd.Parameters.AddWithValue("@ArticleID", articleID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        ltLN.Text = data["LastName"].ToString();
                        ltFN.Text = data["FirstName"].ToString();
                        ltTitle.Text = data["Title"].ToString();
                        ltSummary.Text = data["Summary"].ToString();
                        ltArticleType.Text = data["ArticleType"].ToString();
                        imgArticlePic.ImageUrl = "~/articlepics/" + data["ArticlePic"].ToString();
                        imgArticleLink.NavigateUrl = "~/articlepics/" + data["ArticlePic"].ToString();
                        ltOthers.Text = data["Others"].ToString();
                        DateTime dDate = Convert.ToDateTime(data["DateSubmitted"].ToString());
                        ltDateSubmitted.Text = dDate.ToString("MM/dd/yyyy");
                        ltBody.Text = data["Body"].ToString();
                    }
                    con.Close();
                }
                else
                {
                    con.Close();
                    Response.Redirect("~/Admin/Articles/View.aspx");
                }  
            }
        }
    }
}