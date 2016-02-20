<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ViewSecondaryContact.aspx.cs" Inherits="Admin_Users_ViewSecondaryContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>View secondary contact</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:textbox id="txtFirstName" runat="server" class="form-control" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:textbox id="txtLastName" runat="server" class="form-control" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Phone No.</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:textbox id="txtPhone" runat="server" class="form-control" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Mobile No.</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:textbox id="txtMobile" runat="server" class="form-control" disabled/>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Relationship</label>
                            <div class="col-lg-3 col-sm-12 col-xs-12">
                                <asp:textbox id="txtContactRel" runat="server" class="form-control" disabled>
                            </asp:textbox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">If others</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:textbox id="txtOthers" runat="server" class="form-control" maxlength="12" disabled />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

