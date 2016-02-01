<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="CorporateAccountReports.aspx.cs" Inherits="Admin_Users_Reports_CorporateAccountReports" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Reports</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <script src='<%= Page.ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js") %>'></script>
        <div class="x_panel">
            <div class="x_title">

                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <cr:crystalreportviewer id="crvCorporateAccounts" runat="server" autodatabind="True"
                    enabledatabaselogonprompt="False"
                    toolpanelview="None"
                    grouptreeimagesfolderurl=""
                    height="100px"
                    toolbarimagesfolderurl=""
                    toolpanelwidth="200px"
                    width="350px" enableparameterprompt="False" reuseparametervaluesonrefresh="True" />
            </div>
        </div>
    </form>
</asp:Content>

