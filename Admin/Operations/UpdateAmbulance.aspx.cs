using System;
using System.Data.SqlClient;

public partial class Admin_Operations_UpdateAmbulance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int ambulanceID = 0;
            bool validAmbulance = int.TryParse(Request.QueryString["ID"].ToString(), out ambulanceID);

            if (validAmbulance)
            {
                if (!IsPostBack)
                {
                    GetAmbulance(ambulanceID);
                };
            }
            else
            {
                Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
        }
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    void GetAmbulance(int ambulanceID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT AmbulanceName, PlateNo, " +
                "AmbulanceStatus FROM Ambulance WHERE " +
                "AmbulanceID=@ambulanceID";
            cmd.Parameters.AddWithValue("@ambulanceID", ambulanceID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtAmbulance.Text = data["AmbulanceName"].ToString();
                        txtPlate.Text = data["PlateNo"].ToString();
                        ddlStatus.SelectedValue = data["AmbulanceStatus"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
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
            cmd.CommandText = "UPDATE Ambulance SET AmbulanceName=@AmbulanceName, PlateNo=@PlateNo, " +
                "AmbulanceStatus=@AmbulanceStatus, DateModified=@DateModified WHERE AmbulanceID=@ambulanceID";
            cmd.Parameters.AddWithValue("@ambulanceID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@AmbulanceName", txtAmbulance.Text);
            cmd.Parameters.AddWithValue("@PlateNo", txtPlate.Text);
            cmd.Parameters.AddWithValue("@AmbulanceStatus", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Operations/ViewAmbulance.aspx");
        }
    }
}