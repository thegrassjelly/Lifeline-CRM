<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AddAmbulance.aspx.cs" Inherits="Admin_Operations_AddAmbulance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Operations</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Add Ambulance</h2>
            <div class="clearfix"></div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="control-label col-lg-4">Ambulance Name</label>
                    <div class="col-lg-5 col-sm-12 col-xs-12">
                        <asp:TextBox ID="txtAmbulance" runat="server" class="form-control" MaxLength="80" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Ambulance Status</label>
                    <div class="col-lg-4 col-sm-12 col-xs-12">
                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" required>
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-primary pull-right" Text="Submit"
                            OnClick="btnAdd_Click" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </form>
</asp:Content>

