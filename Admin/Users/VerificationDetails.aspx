<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="VerificationDetails.aspx.cs" Inherits="Admin_Users_VerificationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Client Verification Details</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-sm-12 col-xs-12">Profile picture</label>
                        <div class="col-lg-8">
                            <div class="thumbnail" id="usrPic">
                                <asp:HyperLink ID="imgUserLb" runat="server" data-lightbox="lbDB">
                                    <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <label class="control-label col-lg-4">First Name</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Phone No.</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtPhone" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Mobile No.</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtMobile" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtBday" class="form-control" runat="server" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Street</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Municipality</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">City</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCity" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Email Address</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" disabled/>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <label class="control-label col-lg-4">Status</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtUserStatus" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">User Type</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList id="ddlUserType" class="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Priority</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtUserPriority" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>ID Scan</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="thumbnail col-lg-12" id="divDepositSlip">
                            <asp:HyperLink ID="imgIDScanLB" runat="server" data-lightbox="lbDB">
                                <asp:Image ID="imgIDScan" class="img-responsive pull-left" runat="server" />
                            </asp:HyperLink>
                        </div>
                        <hr />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-l2">
            <div class="x_panel">
                <div class="x_title"></div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary pull-right" Text="Submit"
                                OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure?')"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

