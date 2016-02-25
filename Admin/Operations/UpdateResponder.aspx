<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="UpdateResponder.aspx.cs" Inherits="Admin_Operations_UpdateResponder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Operations</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Update Responder</h2>
                <div class="clearfix"></div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="control-label col-lg-4">First Name</label>
                    <div class="col-lg-5 col-sm-12 col-xs-12">
                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" required />
                        <asp:RegularExpressionValidator ID="nmVld" runat="server"
                            ForeColor="red"
                            Display="Dynamic"
                            ControlToValidate="txtFirstName"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid first name" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Last Name</label>
                    <div class="col-lg-4 col-sm-12 col-xs-12">
                        <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" required />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ForeColor="red"
                            Display="Dynamic"
                            ControlToValidate="txtLastName"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid last name" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Status</label>
                    <div class="col-lg-3 col-sm-12 col-xs-12">
                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" required>
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Job Title</label>
                    <div class="col-lg-5 col-sm-12 col-xs-12">
                        <asp:DropDownList ID="ddlTitle" runat="server" class="form-control" required>
                            <asp:ListItem>Team Leader</asp:ListItem>
                            <asp:ListItem>Transport Officer</asp:ListItem>
                            <asp:ListItem>Treatment Officer</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update"
                            OnClick="btnUpdate_Click" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </form>
</asp:Content>

