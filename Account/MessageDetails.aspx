<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="MessageDetails.aspx.cs" Inherits="Account_MessageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>My Profile</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>View Message</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtFirstName" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtLastName" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Email</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Satisfaction Rating</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtSubject" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Message Category</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtCategory" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Date Submitted</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtDate" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtMessage" Width="100%" Height="200" TextMode="MultiLine" runat="server" 
                            style="max-height: 100%; max-width: 100%" disabled />
                    </div>
                </div>
                <hr />
            </form>
        </div>
    </div>
</asp:Content>

