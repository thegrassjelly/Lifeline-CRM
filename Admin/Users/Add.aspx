<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Users_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Add Users</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div id="user" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                    User Added
                </div>
                <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                    Email address already existing.
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-sm-12 col-xs-12">
                                <asp:Button class="btn btn-success" runat="server" Visible="false"></asp:Button>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-sm-12 col-xs-12">Profile picture</label>
                            <div class="col-lg-8">
                                <div class="thumbnail" id="usrPic">
                                    <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-8 col-lg-offset-4 col-sm-12 col-xs-12">
                                <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Phone No.</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="8" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Mobile No.</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="11" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Date of Birth</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                 <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                                 <telerik:RadDatePicker ID="txtBday" runat="server" class="form-control"></telerik:RadDatePicker>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4">Street</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtStreet" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Municipality</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">City</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtCity" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Email Address</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" MaxLength="80" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Password</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" MaxLength="30"
                                    TextMode="Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Status</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:DropDownList ID="ddlStatus" class="form-control" runat="server" data-toggle="tooltip">
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Pending</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">User Type</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:DropDownList ID="ddlUserType" class="form-control" runat="server" data-toggle="tooltip">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnInsert" runat="server" class="btn btn-primary pull-right" Text="Submit"
                            OnClick="btnInsert_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

