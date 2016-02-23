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
    public static List<string> SearchCity(string prefixText)
    {
        List<string> cities = new List<string>();
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "SELECT Name FROM Cities WHERE " +
                    "Name LIKE @SearchText + '%'";
            cmd.Parameters.AddWithValue("@SearchText", prefixText);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    cities.Add(dr["Name"].ToString());
                }
            }
            con.Close();
        }
        return cities;
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
            cmd.Parameters.AddWithValue("@Dispatcher", txtDispatcher.Text);
            cmd.Parameters.AddWithValue("@Date", txtCallDate.Text);
            cmd.Parameters.AddWithValue("@Ambulance", txtAmbulance.Text);
            cmd.Parameters.AddWithValue("@TeamLeader", txtTL.Text);
            cmd.Parameters.AddWithValue("@TransportOfficer", txtTransportOfficer.Text);
            cmd.Parameters.AddWithValue("@TreatmentOfficer", txtTreatmentOfficer.Text);
            cmd.Parameters.AddWithValue("@ReceivingHospital", txtHospital.Text);
            cmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
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