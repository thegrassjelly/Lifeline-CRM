using System;
using System.Data;
using System.Data.SqlClient;
using RegressionModels;

public partial class Admin_Forecast_SalesForecast : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        GetRenewalForecast();
        this.Form.DefaultButton = this.btnRefresh.UniqueID;
    }

    void GetRenewalForecast()
    {
        RegressionType selectedRegressionType = RegressionTypeButtonList.SelectedValue == "Linear" ? RegressionType.Linear : RegressionType.Logarithmic;
        CreateRegressionModel.Plot(RadHtmlChart1, FillData(), "xValues", "yValues", selectedRegressionType);
    }

    DataTable FillData()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP " + ddlPeriod.SelectedValue + " CAST(TempID AS DOUBLE PRECISION) " +
                "AS xValues, CAST(DataA AS DOUBLE PRECISION) AS yValues FROM TempTable";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "TempTable");
            DataTable dt = new DataTable();

            dt = ds.Tables[0];
            ltData.DataSource = dt;
            ltData.DataBind();
            return dt;
        }
    }

    protected void btnRefresh_OnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            string dataset = ddlDataSet.SelectedValue;
            switch (dataset)
            {
                case "Renewals":
                    {
                        cmd.CommandText = "TRUNCATE Table TempTable";
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "INSERT INTO TempTable (DataB, DataA) SELECT Distinct StartDate, " +
                            "COUNT(UserID) AS yValue FROM Memberships WHERE StartDate>@Span GROUP BY StartDate";
                        cmd.Parameters.AddWithValue("@Span", DateTime.Now.AddDays(-Convert.ToInt32(ddlSpan.SelectedValue)));
                        ltyValue.Text = "No. of Renewals";
                        cmd.ExecuteNonQuery();
                        GetRenewalForecast();
                        break;
                    }
                case "Payments":
                    {
                        cmd.CommandText = "TRUNCATE Table TempTable";
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "INSERT INTO TempTable (DataA) SELECT " +
                              "CAST(Amount AS DOUBLE PRECISION) AS yValues FROM Payments INNER JOIN Memberships ON " +
                              "Payments.MembershipID=Memberships.MembershipID WHERE StartDate>@Span";
                        cmd.Parameters.AddWithValue("@Span", DateTime.Now.AddDays(-Convert.ToInt32(ddlSpan.SelectedValue)));
                        ltyValue.Text = "Payment Amount";
                        cmd.ExecuteNonQuery();
                        GetRenewalForecast();
                        break;
                    }
            }
        }
    }
}