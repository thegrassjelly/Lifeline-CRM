using System;
using System.Data.SqlClient;

public partial class Admin_Medical_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int dispatchID = 0;
            bool validDispatch = int.TryParse(Request.QueryString["ID"].ToString(), out dispatchID);

            if (validDispatch)
            {
                if (!IsPostBack)
                {
                    GetMedicalHistory(dispatchID);
                    GetDispatchInfo(dispatchID);
                }
            }
            else
            {
                Response.Redirect("~/Admin/Medical/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Medical/View.aspx");
        }
    }

    void GetDispatchInfo(int ID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        { 
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DispatchID, Dispatcher, Date, Ambulance, " +
                "TeamLeader, TransportOfficer, TreatmentOfficer, ReceivingHospital, " +
                "Municipality, City FROM Dispatch WHERE DispatchID=@DispatchID";
            cmd.Parameters.AddWithValue("@DispatchID", ID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {
                        txtDispatchID.Text = data["DispatchID"].ToString();
                        txtDispatcher.Text = data["Dispatcher"].ToString();
                        txtDate.Text = data["Date"].ToString();
                        DateTime dDate = Convert.ToDateTime(data["Date"].ToString());
                        txtDate.Text = dDate.ToString("MM/dd/yyyy");
                        txtAmbulance.Text = data["Ambulance"].ToString();
                        txtTL.Text = data["TeamLeader"].ToString();
                        txtTransport.Text = data["TransportOfficer"].ToString();
                        txtTreatment.Text = data["TreatmentOfficer"].ToString();
                        txtHospital.Text = data["ReceivingHospital"].ToString();
                        txtMunicipality.Text = data["Municipality"].ToString();
                        txtCity.Text = data["City"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("View.aspx");
                }  
            }
        }
    }

    void GetMedicalHistory(int ID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Operation, Details, StartDate, EndDate " +
                "FROM MedicalHistory WHERE DispatchID=@DispatchID";
            cmd.Parameters.AddWithValue("@DispatchID", ID);
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                if (data.HasRows)
                {
                    while (data.Read())
                    {

                        DateTime sDate = Convert.ToDateTime(data["StartDate"].ToString());
                        DateTime eDate = Convert.ToDateTime(data["EndDate"].ToString());

                        txtOperation.Text = data["Operation"].ToString();
                        txtStartDate.Text = sDate.ToString("MM/dd/yyyy");
                        txtEndDate.Text = eDate.ToString("MM/dd/yyyy");
                        txtDetails.Text = data["Details"].ToString();

                    }
                }
                else
                {
                    Response.Redirect("View.aspx");
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
            cmd.CommandText = "UPDATE Dispatch SET Dispatcher=@Dispatcher, Date=@Date, " +
                              "Ambulance=@Ambulance, TeamLeader=@TeamLeader, " +
                              "TransportOfficer=@TransportOfficer, TreatmentOfficer=@TreatmentOfficer, " +
                              "ReceivingHospital=@ReceivingHospital, Municipality=@Municipality, " +
                              "City=@City WHERE DispatchID=@DispatchID";
            cmd.Parameters.AddWithValue("@DispatchID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@Dispatcher", txtDispatcher.Text.ToString());
            cmd.Parameters.AddWithValue("@Date", txtDate.Text.ToString());
            cmd.Parameters.AddWithValue("@Ambulance", txtAmbulance.Text.ToString());
            cmd.Parameters.AddWithValue("@TeamLeader", txtTL.Text.ToString());
            cmd.Parameters.AddWithValue("@TransportOfficer", txtTransport.Text.ToString());
            cmd.Parameters.AddWithValue("@TreatmentOfficer", txtTreatment.Text.ToString());
            cmd.Parameters.AddWithValue("@ReceivingHospital", txtHospital.Text.ToString());
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
            cmd.Parameters.AddWithValue("@City", Request.QueryString["ID"].ToString());
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/Medical/View.aspx");
        }
    }
}