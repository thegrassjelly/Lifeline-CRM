using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_OpportunityTracking_OpportunityDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int opportunityID = 0;
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out opportunityID);

            if (validID)
            {
                if (!IsPostBack)
                {
                    GetOpportunityDetails(opportunityID);
                    if (Session["updated"] != null)
                    {
                        opportunity.Visible = true;
                        Session.Remove("updated");
                    }
                }
            }
            else
            {
                Response.Redirect("~/Admin/OpportunityTracking/VeiwOpportunityList.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/OpportunityTracking/VeiwOpportunityList.aspx");
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    void GetOpportunityDetails(int opportunityId)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ClientName, AccountName, Details, PhoneNo, Email, " +
                              "Type, Rating, Source, Priority, Stage, Amount, Probability, CloseDate " +
                              "FROM OpportunityTracking WHERE OpportunityID=@OpID";
            cmd.Parameters.AddWithValue("@OpID", opportunityId);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtName.Text = data["ClientName"].ToString();
                    txtAccountName.Text = data["AccountName"].ToString();
                    txtDesctiption.Text = data["Details"].ToString();
                    txtContact.Text = data["PhoneNo"].ToString();
                    txtEmail.Text = data["Email"].ToString();
                    ddlType.SelectedValue = data["Type"].ToString();
                    ddlSource.SelectedValue = data["Source"].ToString();
                    ddlPriority.SelectedValue = data["Priority"].ToString();
                    ddlStage.SelectedValue = data["Stage"].ToString();
                    txtAmount.Text = data["Amount"].ToString();
                    txtProbability.Text = data["Probability"].ToString();
                    DateTime someDate = Convert.ToDateTime(data["CloseDate"].ToString());
                    txtCloseDate.Text = someDate.ToString("yyyy-MM-dd");
                }
            }
        }
    }

    protected void btnUpdate_OnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE OpportunityTracking SET ClientName=@ClientName, " +
                              "AccountName=@AccountName, Details=@Details, PhoneNo=@PhoneNo, Email=@Email, " +
                              "Type=@Type, Source=@Source, Priority=@Priority, Stage=@Stage, Amount=@Amount, " +
                              "Probability=@Probability, CloseDate=@CloseDate, DateModified=@DateModified WHERE " +
                              "OpportunityID=@OpportunityID";
            cmd.Parameters.AddWithValue("@OpportunityID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@Clientname", txtName.Text.ToString());
            cmd.Parameters.AddWithValue("@AccountName", txtAccountName.Text.ToString());
            cmd.Parameters.AddWithValue("@Details", txtDesctiption.Text.ToString());
            cmd.Parameters.AddWithValue("@PhoneNo", txtContact.Text.ToString());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
            cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
            cmd.Parameters.AddWithValue("@Source", ddlType.SelectedValue);
            cmd.Parameters.AddWithValue("@Priority", ddlPriority.SelectedValue);
            cmd.Parameters.AddWithValue("@Stage", ddlStage.SelectedValue);
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text.ToString());
            cmd.Parameters.AddWithValue("@Probability", txtProbability.Text.ToString());
            cmd.Parameters.AddWithValue("@CloseDate", txtCloseDate.Text);
            cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
            cmd.ExecuteNonQuery();
            Session["updated"] = "yes";
            Response.Redirect(Request.RawUrl);
        }
    }
}