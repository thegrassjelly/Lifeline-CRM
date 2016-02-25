using System;
using System.Data.SqlClient;

public partial class Account_Medical_Dispatch : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
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
                Response.Redirect("~/Account/Medical/View.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Account/Medical/View.aspx");
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
                "Address, Municipality, City FROM Dispatch INNER JOIN Hospitals ON " +
                "Dispatch.ReceivingHospital=Hospitals.HospitalName WHERE DispatchID=@DispatchID";
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
                        txtAmbulance.Text = data["Ambulance"].ToString();
                        txtTL.Text = data["TeamLeader"].ToString();
                        txtTransport.Text = data["TransportOfficer"].ToString();
                        txtTreatment.Text = data["TreatmentOfficer"].ToString();
                        txtHospital.Text = data["ReceivingHospital"].ToString();
                        txtAddress.Text = data["Address"].ToString();
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
                    con.Close();
                }
                else
                {
                    con.Close();
                    Response.Redirect("View.aspx");
                }
            }
        }
    }
}