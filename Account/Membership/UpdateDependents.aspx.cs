using System;
using System.Data.SqlClient;

public partial class Account_Membership_UpdateDependents : System.Web.UI.Page
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
                Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
        }
    }

    void GetDependent(int depID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT FirstName, LastName, Birthday, Relationship, " +
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
                    ddlRelationship.SelectedValue = data["Relationship"].ToString();
                    txtOtherRel.Text = data["OtherRel"].ToString();
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
            cmd.CommandText = "UPDATE Dependents SET FirstName=@FirstName, " +
                "LastName=@LastName, Birthday=@Birthday, Relationship=@Relationship, " +
                "OtherRel=@OtherRel WHERE DependentID=@DepID";
            cmd.Parameters.AddWithValue("@DepID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.ToString());
            cmd.Parameters.AddWithValue("@Birthday", txtBday.Text.ToString());
            cmd.Parameters.AddWithValue("@Relationship", ddlRelationship.SelectedValue);
            cmd.Parameters.AddWithValue("@OtherRel", txtOtherRel.Text.ToString());
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
        }
    }
}