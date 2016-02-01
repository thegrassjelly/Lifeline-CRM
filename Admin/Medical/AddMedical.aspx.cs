using System;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

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
                "@TeamLeader, @TransportOfficer, @TreatmentOfficer, @ReceivingHospital, " +
                "@Municipality, @City); SELECT TOP 1 DispatchID FROM Dispatch ORDER BY DispatchID DESC";
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@Dispatcher", txtDispatcher.Text.ToString());
            cmd.Parameters.AddWithValue("@Date", txtCallDate.DbSelectedDate);
            cmd.Parameters.AddWithValue("@Ambulance", txtAmbulance.Text.ToString());
            cmd.Parameters.AddWithValue("@TeamLeader", txtTL.Text.ToString());
            cmd.Parameters.AddWithValue("@TransportOfficer", txtTransportOfficer.Text.ToString());
            cmd.Parameters.AddWithValue("@TreatmentOfficer", txtTreatmentOfficer.Text.ToString());
            cmd.Parameters.AddWithValue("@ReceivingHospital", txtHospital.Text.ToString());
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text.ToString());
            cmd.Parameters.AddWithValue("@City", txtCity.Text.ToString());
            int DispatchID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "INSERT INTO MedicalHistory VALUES (@UserID, @DispatchID, " +
                "@Operation, @Details, @StartDate, @EndDate)";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@DispatchID", DispatchID);
            cmd.Parameters.AddWithValue("@Operation", txtOperation.Text.ToString());
            cmd.Parameters.AddWithValue("@Details", txtDetails.Text.ToString());
            cmd.Parameters.AddWithValue("@StartDate", txtStartDate.DbSelectedDate);
            if (txtEndDate.DbSelectedDate == "")
            {
                cmd.Parameters.AddWithValue("@EndDate", txtStartDate.DbSelectedDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@EndDate", txtEndDate.DbSelectedDate);
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