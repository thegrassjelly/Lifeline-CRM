using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Feedback_ViewFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetFeedbacks();
            gvFeedbackList.DataBind();
        }
    }

    DataSet GetFeedbacks()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText =
                "SELECT MessageID, MessageCat, Subject, DateSubmitted, Messages.Status, FirstName, LastName, Messages.Email " +
                "FROM Messages INNER JOIN Users ON Messages.UserID=Users.UserID WHERE Messages.Category='Feedback' " +
                "ORDER BY MessageID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            return ds;
        }
    }

    protected void gvFeedbackList_OnDataBinding(object sender, EventArgs e)
    {
        gvFeedbackList.DataSource = GetFeedbacks();
    }

    void EmailCampaign()
    {
        
    }
}