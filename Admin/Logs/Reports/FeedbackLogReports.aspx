<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="FeedbackLogReports.aspx.cs" Inherits="Admin_Logs_Reports_FeedbackLogReports" %>
<%@ Register TagPrefix="CR" Namespace="CrystalDecisions.Web" Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" %>

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
                <CR:CrystalReportViewer ID="crvFeedbackLogs" runat="server" AutoDataBind="True"
                    EnableDatabaseLogonPrompt="False"
                    ToolPanelView="None"
                    GroupTreeImagesFolderUrl=""
                    Height="100px"
                    ToolbarImagesFolderUrl=""
                    ToolPanelWidth="200px"
                    Width="350px" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" />
            </div>
        </div>
    </form>
</asp:Content>

