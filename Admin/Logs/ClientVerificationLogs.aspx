<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ClientVerificationLogs.aspx.cs" Inherits="Admin_Logs_ClientVerificationLogs" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Logs</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Client Verification Logs</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <dx:ASPxGridView ID="gvClientVerificationLogs" runat="server"
                        OnDataBinding="gvClientVerificationLogs_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
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
                            <dx:GridViewDataTextColumn FieldName="UserType" VisibleIndex="2" width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LogType" VisibleIndex="3" width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="4" width="300px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Timestamp" VisibleIndex="5">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="6">
                                <DataItemTemplate>
                                    <a href='<%= Page.ResolveUrl("~/Admin/Logs/ClientVerificationDetails.aspx?ID=") %><%# Eval("Specifics") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

