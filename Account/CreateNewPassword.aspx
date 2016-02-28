<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateNewPassword.aspx.cs" Inherits="Account_CreateNewPassword" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='shortcut icon' type='image/x-icon' href='../images/favicon.ico' />
    <title>Lifeline Rescue | Create New Password</title>

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
                    <h1>Create Password</h1>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div id="error" runat="server" class="alert alert-danger" visible="false" style="color: white">
                                Error, Please try again.
                            </div>
                            <div id="success" runat="server" class="alert alert-info" visible="false" style="color: white">
                                Password creation successful, you may now login.
                            </div>
                            <div>
                                <label id="ddl-label" class="control-label pull-left">Email Address</label>
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server" type="Email"
                                    TextMode="Email" MaxLength="80" disabled />

                            </div>
                            <div>
                                <label id="ddl-label" class="control-label pull-left">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password *" MaxLength="20" required />
                                <%--                        <ajaxtoolkit:passwordstrength id="ajaxPwd" runat="server"
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
                            requiresupperandlowercasecharacters="false" />--%>
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
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-default submit" Text="Creat New Password" OnClick="btnSubmit_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="login-sitemap">
                        <div class="separator">
                            <p class="change_link">
                                Already a member ?
                                <b><a href="../Account/Login.aspx" class="to_register">Log in </a></b>
                            </p>
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