<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='shortcut icon' type='image/x-icon' href='../images/favicon.ico' />
    <title>Lifeline Rescue | Registration</title>

    <!-- Bootstrap core CSS -->

    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <link href="../fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="../css/dashboard.css" rel="stylesheet">
    <link href="../css/icheck/flat/green.css" rel="stylesheet">
    <link href="../css/jquery.qtip.min.css" rel="stylesheet" />

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>

<body style="background: #F7F7F7;">
    <div id="wrapper">
        <div id="register" class="animate form">
            <section class="login_content">
                <form runat="server" class="form-horizontal">
                    <h1>Create Account</h1>
                    <div id="error" runat="server" class="alert alert-danger" visible="false">
                        Username / Email address already existing.
                    </div>
                    <div id="success" runat="server" class="alert alert-info" visible="false">
                        An activation link sent to your email address
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">First Name</label>
                        <asp:RegularExpressionValidator ID="fnVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtFirstName"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid first name" />
                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server" type="text" MaxLength="20" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Last Name</label>
                        <asp:RegularExpressionValidator ID="lnVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtLastName"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid last name" />
                        <asp:TextBox ID="txtLastName" class="form-control" runat="server" type="text" MaxLength="20" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Email Address</label>
                        <asp:RegularExpressionValidator ID="emlVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ErrorMessage="Please enter valid e-mail address"
                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                            ControlToValidate="txtEmail" />
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" type="Email" TextMode="Email" MaxLength="80" required
                            title="Enter a valid email address for account activation." />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Date of Birth</label>
                        <asp:RegularExpressionValidator ID="dateValRegex" class="pull-right" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtBday"
                            ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)"
                            ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" />
                        <asp:TextBox ID="txtBday" class="form-control" runat="server" placeholder="mm/dd/yyyy" data-toggle="tooltip"
                            title="Date format: mm/dd/yyyy" MaxLength="10" />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password *" MaxLength="20" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Repeat Password</label>
                        <asp:TextBox ID="txtPassword2" runat="server" class="form-control" TextMode="Password" placeholder="Repeat Password *" MaxLength="20" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Register as *</label>
                        <asp:DropDownList ID="ddlUserType" class="form-control" runat="server" data-toggle="tooltip"
                            title="Pending Client registrations needs to be further verified,
                            to make use of other features and services of this site."
                            required>
                            <asp:ListItem>Guest</asp:ListItem>
                            <asp:ListItem>Pending Client</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div>
                        <!-- Pending: Required validation for reCaptcha -->
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ErrorMessage="Passwords do not match"></asp:CompareValidator>
                    </div>
                    <div class="g-recaptcha" data-sitekey="6Ld1ohYTAAAAANzwfapvbp5hC2PsDH6ALQN2Aj5c"></div>
                    <br />
                    <div>
                        <asp:Button ID="btnRegister" runat="server" class="btn btn-default submit" Text="Register" OnClick="btnRegister_Click" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="separator">

                        <p class="change_link">
                            Already a member ?
                                <a href="../Account/Login.aspx" class="to_register">Log in </a>
                        </p>
                        <div class="clearfix"></div>
                        <br />
                        <div class="login-sitemap">
                            <h1>Lifeline Rescue</h1>

                            <p>
                                ©2015 All 
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
    <script src='<%= Page.ResolveUrl("../js/jquery.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/bootstrap.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/dashboard.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/jquery.qtip.min.js") %>'></script>
</body>
</html>
