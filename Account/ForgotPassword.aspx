<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Account_ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='shortcut icon' type='image/x-icon' href='../images/favicon.ico' />
    <title>Lifeline Rescue | Recover Password</title>

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
        <div id="register" class="animate form">
            <section class="login_content">
                <form class="form-horizontal" runat="server">
                    <asp:ScriptManager runat="server" EnablePageMethods="true" />
                    <h1>Recover Password</h1>
                    <div id="error" runat="server" class="alert alert-danger" visible="false" style="color: white" >
                        Email address does not exist.
                    </div>
                    <div id="success" runat="server" class="alert alert-info" visible="false" style="color: white" >
                        Check your email for your login credentials.
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Email Address</label>
                        <asp:RegularExpressionValidator ID="emlVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ForeColor="Red"
                            ErrorMessage="Please enter valid e-mail address"
                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                            ControlToValidate="txtEmail" />
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" type="Email" TextMode="Email" MaxLength="80" required />
                    <div>
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-default submit" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                    </div>
                    <div class="login-sitemap">
                        <div class="separator">
                            <p>Forgot you email address?<br />
                                Contact us to verify and recover your account.</p>
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
                    </div>
                </form>
            </section>
        </div>
    </div>
    <script src='<%= Page.ResolveUrl("../js/jquery.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/bootstrap.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/dashboard.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/jquery.qtip.min.js") %>'></script>
</body>
</html>