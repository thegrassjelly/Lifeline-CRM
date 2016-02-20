using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.Windows.Forms;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
        GetUserCount();
        GetMessageCount();
        GetVerificationCount();
        GetRenewalsCount();
        GetMembershipCount();
        GetLogsCount();
        GetDashboardMessage();
        GetPieChart();
        GetUserPieChart();
        GetBarChart();
        GetTotalDeposit();
        GetCorporatePayments();

    }

    private void GetCorporatePayments()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Sum(Amount) FROM DepositPayments " +
                "WHERE PaymentDate>@Span";
            cmd.Parameters.AddWithValue("@Span", DateTime.Now.AddHours(-720));
            try
            {
                double totalAmntOne = Convert.ToDouble(cmd.ExecuteScalar());
                ltCorporatePayments.Text = totalAmntOne.ToString("C");
            }
            catch
            {
                ltCorporatePayments.Text = "N.A.";
            }

            cmd.CommandText = "SELECT Sum(Balance) FROM CorporatePayments INNER JOIN " +
                              "CorporateAccounts ON CorporatePayments.CorporateID=" +
                              "CorporateAccounts.CorporateID WHERE DateAdded>@Span";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Span", DateTime.Now.AddHours(-720));
            try
            {
                double totalAmntTwo = Convert.ToDouble(cmd.ExecuteScalar());
                ltCorporateBalance.Text = totalAmntTwo.ToString("C");
                ltCorporate30DaysOne.Text = DateTime.Now.AddHours(-720).ToString("F");
                ltCorporate30DaysTwo.Text = DateTime.Now.AddHours(-720).ToString("F");
            }
            catch
            {
                ltCorporateBalance.Text = "N.A.";
                ltCorporate30DaysOne.Text = DateTime.Now.AddHours(-720).ToString("F");
                ltCorporate30DaysTwo.Text = DateTime.Now.AddHours(-720).ToString("F");
            }

        }
    }

    void GetTotalDeposit()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT Sum(Amount) FROM Payments INNER JOIN " +
                              "Memberships ON Payments.MembershipID=Memberships.MembershipID " +
                              "WHERE PaymentStatus='Paid' AND StartDate>@Span";
            cmd.Parameters.AddWithValue("@Span", DateTime.Now.AddHours(-24));
            ltDeposit24HrsTime.Text = DateTime.Now.AddHours(-24).ToString("F");
            try
            {
                double totalAmntOne = Convert.ToDouble(cmd.ExecuteScalar());
                ltDeposit24Hrs.Text = totalAmntOne.ToString("C");
            }
            catch
            {
                ltDeposit24Hrs.Text = "N.A.";
            }

            cmd.CommandText = "SELECT Sum(Amount) FROM Payments INNER JOIN " +
                  "Memberships ON Payments.MembershipID=Memberships.MembershipID " +
                  "WHERE PaymentStatus='Paid' AND StartDate>@Span";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Span", DateTime.Now.AddHours(-720));
            ltDeposit30DaysTime.Text = DateTime.Now.AddHours(-720).ToString("F");
            try
            {
                double totalAmntTwo = Convert.ToDouble(cmd.ExecuteScalar());
                ltDeposit30Days.Text = totalAmntTwo.ToString("C");
            }
            catch
            {
                ltDeposit30Days.Text = "N.A.";
            }

        }
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

    void GetDashboardMessage()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP 5 MessageID, Category, Subject, Message, DateSubmitted, " +
                              "FirstName, LastName FROM Messages INNER JOIN Users ON Messages.UserID=" +
                              "Users.UserID WHERE Messages.Status='Unread' ORDER BY MessageID DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Messages");
            lvMessages.DataSource = ds;
            lvMessages.DataBind(); 
        }
    }

    void GetLogsCount()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(LogsID) FROM Logs";
            int totalCount = (int)cmd.ExecuteScalar();
            ltLogs.Text = totalCount.ToString();

            DateTime yesterday = DateTime.Now.AddHours(-24);
            cmd.CommandText = "SELECT COUNT(LogsID) FROM Logs WHERE " +
                              "TimeStamp>@Yesterday";
            cmd.Parameters.AddWithValue("@Yesterday", yesterday);
            int newCount = (int)cmd.ExecuteScalar();
            ltLogsNew.Text = newCount.ToString(); 
        }
    }

    void GetMembershipCount()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(LogsID) FROM Logs WHERE " +
                              "LogType='Membership Application'";
            int totalCount = (int)cmd.ExecuteScalar();
            ltMembership.Text = totalCount.ToString();

            DateTime yesterday = DateTime.Now.AddHours(-24);
            cmd.CommandText = "SELECT COUNT(LogsID) FROM Logs WHERE " +
                              "LogType='Membership Application' AND TimeStamp>@Yesterday";
            cmd.Parameters.AddWithValue("@Yesterday", yesterday);
            int newCount = (int)cmd.ExecuteScalar();
            ltMembershipNew.Text = newCount.ToString(); 
        }
    }

    void GetRenewalsCount()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(MembershipID) FROM Memberships WHERE " +
                              "MembershipStatus='Inactive'";
            int totalCount = (int)cmd.ExecuteScalar();
            ltRenewals.Text = totalCount.ToString();

            DateTime yesterday = DateTime.Now.AddHours(-24);
            cmd.CommandText = "SELECT COUNT(MembershipID) FROM Memberships WHERE " +
                              "MembershipStatus='Inactive' AND StartDate>@Yesterday";
            cmd.Parameters.AddWithValue("@Yesterday", yesterday);
            int newCount = (int)cmd.ExecuteScalar();
            ltRenewalsNew.Text = newCount.ToString(); 
        }
    }

    void GetVerificationCount()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(Description) FROM Logs WHERE " +
                "Description='Client Verification'";
            int totalCount = (int)cmd.ExecuteScalar();
            ltVerification.Text = totalCount.ToString();

            DateTime yesterday = DateTime.Now.AddHours(-24);
            cmd.CommandText = "SELECT COUNT(Description) FROM Logs WHERE " +
                              "Description='Client Verification' AND TimeStamp>@Yesterday";
            cmd.Parameters.AddWithValue("@Yesterday", yesterday);
            int newCount = (int)cmd.ExecuteScalar();
            ltVerificationNew.Text = newCount.ToString(); 
        }
    }

    void GetMessageCount()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(MessageID) FROM Messages WHERE " +
                              "Status='Unread'";
            int totalCount = (int)cmd.ExecuteScalar();
            ltUnreadMsg.Text = totalCount.ToString();

            DateTime yesterday = DateTime.Now.AddHours(-24);
            cmd.CommandText = "SELECT COUNT(MessageID) FROM Messages WHERE " +
                              "Status='Unread' AND DateSubmitted>@Yesterday";
            cmd.Parameters.AddWithValue("@Yesterday", yesterday);
            int newCount = (int)cmd.ExecuteScalar();
            ltUnreadNew.Text = newCount.ToString(); 
        }
    }

    void GetUserCount()
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT COUNT(UserID) FROM Users";
            int totalCount = (int)cmd.ExecuteScalar();
            ltUserCount.Text = totalCount.ToString();

            DateTime yesterday = DateTime.Now.AddHours(-24);
            cmd.CommandText = "SELECT COUNT(UserID) FROM Users WHERE " +
                              "DateAdded>@Yesterday";
            cmd.Parameters.AddWithValue("@Yesterday", yesterday);
            int newCount = (int)cmd.ExecuteScalar();
            ltUserNew.Text = newCount.ToString(); 
        }
    }
}