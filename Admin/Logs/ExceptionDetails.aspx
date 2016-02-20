<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ExceptionDetails.aspx.cs" Inherits="Admin_Logs_ExceptionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Logs</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Exception Details</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <div class="col-lg-5">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-xs-12">
                            <asp:TextBox ID="txtFirstName" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-6 col-xs-12">
                            <asp:TextBox ID="txtLastName" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Location</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:TextBox ID="txtPage" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date Submitted</label>
                        <div class="col-lg-6 col-xs-12">
                            <asp:TextBox ID="txtDate" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <hr/>
                    <div class="form-group">
                        <asp:TextBox ID="txtDescription" Width="100%" Height="100" TextMode="Multiline" runat="server" 
                            style="max-width: 100%" disabled />
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </form>
</asp:Content>

