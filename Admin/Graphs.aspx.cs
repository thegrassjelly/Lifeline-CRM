using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Graphs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        GetPieChart();
        GetUserPieChart();
        GetBarChart();
    }

    private void GetUserPieChart()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Types.UserType, COUNT(Types.UserType) AS Composition " +
                              "FROM dbo.Users INNER JOIN Types ON Users.TypeID=Types.TypeID " +
                              "GROUP BY Types.UserType";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable dsChartData = new DataTable();
            StringBuilder strScript = new StringBuilder();

            dsChartData = ds.Tables[0];

            strScript.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1', {packages: ['corechart']}); </script>  
                    <script type='text/javascript'>  
                    function drawChart() {         
                    var data = google.visualization.arrayToDataTable([  
                    ['User Type', 'Percent'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["UserType"] + "'," + row["Composition"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append(@" var options = {     
                                    title: '',            
                                    is3D: true,          
                                    };   ");

            strScript.Append(@"var chart = new google.visualization.PieChart(document.getElementById('piechart_user'));          
                                chart.draw(data, options);        
                                }    
                            google.setOnLoadCallback(drawChart);  
                            ");
            strScript.Append(" </script>");

            ltUserComposition.Text = strScript.ToString();

            dsChartData.Dispose();
            strScript.Clear();
        }
    }

    void GetPieChart()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Distinct Type, COUNT(Type) AS Composition " +
                              "FROM Memberships GROUP BY Type";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable dsChartData = new DataTable();
            StringBuilder strScript = new StringBuilder();

            dsChartData = ds.Tables[0];

            strScript.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1', {packages: ['corechart']}); </script>  
                    <script type='text/javascript'>  
                    function drawChart() {         
                    var data = google.visualization.arrayToDataTable([  
                    ['Membership Type', 'Percent'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["Type"] + "'," + row["Composition"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append(@" var options = {     
                                    title: '',            
                                    is3D: true,          
                                    };   ");

            strScript.Append(@"var chart = new google.visualization.PieChart(document.getElementById('piechart_renewal'));          
                                chart.draw(data, options);        
                                }    
                            google.setOnLoadCallback(drawChart);  
                            ");
            strScript.Append(" </script>");

            ltRenewalComposition.Text = strScript.ToString();

            dsChartData.Dispose();
            strScript.Clear();
        }
    }

    void GetBarChart()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP 7 StartDate, COUNT(Memberships.MembershipID) AS MembershipCount, " +
                              "COUNT(CASE WHEN PaymentStatus = 'Paid' THEN 1 END) AS Paid, " +
                              "COUNT(CASE WHEN PaymentStatus = 'Unpaid' THEN 1 END) AS Unpaid " +
                              "FROM Memberships INNER JOIN Payments ON Memberships.MembershipID = Payments.MembershipID " +
                              "GROUP BY StartDate ORDER BY StartDate DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DataTable dsChartData = new DataTable();
            StringBuilder strScript = new StringBuilder();

            dsChartData = ds.Tables[0];

            strScript.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1', {packages: ['corechart']});</script>  
                    <script type='text/javascript'>  
                    function drawVisualization() {         
                    var data = google.visualization.arrayToDataTable([  
                    ['StartDate', 'Renewals', 'Paid', 'Unpaid'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["StartDate"] + "'," + row["MembershipCount"] + "," + row["Paid"] + "," + row["Unpaid"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append("var options = { " +
                             "title : '', " +
                             "vAxis: {title: 'Number of Renewals'},  " +
                             "hAxis: {title: 'Date'}, " +
                             "seriesType: 'bars', " +
                             "series: {3: {type: 'area'}} };");
            strScript.Append(" var chart = " +
                             "new google.visualization.ComboChart(document.getElementById('chart_div'));  " +
                             "chart.draw(data, options); } " +
                             "google.setOnLoadCallback(drawVisualization);");
            strScript.Append(" </script>");

            ltRenewalChart.Text = strScript.ToString();
            dsChartData.Dispose();
            strScript.Clear();
        }
    }
}