using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

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
        this.Form.DefaultButton = this.btnUpdate.UniqueID;
    }

    [WebMethod]
    public static List<string> SearchAmbulance(string ambulanceText)
    {
        List<string> ambulance = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT AmbulanceName FROM Ambulance WHERE " +
                    "AmbulanceName LIKE @SearchText + '%'";
            cmd.Parameters.AddWithValue("@SearchText", ambulanceText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    ambulance.Add(dr["AmbulanceName"].ToString());
                }
            }
            con.Close();
        }
        return ambulance;
    }

    [WebMethod]
    public static List<string> SearchHospital(string hospitalText)
    {
        List<string> hospital = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT HospitalName FROM " + 
                "Hospitals WHERE HospitalName LIKE @SearchText + '%'";
            cmd.Parameters.AddWithValue("@SearchText", hospitalText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    hospital.Add(dr["HospitalName"].ToString());
                }
            }
            con.Close();
        }
        return hospital;
    }

    [WebMethod]
    public static List<string> SearchDispatcher(string dpText)
    {
        List<string> dispatcher = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT FirstName, LastName FROM " +
                "Responder WHERE Title='Dispatcher' AND Status='Active' " +
                "AND (LastName LIKE @SearchText + '%' OR FirstName LIKE @SearchText + '%')";
            cmd.Parameters.AddWithValue("@SearchText", dpText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    dispatcher.Add(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString());
                }
            }
            con.Close();
        }
        return dispatcher;
    }

    [WebMethod]
    public static List<string> SearchTeamLeader(string tlText)
    {
        List<string> tl = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT FirstName, LastName FROM " +
                "Responder WHERE Title='Team Leader' AND Status='Active' " +
                "AND (LastName LIKE @SearchText + '%' OR FirstName LIKE @SearchText + '%')";
            cmd.Parameters.AddWithValue("@SearchText", tlText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    tl.Add(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString());
                }
            }
            con.Close();
        }
        return tl;
    }

    [WebMethod]
    public static List<string> SearchTreatmentOfficer(string treatText)
    {
        List<string> treatment = new List<string>();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT FirstName, LastName FROM " +
                "Responder WHERE Title='Treatment Officer' AND Status='Active' " +
                "AND (LastName LIKE @SearchText + '%' OR FirstName LIKE @SearchText + '%')";
            cmd.Parameters.AddWithValue("@SearchText", treatText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    treatment.Add(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString());
                }
            }
            con.Close();
        }
        return treatment;
    }

    [WebMethod]
    public static List<string> SearchTransportOfficer(string transText)
    {
        List<string> transport = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT FirstName, LastName FROM " +
                "Responder WHERE Title='Transport Officer' AND Status='Active' " +
                "AND (LastName LIKE @SearchText + '%' OR FirstName LIKE @SearchText + '%')";
            cmd.Parameters.AddWithValue("@SearchText", transText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    transport.Add(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString());
                }
            }
            con.Close();
        }
        return transport;
    }

    void GetDispatchInfo(int ID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        { 
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DispatchID, Dispatcher, DispatchDate, Ambulance, " +
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
                        DateTime dDate = Convert.ToDateTime(data["DispatchDate"].ToString());
                        txtStartDate.Text = dDate.ToString("MM/dd/yyyy");
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
                        DateTime eDate = Convert.ToDateTime(data["EndDate"].ToString());

                        txtOperation.Text = data["Operation"].ToString();
                        txtEndDate.Text = eDate.ToString("MM/dd/yyyy");
                        txtEndDate2.Text = eDate.ToString("yyyy-MM-dd");
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
            cmd.CommandText = "UPDATE Dispatch SET Dispatcher=@Dispatcher, " +
                              "Ambulance=@Ambulance, TeamLeader=@TeamLeader, " +
                              "TransportOfficer=@TransportOfficer, TreatmentOfficer=@TreatmentOfficer, " +
                              "ReceivingHospital=@ReceivingHospital WHERE DispatchID=@DispatchID";
            cmd.Parameters.AddWithValue("@DispatchID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@Dispatcher", txtDispatcher.Text);
            cmd.Parameters.AddWithValue("@Ambulance", txtAmbulance.Text);
            cmd.Parameters.AddWithValue("@TeamLeader", txtTL.Text);
            cmd.Parameters.AddWithValue("@TransportOfficer", txtTransport.Text);
            cmd.Parameters.AddWithValue("@TreatmentOfficer", txtTreatment.Text);
            cmd.Parameters.AddWithValue("@ReceivingHospital", txtHospital.Text);
            cmd.ExecuteNonQuery();

            cmd.CommandText = "UPDATE MedicalHistory SET EndDate=@EndDate WHERE DispatchID=@dispatchid";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@DispatchID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@EndDate", txtEndDate2.Text);
            cmd.ExecuteNonQuery();

            Response.Redirect("~/Admin/Medical/View.aspx");
        }
    }
}