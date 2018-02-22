<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="UserIndividualReports.aspx.cs" Inherits="Admin_Users_Reports_UserIndividualReports" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Reports</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form id="form1" runat="server">
        <script src='<%= Page.ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js") %>'></script>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="x_panel">
                    <div class="x_title">
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <CR:CrystalReportViewer ID="crvIndividualUsers" runat="server" AutoDataBind="True"
                            EnableDatabaseLogonPrompt="False"
                            ToolPanelView="None"
                            GroupTreeImagesFolderUrl=""
                            Height="100px"
                            ToolbarImagesFolderUrl=""
                            ToolPanelWidth="200px"
                            Width="350px" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

