using System;
using System.Data.SqlClient;

public partial class Account_Membership_PaymentHistoryDep : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (Request.QueryString["ID"] != null)
        {
            int dependentID = 0;
            bool validDependent = int.TryParse(Request.QueryString["ID"].ToString(), out dependentID);

            if (validDependent)
            {
                if (!IsPostBack)
                {
                    GetDependent(dependentID);
                }
            }
            else
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
        }
        else
        {
            Response.Redirect(Request.UrlReferrer.ToString());
        }
    }

    void GetDependent(int depID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT MembershipID, FirstName, LastName, Birthday, Relationship, " +
                "OtherRel FROM Dependents WHERE DependentID=@DepID";
            cmd.Parameters.AddWithValue("@DepID", depID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtFirstName.Text = data["FirstName"].ToString();
                    txtLastName.Text = data["LastName"].ToString();
                    DateTime bDay = Convert.ToDateTime(data["Birthday"].ToString());
                    txtBday.Text = bDay.ToString("MM/dd/yyyy");
                    txtRelationship.Text = data["Relationship"].ToString();
                    txtOtherRel.Text = data["OtherRel"].ToString();
                    Session["MemID"] = data["MembershipID"].ToString();
                }
            }
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Membership/PaymentsHistoryDetails.aspx?ID=" + Session["MemID"].ToString());
    }
}