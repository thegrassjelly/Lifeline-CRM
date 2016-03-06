using System;
using System.Data.SqlClient;
using System.IO;

public partial class Corporate_DepositPaymentDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (Request.QueryString["ID"] != null)
        {
            int depositID = 0;
            bool validDepositID = int.TryParse(Request.QueryString["ID"].ToString(), out depositID);

            if (validDepositID)
            {
                if (!IsPostBack)
                {
                    GetDepositDetails(depositID);
                    if (Session["deposit"] != null)
                    {
                        deposit.Visible = true;
                        Session.Remove("deposit");
                    }
                    else
                    {
                        deposit.Visible = false;
                    }
                }
            }
            else
            {
                Response.Redirect("~/Corporate/Default.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Corporate/Default.aspx");
        }
    }

    private void GetDepositDetails(int depositID)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT DepositSlip, PaymentDate, Amount FROM DepositPayments " +
                              "WHERE DepositID=@DepositID";
            cmd.Parameters.AddWithValue("@DepositID", depositID);
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                if (da.HasRows)
                {
                    while (da.Read())
                    {
                        double bal = Convert.ToDouble(da["Amount"].ToString());
                        txtDepositAmount.Text = bal.ToString("₱ #,###.00");
                        DateTime paymentDate = Convert.ToDateTime(da["PaymentDate"]);
                        txtPaymentDate.Text = paymentDate.ToString("D");
                        imgDepositSlip.ImageUrl = "~/scans/" + da["DepositSlip"].ToString();
                        imgDepositSlipLb.NavigateUrl = "~/scans/" + da["DepositSlip"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/Corporate/Default.aspx");
                } 
            } 
        }
    }
}