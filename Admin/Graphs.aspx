<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Graphs.aspx.cs" Inherits="Admin_Graphs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Dashboard Graphs</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-md-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Membership Renewals</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div>
                        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                        <asp:Literal ID="ltRenewalChart" runat="server"></asp:Literal>
                        <div id="chart_div" style="width: 1000px; height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Membership Composition</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div>
                        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                        <asp:Literal ID="ltRenewalComposition" runat="server"></asp:Literal>
                        <div id="piechart_renewal" style="width: 400px; height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>User Composition</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div>
                        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                        <asp:GridView ID="gvUserComposition" runat="server"></asp:GridView>
                        <asp:Literal ID="ltUserComposition" runat="server"></asp:Literal>
                        <div id="piechart_user" style="width: 400px; height: 300px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

