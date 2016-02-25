using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;
using System.Web.Services;
using System.Collections.Generic;

public partial class Admin_Users_Dispatch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int userID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

            if (validUser)
            {
                if (!IsPostBack)
                {
                    GetMedicalList(userID);
                    gvMedicalList.DataBind();
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
        if (Session["medical"] != null)
        {
            medical.Visible = true;
            Session.Remove("medical");
        }
        else
        {
            medical.Visible = false;
        }
        this.Form.DefaultButton = this.btnInsert.UniqueID;
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

    DataSet GetMedicalList(int userID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DispatchID, Operation, Details, StartDate, EndDate " +
                "FROM MedicalHistory WHERE MedicalHistory.UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", userID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "MedicalHistory");
            return ds;
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Dispatch VALUES (@UserID, @Dispatcher, @Date, @Ambulance, " +
                "@TeamLeader, @TransportOfficer, @TreatmentOfficer, @ReceivingHospital); " +
                "SELECT TOP 1 DispatchID FROM Dispatch ORDER BY DispatchID DESC";
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@Dispatcher", txtDispatcher.Text);
            cmd.Parameters.AddWithValue("@Date", txtCallDate.Text);
            cmd.Parameters.AddWithValue("@Ambulance", txtAmbulance.Text);
            cmd.Parameters.AddWithValue("@TeamLeader", txtTL.Text);
            cmd.Parameters.AddWithValue("@TransportOfficer", txtTransportOfficer.Text);
            cmd.Parameters.AddWithValue("@TreatmentOfficer", txtTreatmentOfficer.Text);
            cmd.Parameters.AddWithValue("@ReceivingHospital", txtHospital.Text);
            int DispatchID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "INSERT INTO MedicalHistory VALUES (@UserID, @DispatchID, " +
                "@Operation, @Details, @StartDate, @EndDate)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@DispatchID", DispatchID);
            cmd.Parameters.AddWithValue("@Operation", txtOperation.Text);
            cmd.Parameters.AddWithValue("@Details", txtDetails.Text);
            cmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
            if (txtEndDate.Text == "")
            {
                cmd.Parameters.AddWithValue("@EndDate", txtStartDate.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
            }
            cmd.ExecuteNonQuery();

            Session["medical"] = "yes";
            Response.Redirect(Request.RawUrl); 
        }
    }

    protected void gvMedicalList_OnDataBinding(object sender, EventArgs e)
    {
        gvMedicalList.DataSource = GetMedicalList(Convert.ToInt32(Request.QueryString["ID"]));
    }

    protected void gvDispatchDetails_OnBeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["DispatchID"] = (sender as ASPxGridView).GetMasterRowKeyValue();

    }
}