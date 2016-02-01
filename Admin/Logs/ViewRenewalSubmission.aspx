<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ViewRenewalSubmission.aspx.cs" Inherits="Admin_Logs_ViewRenewal" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Renewal Logs</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <a href='<%= Page.ResolveUrl("~/Admin/Logs/Reports/RenewalLogsReports.aspx") %>' class="btn btn-primary btn-md pull-right">
                        <i class="fa fa-print"></i> Print reports</a>
                    <dx:ASPxGridView ID="gvRenewalLogs" runat="server"
                        OnDataBinding="gvRenewalLogs_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                        Theme="Moderno" KeyFieldName="LogsID">
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <SettingsSearchPanel Visible="True" />
                        <SettingsPager PageSize="10">
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="LogsID" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn Width="200px" Caption="User" VisibleIndex="1">
                                <DataItemTemplate>
                                    <%# Eval("LastName") %>, <%# Eval("FirstName") %>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataTextColumn FieldName="LogType" VisibleIndex="2" Width="200px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3" Width="300px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Timestamp" VisibleIndex="4">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="8">
                                <DataItemTemplate>
                                    <a href='<%= Page.ResolveUrl("~/Admin/Membership/RenewalDetails.aspx?ID=") %><%# Eval("Specifics") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

