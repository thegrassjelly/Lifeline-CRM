﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Logs_ViewRenewalVoid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        if (!IsPostBack)
        {
            GetVoidRenewals();
            gvRenewalVoids.DataBind();
        }
    }

    DataSet GetVoidRenewals()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT LogsID, FirstName, LastName, LogType, Description, " +
                "Timestamp, Specifics FROM Logs INNER JOIN Users ON Logs.UserID=Users.UserID " +
                "WHERE LogType='Membership Renewal' AND Description='Void Membership' ORDER BY LogsID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Logs");
            return ds;
        }
    }

    protected void gvRenewalVoids_OnDataBinding(object sender, EventArgs e)
    {
        gvRenewalVoids.DataSource = GetVoidRenewals();
    }
}