<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activation.aspx.cs" Inherits="Account_Activation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1><asp:Literal ID="ltMessage" runat="server" /></h1>
        <h3><a href="<%= Page.ResolveUrl("~/Account/Login.aspx") %>">Login</a></h3>
    </div>
    </form>
</body>
</html>
