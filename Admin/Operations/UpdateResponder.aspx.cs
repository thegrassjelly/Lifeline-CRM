using System;
using System.Data.SqlClient;

public partial class Admin_Operations_UpdateResponder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int responderID = 0;
            bool validResponder = int.TryParse(Request.QueryString["ID"].ToString(), out responderID);

            if (validResponder)
            {
                if (!IsPostBack)
                {
                    GetResponder(responderID);
                };
            }
            else
            {
                Response.Redirect("~/Admin/Operations/ViewResponders.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Operations/ViewResponders.aspx");
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    void GetResponder(int responderID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Title, Status " +
                "FROM Responder WHERE ResponderID=@responderID";
            cmd.Parameters.AddWithValue("@responderID", responderID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtFirstName.Text = data["FirstName"].ToString();
                        txtLastName.Text = data["LastName"].ToString();
                        ddlTitle.SelectedValue = data["Title"].ToString();
                        ddlStatus.SelectedValue = data["Status"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Operations/ViewResponders.aspx");
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
            cmd.CommandText = "UPDATE Responder SET FirstName=@FirstName, LastName=@LastName, " +
                "Title=@Title, Status=@Status, DateModified=@DateModified WHERE ResponderID=@responderID";
            cmd.Parameters.AddWithValue("@responderID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Title", ddlTitle.SelectedValue);
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewResponders.aspx");
        }
    }
}