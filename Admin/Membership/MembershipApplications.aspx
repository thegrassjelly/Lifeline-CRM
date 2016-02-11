<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="MembershipApplications.aspx.cs" Inherits="Admin_Membership_MembershipApplications" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Membership Application</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Membership Applications</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="col-lg-12">
                    <hr />
                    <dx:ASPxGridView ID="gvApplications" runat="server"
                        OnDataBinding="grid_DataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                        Theme="Moderno" KeyFieldName="ApplicationID">
                        <SettingsDetail ShowDetailRow="True" />
                        <SettingsContextMenu Enabled="True">
                        </SettingsContextMenu>
                        <Templates>
                            <DetailRow>
                                <h2>Application Info</h2>
                                <dxe:ASPxGridView ID="gvApplicationDetails" runat="server"
                                    OnBeforePerformDataSelect="gvApplicationDetails_OnBeforePerformDataSelect"
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
                                    </Columns>
                                </dxe:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                    SelectCommand="SELECT [FirstName], [LastName], [Email], [Birthday], [Street], 
                                [Municipality], [City], [Phone], [Mobile] FROM [Applications] 
                                WHERE ([ApplicationID] = @ApplicationID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
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
                            <dx:GridViewDataTextColumn FieldName="ApplicationID" VisibleIndex="0" Width="5px">
                                <Settings AllowFilterBySearchPanel="False" ShowFilterRowMenu="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="UserType" VisibleIndex="4" Width="150px">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Guest" Value="Guest" />
                                        <dx:ListEditItem Text="Pending Client" Value="Pending Client" />
                                        <dx:ListEditItem Text="Client" Value="Client" />
                                        <dx:ListEditItem Text="Administrator" Value="Administrator" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataDateColumn FieldName="DateSubmitted" VisibleIndex="6" Width="130px">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="8">
                                <DataItemTemplate>
                                    <a href='MembershipApplicationDetails.aspx?ID=<%# Eval("ApplicationID") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <hr />
                </div>
            </div>
        </div>
    </form>
</asp:Content>

