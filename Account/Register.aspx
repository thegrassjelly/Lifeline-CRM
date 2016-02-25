<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">
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
                    <asp:ScriptManager runat="server" EnablePageMethods="true" />
                    <h1>Create Account</h1>
                    <div id="error" runat="server" class="alert alert-danger" visible="false" style="color: white" >
                        Username / Email address already existing.
                    </div>
                    <div id="success" runat="server" class="alert alert-info" visible="false" style="color: white" >
                        An activation link sent to your email address
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">First Name</label>
                        <asp:RegularExpressionValidator ID="fnVld" class="pull-right" runat="server"
                            Display="Dynamic"
                           ForeColor="Red"
                            ControlToValidate="txtFirstName"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid first name" />
                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server" type="text" MaxLength="20" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Last Name</label>
                        <asp:RegularExpressionValidator ID="lnVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ForeColor="Red"
                            ControlToValidate="txtLastName"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid last name" />
                        <asp:TextBox ID="txtLastName" class="form-control" runat="server" type="text" MaxLength="20" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Email Address</label>
                        <asp:RegularExpressionValidator ID="emlVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ForeColor="Red"
                            ErrorMessage="Please enter valid e-mail address"
                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                            ControlToValidate="txtEmail" />
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" type="Email" TextMode="Email" MaxLength="80" required
                            title="Enter a valid email address for account activation." />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Date of Birth</label>
                        <asp:RangeValidator ID="bdayVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ForeColor="Red"
                            ControlToValidate="txtBday"
                            ErrorMessage="Choose a valid date"
                            MaximumValue="2017-01-01"
                            MinimumValue="1900-01-01" />
                        <asp:TextBox ID="txtBday" class="form-control" runat="server" TextMode="Date" data-toggle="tooltip" MaxLength="10" />
                        <br />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password *" MaxLength="20" required />
                        <ajaxtoolkit:passwordstrength id="ajaxPwd" runat="server"
                            targetcontrolid="txtPassword"
                            displayposition="BelowRight"
                            strengthindicatortype="Text"
                            preferredpasswordlength="10"
                            prefixtext="Strength: "
                            helpstatuslabelid="TextBox1_HelpLabel"
                            textstrengthdescriptions="Very Poor;Weak;Average;Strong;Excellent"
                            strengthstyles="TextIndicator_TextBox1_Strength1;TextIndicator_TextBox1_Strength2;TextIndicator_TextBox1_Strength3;TextIndicator_TextBox1_Strength4;TextIndicator_TextBox1_Strength5"
                            minimumnumericcharacters="0"
                            minimumsymbolcharacters="0"
                            requiresupperandlowercasecharacters="false" />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Repeat Password</label>
                        <asp:CompareValidator ID="cmprPwd" runat="server" class="pull-right"
                            Display="Dynamic"
                            ForeColor="Red"
                            ControlToCompare="txtPassword" 
                            ControlToValidate="txtPassword2" 
                            ErrorMessage="Passwords do not match" />
                        <asp:TextBox ID="txtPassword2" runat="server" class="form-control" TextMode="Password" placeholder="Repeat Password *" MaxLength="20" required />
                    </div>
                    <div>
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
                    <%--<div class="g-recaptcha" data-sitekey="6Ld1ohYTAAAAANzwfapvbp5hC2PsDH6ALQN2Aj5c"></div>--%>
                    <br />
                    <div>
                        <asp:Button ID="btnRegister" runat="server" class="btn btn-default submit" Text="Register" OnClick="btnRegister_Click" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="separator">

                        <p class="change_link">
                            Already a member ?
                                <b><a href="../Account/Login.aspx" class="to_register">Log in </a></b>
                        </p>
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
    <script src='<%= Page.ResolveUrl("../js/jquery.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/bootstrap.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/dashboard.js") %>'></script>
    <script src='<%= Page.ResolveUrl("../js/jquery.qtip.min.js") %>'></script>
</body>
</html>
