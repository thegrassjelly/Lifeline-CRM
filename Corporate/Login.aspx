<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Corporate_Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='shortcut icon' type='image/x-icon' href='../images/favicon.ico' />
    <title>Lifeline Rescue | Corporate Account Login</title>

    <!-- Bootstrap core CSS -->

    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <link href="../fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="../css/dashboard.css" rel="stylesheet">
    <link href="../css/icheck/flat/green.css" rel="stylesheet">


    <script src='<%= Page.ResolveUrl("../js/jquery.min.js") %>'></script>

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body style="background: #F7F7F7;">
    <div id="wrapper">
        <div id="login" class="animate form">
            <section class="login_content">
                <form runat="server" class="form-horizontal">
                    <h1>Corporate Account</h1>
                    <div id="error" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        Invalid username/password
                    </div>
                    <div id="db_error" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        The server is busy at the moment, try again later.
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Username</label>
                        <asp:TextBox ID="txtUserName" runat="server" class="form-control" MaxLength="80" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" required />
                    </div>
                    <div>
                        <asp:Button ID="btnLogin" runat="server" class="btn btn-default submit" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <div class="login-sitemap">
                        <div class="separator">
                            <h1>Lifeline Rescue</h1>

                            <p>
                                ©2016 All 
                                    Rights Reserved. Lifeline Ambulance Rescue, Inc.
                            </p>
                            <br />
                            <a href="<%= Page.ResolveUrl("../Default.aspx#HOME") %>">Home</a> | 
                                 <a href="<%= Page.ResolveUrl("../Default.aspx#SERVICE") %>">Services</a> |
                                 <a href="<%= Page.ResolveUrl("../Default.aspx#ABOUT") %>">About</a> |
                                 <a href="<%= Page.ResolveUrl("../Default.aspx#WORK") %>">Works</a> |
                                 <a href="<%= Page.ResolveUrl("../Default.aspx#CONTACT") %>">Contact</a>
                        </div>
                    </div>
                </form>
                <!-- form -->
            </section>
            <!-- content -->
        </div>
    </div>
</body>

</html>

