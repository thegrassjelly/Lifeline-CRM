using System;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Users_DepositPaymentDetails : System.Web.UI.Page
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
                Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
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
                    Response.Redirect("~/Admin/Users/CorporateAccounts.aspx");
                } 
            } 
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            var depositID = Request.QueryString["ID"].ToString();

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE DepositPayments SET DepositSlip=@DepositSlip " +
                              "WHERE DepositID=@DepositID";
            cmd.Parameters.AddWithValue("@DepositID", depositID);
            string fileExt = Path.GetExtension(fileDepositSlip.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@DepositSlip", id + fileExt);
            fileDepositSlip.SaveAs(Server.MapPath("~/scans/" + id + fileExt));
            cmd.ExecuteNonQuery();

            Session["deposit"] = "yes";
            Response.Redirect(Request.RawUrl); 
        }
    }
}