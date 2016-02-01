<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="CorporateAccounts.aspx.cs" Inherits="Admin_Users_AddClientAccount" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Employer List</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <a href='<%= Page.ResolveUrl("~/Admin/Users/Reports/CorporateAccountReports.aspx") %>'
                    class="btn btn-primary btn-md pull-right"><i class="fa fa-print"></i>Print reports</a>
                <div class="col-lg-12">
                    <hr />
                    <dx:ASPxGridView ID="gvCorporateAccounts" runat="server"
                        OnDataBinding="gvCorporateAccounts_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                        Theme="Moderno" KeyFieldName="CorporateID">
                        <SettingsDetail ShowDetailRow="True" />
                        <SettingsContextMenu Enabled="True">
                        </SettingsContextMenu>
                        <Templates>
                            <DetailRow>
                                <dxe:ASPxGridView ID="gvCorporateAccountDetails" runat="server"
                                    OnBeforePerformDataSelect="gvCorporateAccountDetails_OnBeforePerformDataSelect"
                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="MetropolisBlue">
                                    <Columns>
                                        <dxe:GridViewDataTextColumn FieldName="EmployerCode" VisibleIndex="1">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="NatureOfBusiness" VisibleIndex="3">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Others" VisibleIndex="4">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Email" VisibleIndex="5">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Address" VisibleIndex="6">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Municipality" VisibleIndex="7">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="City" VisibleIndex="8">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Phone" VisibleIndex="9">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Fax" VisibleIndex="10">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Status" VisibleIndex="11">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataDateColumn FieldName="DateAdded" VisibleIndex="12">
                                        </dxe:GridViewDataDateColumn>
                                    </Columns>
                                </dxe:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                    SelectCommand="SELECT [CorporateID], [EmployerCode], [Name], [NatureOfBusiness], [Others], [Email], [Address], 
                                    [Municipality], [City], [Phone], [Fax], [Status], [DateAdded] FROM [CorporateAccounts] WHERE ([CorporateID] = @CorporateID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CorporateID" SessionField="CorporateID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true" Theme="MetropolisBlue" ActiveTabIndex="0">
                                    <TabPages>
                                        <dx:TabPage Text="Payment Details" Visible="True">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server">
                                                    <dx:ASPxGridView ID="gvPaymentDetails" runat="server" OnDataBinding="gvPaymentDetails_OnBeforePerformDataSelect"
                                                        Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" DataSourceID="SqlDataSource3">
                                                        <Columns>
                                                            <dxe:GridViewDataTextColumn FieldName="PaymentTerms" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dxe:GridViewDataTextColumn FieldName="Balance" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dxe:GridViewDataTextColumn FieldName="DiscountRate" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dxe:GridViewDataTextColumn FieldName="Length" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dxe:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>" SelectCommand="SELECT [PaymentTerms], [Balance], [DiscountRate], [Length] FROM [CorporatePayments] WHERE ([CorporateID] = @CorporateID)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="CorporateID" SessionField="CorporateID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Text="Employee List" Visible="true">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server">
                                                    <dx:ASPxGridView ID="gvCorporateEmployees" runat="server" OnBeforePerformDataSelect="gvCorporateEmployees_OnBeforePerformDataSelect"
                                                        Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" DataSourceID="SqlDataSource2" KeyFieldName="UserID">
                                                        <SettingsPager PageSize="5">
                                                            <PageSizeItemSettings Visible="True">
                                                            </PageSizeItemSettings>
                                                        </SettingsPager>
                                                        <Columns>
                                                            <dxe:GridViewDataTextColumn FieldName="FirstName" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dxe:GridViewDataTextColumn FieldName="LastName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dxe:GridViewDataDateColumn FieldName="DateAdded" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dxe:GridViewDataDateColumn>
                                                            <dxe:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dxe:GridViewDataTextColumn FieldName="Priority" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            </dxe:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Width="50px" VisibleIndex="5">
                                                                <DataItemTemplate>
                                                                    <a href='<%= Page.ResolveUrl("~/Admin/Users/Update.aspx?ID=") %><%# Eval("UserID") %>'><i class="fa fa-2x fa-edit"></i></a>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [DateAdded], [Status], [Priority], [UserID] FROM [Users] WHERE ([CorporateID] = @CorporateID)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="CorporateID" SessionField="CorporateID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                </dx:ASPxPageControl>
                            </DetailRow>
                        </Templates>
                        <SettingsPager PageSize="10">
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowStatusBar="Hidden" />
                        <SettingsSearchPanel Visible="True" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CorporateID" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EmployerCode" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Others" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DateAdded" VisibleIndex="6" Width="130px">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="8">
                                <DataItemTemplate>
                                    <a href='CorporateAccountDetails.aspx?ID=<%# Eval("CorporateID") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dxe:GridViewDataComboBoxColumn FieldName="NatureOfBusiness" VisibleIndex="3">
                                <PropertiesComboBox>
                                    <Items>
                                        <dxe:ListEditItem Text="Service" Value="Service" />
                                        <dxe:ListEditItem Text="Merchandising" Value="Merchandising" />
                                        <dxe:ListEditItem Text="Manufacturing" Value="Manufacturing" />
                                        <dxe:ListEditItem Text="Others" Value="Others" />
                                    </Items>
                                </PropertiesComboBox>
                            </dxe:GridViewDataComboBoxColumn>
                            <dxe:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="5" Width="100px">
                                <PropertiesComboBox>
                                    <Items>
                                        <dxe:ListEditItem Text="Active" Value="Active" />
                                        <dxe:ListEditItem Text="Pending" Value="Pending" />
                                    </Items>
                                </PropertiesComboBox>
                            </dxe:GridViewDataComboBoxColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <hr />
                </div>
            </div>
        </div>
    </form>
</asp:Content>

