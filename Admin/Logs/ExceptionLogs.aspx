<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ExceptionLogs.aspx.cs" Inherits="Admin_Logs_Exception_Logs" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Logs</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Exception Logs</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <a href='<%= Page.ResolveUrl("~/Admin/Logs/Reports/ExceptionLogReports.aspx") %>' class="btn btn-primary btn-md pull-right">
                    <i class="fa fa-print"></i> Print reports</a>
                <dx:ASPxGridView ID="gvExceptionLogs" runat="server"
                    OnDataBinding="gvExceptionLogs_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                    Theme="Moderno" KeyFieldName="ExceptionID">
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                    <SettingsSearchPanel Visible="True" />
                    <SettingsPager PageSize="10">
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ExceptionID" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataColumn Width="200px" Caption="Error recipient" VisibleIndex="1">
                            <DataItemTemplate>
                                <%# Eval("LastName") %>, <%# Eval("FirstName") %>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataTextColumn FieldName="Page" VisibleIndex="2" Width="500px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Timestamp" VisibleIndex="3">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataColumn Width="50px" VisibleIndex="4">
                            <DataItemTemplate>
                                <a href='ExceptionDetails.aspx?ID=<%# Eval("ExceptionID") %>'><i class="fa fa-2x fa-folder"></i></a>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                </dx:ASPxGridView>
            </div>
        </div>
    </form>
</asp:Content>

