<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Admin_Users_View" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Users List</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <a href='<%= Page.ResolveUrl("~/Admin/Users/Reports/UserReports.aspx") %>' class="btn btn-primary btn-md pull-right"><i class="fa fa-print"></i> Print reports</a>
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
                            <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true" Theme="MetropolisBlue" ActiveTabIndex="4">
                                <TabPages>
                                    <dx:TabPage Text="Employer" Visible="True">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dxe:ASPxGridView ID="gvUserEmployer" runat="server"
                                                    OnBeforePerformDataSelect="gvUserEmployer_OnBeforePerformDataSelect"
                                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" EnableTheming="True" Theme="MetropolisBlue" KeyFieldName="UserID">
                                                    <Columns>
                                                        <dxe:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="NatureOfBusiness" VisibleIndex="2">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Address" VisibleIndex="3">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Municipality" VisibleIndex="4">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="City" VisibleIndex="5">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Phone" VisibleIndex="6">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Email" VisibleIndex="7">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Status" VisibleIndex="8">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="EmployerCode" VisibleIndex="0">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                                                            <EditFormSettings Visible="False" />
                                                        </dxe:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxe:ASPxGridView>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                                    SelectCommand="SELECT CorporateAccounts.Name, CorporateAccounts.NatureOfBusiness, CorporateAccounts.Address, CorporateAccounts.Municipality, 
                                CorporateAccounts.City, CorporateAccounts.Phone, CorporateAccounts.Email, CorporateAccounts.Status, 
                                CorporateAccounts.EmployerCode, Users.UserID FROM Users INNER JOIN CorporateAccounts ON Users.CorporateID = CorporateAccounts.CorporateID 
                                WHERE UserID=@UserID">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Medical History" Visible="true">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dxe:ASPxGridView ID="gvMedicalInfo" runat="server" EnableTheming="True" Theme="MetropolisBlue"
                                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource5"
                                                    OnBeforePerformDataSelect="gvMedicalInfo_OnBeforePerformDataSelect">
                                                    <SettingsPager PageSize="5">
                                                        <PageSizeItemSettings Visible="True">
                                                        </PageSizeItemSettings>
                                                    </SettingsPager>
                                                    <Columns>
                                                        <dxe:GridViewDataTextColumn FieldName="DispatchID" VisibleIndex="0">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataDateColumn FieldName="StartDate" VisibleIndex="1">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataDateColumn FieldName="EndDate" VisibleIndex="2">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Details" VisibleIndex="3">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Operation" VisibleIndex="4">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dx:GridViewDataColumn Width="50px" VisibleIndex="5">
                                                            <DataItemTemplate>
                                                                <a href='<%= Page.ResolveUrl("~/Admin/Medical/DispatchDetails.aspx?ID=") %><%# Eval("DispatchID") %>'
                                                                    target='_blank' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Details </a>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataColumn>
                                                    </Columns>
                                                </dxe:ASPxGridView>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                                    SelectCommand="SELECT [DispatchID], [StartDate], [EndDate], [Details], [Operation] FROM [MedicalHistory] WHERE ([UserID] = @UserID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Secondary Contacts" Visible="True">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dxe:ASPxGridView ID="gvSecondaryContacts" runat="server" EnableTheming="True" Theme="MetropolisBlue"
                                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                                                    OnBeforePerformDataSelect="gvSecondaryContacts_OnBeforePerformDataSelect">
                                                    <SettingsPager PageSize="5">
                                                        <PageSizeItemSettings Visible="True">
                                                        </PageSizeItemSettings>
                                                    </SettingsPager>
                                                    <Columns>
                                                        <dxe:GridViewDataDateColumn FieldName="FirstName" VisibleIndex="0">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataDateColumn FieldName="LastName" VisibleIndex="1">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="TelNo" VisibleIndex="2">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="MobileNo" VisibleIndex="3">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Relationship" VisibleIndex="4">
                                                        </dxe:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxe:ASPxGridView>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                                    SelectCommand="SELECT [SecondaryContactID], [FirstName], [LastName], [TelNo], [MobileNo], [Relationship] FROM [SecondaryContact] 
                                                    INNER JOIN ContactCategory ON [SecondaryContact].[RelationshipID]=[ContactCategory].[RelationshipID] WHERE ([UserID] = @UserID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="User Messages" Visible="True">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dxe:ASPxGridView ID="gvUserMessages" runat="server" AutoGenerateColumns="False"
                                                    DataSourceID="SqlDataSource2" EnableTheming="True" OnBeforePerformDataSelect="gvUserMessages_OnBeforePerformDataSelect" 
                                                    Theme="MetropolisBlue" Width="100%" KeyFieldName="MessageID">
                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                    <SettingsPager PageSize="5">
                                                        <PageSizeItemSettings Visible="True">
                                                        </PageSizeItemSettings>
                                                    </SettingsPager>
                                                    <Columns>
                                                        <dxe:GridViewDataTextColumn FieldName="MessageID" VisibleIndex="0" ReadOnly="True">
                                                            <EditFormSettings Visible="False" />
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Category" VisibleIndex="1">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="MessageCat" VisibleIndex="2">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Subject" VisibleIndex="3">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataDateColumn FieldName="DateSubmitted" VisibleIndex="4">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Message" VisibleIndex="5">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                                                        </dxe:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxe:ASPxGridView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                                    SelectCommand="SELECT [MessageID], [Category], [MessageCat], [Subject], 
                                                    [DateSubmitted], [Message], [Status] FROM [Messages] WHERE ([UserID] = @UserID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Membership Renewals" Visible="True">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dxe:ASPxGridView ID="gvUserRenewals" runat="server" EnableTheming="True" Theme="MetropolisBlue"
                                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                                                    OnBeforePerformDataSelect="gvUserRenewals_OnBeforePerformDataSelect" KeyFieldName="MembershipID">
                                                    <SettingsPager PageSize="5">
                                                        <PageSizeItemSettings Visible="True">
                                                        </PageSizeItemSettings>
                                                    </SettingsPager>
                                                    <Settings ShowFooter="True" />
                                                    <Columns>
                                                        <dxe:GridViewDataTextColumn FieldName="MembershipID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditFormSettings Visible="False" />
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataDateColumn FieldName="StartDate" VisibleIndex="1">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataDateColumn FieldName="EndDate" VisibleIndex="2">
                                                        </dxe:GridViewDataDateColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Length" VisibleIndex="3">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="MembershipStatus" VisibleIndex="4">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dxe:GridViewDataTextColumn FieldName="Type" VisibleIndex="5">
                                                        </dxe:GridViewDataTextColumn>
                                                        <dx:GridViewDataColumn Width="50px" VisibleIndex="5">
                                                            <DataItemTemplate>
                                                                <a href='<%= Page.ResolveUrl("~/Admin/Membership/RenewalDetails.aspx?ID=") %><%# Eval("MembershipID") %>'
                                                                    target='_blank' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Details </a>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataColumn>
                                                    </Columns>
                                                </dxe:ASPxGridView>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                    ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                                    SelectCommand="SELECT [MembershipID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type] 
                                                    FROM [Memberships] WHERE ([UserID] = @UserID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
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
                                 <a href='Update.aspx?ID=<%# Eval("UserID") %>'><i class="fa fa-2x fa-edit"></i></a>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dxe:GridViewDataComboBoxColumn FieldName="Priority" VisibleIndex="5" Width="130px">
                            <PropertiesComboBox>
                                <Items>
                                    <dxe:ListEditItem Text="Normal" Value="Normal" />
                                    <dxe:ListEditItem Text="Contact Immediately" Value="Contact Immediately" />
                                </Items>
                            </PropertiesComboBox>
                        </dxe:GridViewDataComboBoxColumn>
                    </Columns>
                </dx:ASPxGridView>
                <hr/>
            </div>
        </div>
    </div>
 </form>
</asp:Content>
