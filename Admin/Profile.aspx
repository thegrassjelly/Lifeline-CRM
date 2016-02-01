<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Admin Profile</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Profile</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div id="profile" runat="server" class="alert alert-success text-center" visible="false">
                    Profile updated.
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
                                    <asp:HyperLink ID="imgUserLb" runat="server" data-lightbox="lbDB">
                                        <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                    </asp:HyperLink>
                                </div>
                            </div>
                            <div class="col-lg-8 col-lg-offset-4 col-sm-12 col-xs-12">
                                <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-12">Account Status</label>
                            <div class="col-lg-4 col-lg-offset-8 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtStatus" runat="server" class="form-control text-center" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-12">Account Type</label>
                            <div class="col-lg-4 col-lg-offset-8 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtType" runat="server" class="form-control text-center" disabled />
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
                            <div class="col-lg-6 col-sm-12 col-xs-12">
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
                            <div class="col-lg-8 col-sm-12 col-xs-12">
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

                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update"
                            OnClick="btnUpdate_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

