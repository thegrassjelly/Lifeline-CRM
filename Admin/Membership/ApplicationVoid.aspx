<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ApplicationVoid.aspx.cs" Inherits="Admin_Membership_ApplicationVoid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Membership Applications</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Void Membership Application</h2>
                <div class="clearfix"></div>
            </div>
            <div class="col-lg-6">
                <div class="x_content">
                    <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                        Invalid password.
                    </div>
                    <div id="db_error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                        Membership void unsuccessful. Try again
                    </div>
                    <div id="voidsuccess" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                        Membership void successful
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Reason</label>
                        <div class="col-lg-8 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtReason" runat="server" class="form-control" MaxLength="30" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Enter your password</label>
                        <div class="col-lg-8 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" MaxLength="30"
                                TextMode="Password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary pull-right" Text="Void Renewal"
                                OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure?')" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

