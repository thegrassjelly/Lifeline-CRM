<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="PaymentHistoryDep.aspx.cs" Inherits="Account_Membership_PaymentHistoryDep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Membership Renewal</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Update Dependent</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtRelationship" runat="server" class="form-control" disabled />
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtOtherRel" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtBday" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnReturn" runat="server" class="btn btn-primary pull-right" Text="Back"
                            OnClick="btnReturn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

