<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='shortcut icon' type='image/x-icon' href='../images/favicon.ico' />
    <title>Lifeline Rescue | Login</title>

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
                    <h1>Login</h1>
                    <div id="error" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        Invalid email/password
                    </div>
                    <div id="accountinactive" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        Your account is inactive. Please contact your administrator.
                    </div>
                    <div id="active" runat="server" class="alert alert-success" visible="false" style="color: white">
                        Account activated
                    </div>
                    <div id="activatefail" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        Activation failed. Try again
                    </div>
                    <div id="db_error" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        The server is busy at the moment, try again later.
                    </div>
                    <div id="fb_error" runat="server" class="alert alert-danger" visible="false" style="color: white">
                        Facebook login failed. Try again
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Email Address</label>
                       <asp:RegularExpressionValidator ID="emlVld" class="pull-right" runat="server"
                            Display="Dynamic"
                            ErrorMessage="Please enter valid e-mail address"
                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                            ControlToValidate="txtEmail" />
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="80" data-validate-linked="email" required />
                    </div>
                    <div>
                        <label id="ddl-label" class="control-label pull-left">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" required />
                    </div>
                    <div>
                        <asp:Button ID="btnLogin" runat="server" class="btn btn-default submit" Text="Login" OnClick="btnLogin_Click" />
                        <b><a class="reset_pass" href="../Account/ForgotPassword.aspx">Lost your password?</a></b>
                    </div>
                    <div class="clearfix"></div>
                    <div class="separator">

                        <p class="change_link">
                        <p>Create an account to access client verification and membership application forms</p>
                                <b><a href="../Account/Register.aspx" class="to_register">Create Account </a></b>
                        </p>
                        <button id="btnFb" class="btn btn-facebook" runat="server" onserverclick="Login">
                            <i class="fa fa-facebook-square"></i> | Login via Facebook</button>
                        <asp:Panel ID="pnlFaceBookUser" runat="server" Visible="false">
                            <hr />
                            <table>
                                <tr>
                                    <td>ID:<asp:label ID="lblId" runat="server"></asp:label></td>
                                </tr>
                                <tr>
                                    <td>Name:<asp:label ID="lblName" runat="server"></asp:label></td>
                                </tr>
                                <tr>
                                    <td>Email:<asp:label ID="lblEmail" runat="server"></asp:label></td>
                                </tr>
                            </table>
                        </asp:Panel>
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
