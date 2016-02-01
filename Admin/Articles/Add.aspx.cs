using System;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Articles_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Articles (ArticleType, Others, " +
                "DateSubmitted, ArticlePic, Title, Summary, Body, UserID) VALUES " +
                "(@ArticleType, @Others, @DateSubmitted, @ArticlePic, @Title, @Summary, " +
                "@Body, @UserID)";
            cmd.Parameters.AddWithValue("@ArticleType", ddlArticleCat.SelectedValue);
            cmd.Parameters.AddWithValue("@Others", txtOthers.Text.ToString());
            cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);

            if (!fileImgArticle.HasFile)
            {
                cmd.Parameters.AddWithValue("@ArticlePic", "900x300.png");
            }
            else
            {
                string fileExt = Path.GetExtension(fileImgArticle.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@ArticlePic", id + fileExt);
                fileImgArticle.SaveAs(Server.MapPath("~/articlepics/" + id + fileExt));
            }

            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.ToString());
            cmd.Parameters.AddWithValue("@Summary", txtSummary.Text.ToString());
            cmd.Parameters.AddWithValue("@Body", ckeBody.Text.ToString());
            cmd.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Admin/Articles/View.aspx"); 
        }
    }
}