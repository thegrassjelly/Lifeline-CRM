using System;
using System.Data.SqlClient;

public partial class Admin_OpportunityTracking_AddOpportunity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
    }

    protected void btnAdd_OnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO OpportunityTracking (ClientName, AccountName, Rating, " +
                    "Details, Source, DateAdded, DateModified, CloseDate, Amount, Probability, Stage, Type, " +
                    "PhoneNo, Email, Priority) VALUES (@ClientName, @AccountName, " +
                    "@Rating, @Details, @Source, @DateAdded, @DateModified, @CloseDate, @Amount, " +
                    "@Probability, @Stage, @Type, @PhoneNo, @Email, @Priority)";
                cmd.Parameters.AddWithValue("@ClientName", txtName.Text.ToString());
                cmd.Parameters.AddWithValue("@AccountName", txtAccountName.Text.ToString());
                cmd.Parameters.AddWithValue("@Rating", ddlRating.SelectedValue);
                cmd.Parameters.AddWithValue("@Details", txtDesctiption.Text.ToString());
                cmd.Parameters.AddWithValue("@Source", ddlSource.SelectedValue);
                cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
                cmd.Parameters.AddWithValue("@CloseDate", txtCloseDate.DbSelectedDate);
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.ToString());
                cmd.Parameters.AddWithValue("@Probability", txtProbability.Text.ToString());
                cmd.Parameters.AddWithValue("@Stage", ddlStage.SelectedValue);
                cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
                cmd.Parameters.AddWithValue("@PhoneNo", txtContact.Text.ToString());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                cmd.Parameters.AddWithValue("@Priority", ddlPriority.SelectedValue);
                cmd.ExecuteNonQuery();

                Response.Redirect("~/Admin/OpportunityTracking/ViewOpportunityList.aspx");
            }
            catch (SqlException ex)
            {
                Helper.LogException(Session["userid"].ToString(), 
                    "Opportunity Tracking, Add Opportunity", "Exception Type: " +
                    ex.GetType().ToString() + "Exception: " + ex.ToString());
                Helper.Alert("The record was not added, try again", "");
            }
        }
    }
}