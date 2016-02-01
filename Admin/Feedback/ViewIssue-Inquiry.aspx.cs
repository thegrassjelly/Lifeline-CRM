using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Feedback_ViewIssue_Inquiry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetIssueInquiryList();
            gvIssueInquiry.DataBind();
        }
    }

    DataSet GetIssueInquiryList()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText =
                "SELECT MessageID, MessageCat, Subject, DateSubmitted, Messages.Status, FirstName, LastName, Messages.Email " +
                "FROM Messages INNER JOIN Users ON Messages.UserID=Users.UserID WHERE Messages.Category='Issues/Inquiries' " +
                "OR Messages.Category='Frontpage' ORDER BY MessageID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            return ds;
        }
    }


    protected void gvIssueInquiry_OnDataBinding(object sender, EventArgs e)
    {
        gvIssueInquiry.DataSource = GetIssueInquiryList();
    }
}