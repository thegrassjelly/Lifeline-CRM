<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Verification.aspx.cs" Inherits="Admin_Users_Verification" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<form class="form-horizontal" runat="server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Membership Verifications</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <div class="col-lg-12">
                <hr/>
                <dx:ASPxGridView ID="gvUsers" runat="server" 
                    OnDataBinding="grid_DataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True" 
                    Theme="Moderno" KeyFieldName="UserID">
                    <SettingsDetail ShowDetailRow="True" />
                    <SettingsContextMenu Enabled="True">
                    </SettingsContextMenu>
                    <Templates>
                        <DetailRow>
                        <h2>User Info</h2>
                            <dxe:ASPxGridView ID="gvDetails" runat="server"
                                OnBeforePerformDataSelect="gvUserDetails_OnBeforePerformDataSelect"
                                Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="MetropolisBlue">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dxe:GridViewDataDateColumn FieldName="Birthday" VisibleIndex="3">
                                    </dxe:GridViewDataDateColumn>
                                    <dxe:GridViewDataTextColumn FieldName="Street" VisibleIndex="4">
                                    </dxe:GridViewDataTextColumn>
                                    <dxe:GridViewDataTextColumn FieldName="Municipality" VisibleIndex="5">
                                    </dxe:GridViewDataTextColumn>
                                    <dxe:GridViewDataTextColumn FieldName="City" VisibleIndex="6">
                                    </dxe:GridViewDataTextColumn>
                                    <dxe:GridViewDataTextColumn FieldName="Phone" VisibleIndex="7">
                                    </dxe:GridViewDataTextColumn>
                                    <dxe:GridViewDataTextColumn FieldName="Mobile" VisibleIndex="8">
                                    </dxe:GridViewDataTextColumn>
                                    <dxe:GridViewDataTextColumn FieldName="Status" VisibleIndex="9">
                                    </dxe:GridViewDataTextColumn>
                                    <dxe:GridViewDataTextColumn FieldName="Priority" VisibleIndex="10">
                                    </dxe:GridViewDataTextColumn>
                                </Columns>
                            </dxe:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                SelectCommand="SELECT [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [Priority] FROM [Users] WHERE ([UserID] = @UserID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                        </DetailRow>
                    </Templates>
                    <SettingsPager PageSize="5">
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowStatusBar="Hidden" />
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="UserID" VisibleIndex="0" Width="10px">
                            <Settings AllowFilterBySearchPanel="False" ShowFilterRowMenu="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataColumn VisibleIndex="1">  
                            <DataItemTemplate>
                                <div class="thumbnail" id="usrPic-view">
                                    <img runat="server" src='<%# string.Concat("~/images/users/", Eval("UserPic")) %>'
                                        class="img-responsive" width="100" />
                                </div>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="UserType" VisibleIndex="4" Width="100px">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Guest" Value="Guest" />
                                    <dx:ListEditItem Text="Pending Client" Value="Pending Client" />
                                    <dx:ListEditItem Text="Client" Value="Client" />
                                    <dx:ListEditItem Text="Administrator" Value="Administrator" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn FieldName="UploadDate" VisibleIndex="6" Width="130px">
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
                                 <a href='VerificationDetails.aspx?ID=<%# Eval("ScanID") %>'><i class="fa fa-2x fa-folder"></i></a>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                </dx:ASPxGridView>
                <hr/>
            </div>
        </div>
    </div>
</form>
</asp:Content>
