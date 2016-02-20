using System;
using System.Data.SqlClient;
using System.IO;


public partial class Admin_Articles_ArticleSingle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int articleID = 0;
            bool validArticle = int.TryParse(Request.QueryString["ID"].ToString(), out articleID);

            if (validArticle)
            {
                if (!IsPostBack)
                {
                    GetArticle(articleID);
                    fbdiv.Attributes["data-href"] = Request.Url.Authority + "/Account/ArticleView.aspx?ID=" +
                                Request.QueryString["ID"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Admin/Articles/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Articles/View.aspx");
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    void GetArticle(int articleID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ArticleType, Others, DateSubmitted, ArticlePic, " +
                "Title, Summary, Body FROM Articles WHERE ArticleID=@ArticleID";
            cmd.Parameters.AddWithValue("@ArticleID", articleID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtTitle.Text = data["Title"].ToString();
                        txtSummary.Text = data["Summary"].ToString();
                        ddlArticleCat.SelectedValue = data["ArticleType"].ToString();
                        imgArticle.ImageUrl = "~/articlepics/" + data["ArticlePic"].ToString();
                        imgArticlelnk.NavigateUrl = "~/articlepics/" + data["ArticlePic"].ToString();
                        txtOthers.Text = data["Others"].ToString();
                        DateTime dDate = Convert.ToDateTime(data["DateSubmitted"].ToString());
                        txtDateSubmitted.Text = dDate.ToString("MM/dd/yyyy");
                        txtMessage.Text = data["Body"].ToString();
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            if (!fileImgArticle.HasFile)
            {
                cmd.CommandText = "UPDATE Articles SET Title=@Title, Summary=@Summary, " +
                    "ArticleType=@ArticleType, Others=@Others, Body=@Body " +
                    "WHERE ArticleID=@ArticleID";
            }
            else
            {
                cmd.CommandText = "UPDATE Articles SET Title=@Title, Summary=@Summary, " +
                    "ArticleType=@ArticleType, ArticlePic=@ArticlePic, Others=@Others, Body=@Body " +
                    "WHERE ArticleID=@ArticleID";

            }
            cmd.Parameters.AddWithValue("@ArticleID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@Summary", txtSummary.Text);
            cmd.Parameters.AddWithValue("@ArticleType", ddlArticleCat.SelectedValue);

            string fileExt = Path.GetExtension(fileImgArticle.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@ArticlePic", id + fileExt);
            fileImgArticle.SaveAs(Server.MapPath("~/articlepics/" + id + fileExt));

            cmd.Parameters.AddWithValue("@Others", txtOthers.Text);
            cmd.Parameters.AddWithValue("@Body", txtMessage.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Admin/Articles/View.aspx"); 
        }
    }
}