using System;
using System.Data.SqlClient;

public partial class Admin_Users_MessageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int messageID = 0;
            bool validMessage = int.TryParse(Request.QueryString["ID"].ToString(), out messageID);

            if (validMessage)
            {
                if (!IsPostBack)
                {
                    GetMessageDetails(messageID);
                }
            }
            else
            {
                Response.Redirect("~/Admin/Users/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Users/View.aspx");
        }
    }

    void GetMessageDetails(int messageID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MessageCat, Subject, DateSubmitted, Message, " +
                "Messages.Email, FirstName, LastName, Messages.UserID FROM Messages INNER JOIN Users ON " +
                "Messages.UserID=Users.UserID WHERE Messages.MessageID=@MessageID";
            cmd.Parameters.AddWithValue("MessageID", messageID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtFirstName.Text = data["FirstName"].ToString();
                        txtLastName.Text = data["LastName"].ToString();
                        txtEmail.Text = data["Email"].ToString();
                        txtCategory.Text = data["MessageCat"].ToString();
                        txtSubject.Text = data["Subject"].ToString();
                        DateTime dDate = Convert.ToDateTime(data["DateSubmitted"].ToString());
                        txtDate.Text = dDate.ToString("MM/dd/yyyy");
                        txtMessage.Text = data["Message"].ToString();
                        Session["messageuser"] = data["UserID"].ToString();
                    }
                }
                else
                {
                    con.Close();
                    Response.Redirect("~/Admin/Feedback/ViewFeedback.aspx");
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
            cmd.CommandText = "UPDATE Messages SET Status=@Status " +
                "WHERE MessageID=@MessageID";
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@MessageID", Request.QueryString["ID"].ToString());
            cmd.ExecuteNonQuery();

            Response.Redirect("~/Admin/Users/Update.aspx?ID=" + Session["messageuser"].ToString()); 
        }
    }
}