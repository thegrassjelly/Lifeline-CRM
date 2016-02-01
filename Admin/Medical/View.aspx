<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Admin_Medical_View" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Add Medical History</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <dx:ASPxGridView ID="gvUsers" runat="server"
                    OnDataBinding="gvUsers_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                    Theme="Moderno" KeyFieldName="UserID">
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                    <SettingsSearchPanel Visible="True" />
                    <SettingsPager PageSize="5">
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <Columns>
                        <dxe:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                        </dxe:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="UserID" VisibleIndex="1" Width="10px">
                            <Settings AllowFilterBySearchPanel="False" ShowFilterRowMenu="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataColumn VisibleIndex="2" Width="100px">
                            <DataItemTemplate>
                                <div class="thumbnail" id="usrPic-view">
                                    <img runat="server" src='<%# string.Concat("~/images/users/", Eval("UserPic")) %>'
                                        class="img-responsive" width="100" />
                                </div>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="UserType" VisibleIndex="5" Width="100px">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Guest" Value="Guest" />
                                    <dx:ListEditItem Text="Pending Client" Value="Pending Client" />
                                    <dx:ListEditItem Text="Client" Value="Client" />
                                    <dx:ListEditItem Text="Administrator" Value="Administrator" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn FieldName="DateAdded" VisibleIndex="6" Width="130px">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="7" Width="100px">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Active" Value="Active" />
                                    <dx:ListEditItem Text="Pending" Value="Pending" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataColumn Width="50px" VisibleIndex="8">
                            <DataItemTemplate>
                                 <a href='AddMedical.aspx?ID=<%# Eval("UserID") %>'><i class="fa fa-2x fa-plus"></i></a>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                </dx:ASPxGridView>
            </div>
        </div>
    </form>
</asp:Content>

