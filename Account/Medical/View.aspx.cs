using System;
using System.Data;
using System.Data.SqlClient;

public partial class Medical : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        if (!IsPostBack)
        {
            GetMedicalInfo();
            GetMedicalHistory();
        }
    }

    private void GetMedicalHistory()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DispatchID, Operation, Details, StartDate, EndDate " +
                "FROM MedicalHistory WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "MedicalHistory");
            lvMedicalHistory.DataSource = ds;
            lvMedicalHistory.DataBind();
        }
    }

    void GetMedicalInfo()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT BloodType, Allergies, CancerHis, HeartHis, EpilepsyHis, " +
                "AsthmaHis, LiverHis, Others FROM MedicalInfo WHERE UserID=@UserID";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            using (SqlDataReader data = cmd.ExecuteReader())
            {
                while (data.Read())
                {
                    txtBloodType.Text = data["BloodType"].ToString();
                    txtAllergies.Text = data["Allergies"].ToString();
                    isCancer.Text = data["CancerHis"].ToString();
                    isHeart.Text = data["HeartHis"].ToString();
                    isEpilepsy.Text = data["EpilepsyHis"].ToString();
                    isAsthma.Text = data["AsthmaHis"].ToString();
                    isLiver.Text = data["LiverHis"].ToString();
                    txtOthers.Text = data["Others"].ToString();
                }
            }
        }
    }

}