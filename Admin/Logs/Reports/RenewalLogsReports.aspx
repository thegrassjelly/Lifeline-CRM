<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="RenewalLogsReports.aspx.cs" Inherits="Admin_Logs_Reports_FeedbackLogReports" %>
<%@ Register TagPrefix="CR" Namespace="CrystalDecisions.Web" Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Reports</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <script src='<%= Page.ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js") %>'></script>
        <div class="x_panel">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="x_title">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="col-lg-5">
                                    <div class="form-group">
                                        <label class="control-label col-lg-4">Initial Date</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtDate1" class="form-control" runat="server" TextMode="Date" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="form-group">
                                        <label class="control-label col-lg-4">End Date</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtDate2" class="form-control" runat="server" TextMode="Date" required></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <div class="col-lg-10">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                        <br />
                    </div>
                    <div class="x_content">
                        <CR:CrystalReportViewer ID="crvRenewal" runat="server" AutoDataBind="True"
                            EnableDatabaseLogonPrompt="False"
                            ToolPanelView="None"
                            GroupTreeImagesFolderUrl=""
                            Height="100px"
                            ToolbarImagesFolderUrl=""
                            ToolPanelWidth="200px"
                            Width="350px" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</asp:Content>

