<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Renewals.aspx.cs" Inherits="Admin_Membership_Renewals" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Account Renewals</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Renewals List</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <a href='<%= Page.ResolveUrl("~/Admin/Membership/Reports/RenewalsReport.aspx") %>' class="btn btn-primary btn-md pull-right">
                        <i class="fa fa-print"></i> Print reports
                    </a>
                    <dx:ASPxGridView ID="gvRenewals" runat="server"
                        OnDataBinding="gvRenewals_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                        Theme="Moderno" KeyFieldName="MembershipID">
                        <SettingsDetail ShowDetailRow="True" />
                        <SettingsContextMenu Enabled="True">
                        </SettingsContextMenu>
                        <Templates>
                            <DetailRow>
                                <h2>User Info</h2>
                                <dxe:ASPxGridView ID="gvUserDetails" runat="server"
                                    OnBeforePerformDataSelect="gvUserDetails_OnBeforePerformDataSelect"
                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="MetropolisBlue" KeyFieldName="MembershipID">
                                    <Columns>
                                        <dx:GridViewDataColumn VisibleIndex="0">
                                            <DataItemTemplate>
                                                <div class="thumbnail" id="usrPic-view">
                                                    <img runat="server" src='<%# string.Concat("~/images/users/", Eval("UserPic")) %>'
                                                        class="img-responsive" width="100" />
                                                </div>
                                            </DataItemTemplate>
                                        </dx:GridViewDataColumn>
                                        <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dxe:GridViewDataDateColumn FieldName="Birthday" VisibleIndex="4">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Street" VisibleIndex="5">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Municipality" VisibleIndex="6">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="City" VisibleIndex="7">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Phone" VisibleIndex="8">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Mobile" VisibleIndex="9">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxe:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                    SelectCommand="SELECT Users.FirstName, Users.LastName, Users.Email, Users.Birthday, 
                                    Users.Street, Users.Municipality, Users.City, Users.Phone, Users.Mobile, Users.Status,
                                     Users.UserPic, Memberships.MembershipID FROM Users INNER JOIN Memberships ON 
                                    Users.UserID = Memberships.UserID WHERE Memberships.MembershipID=@MembershipID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="MembershipID" SessionField="MembershipID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
                        <SettingsPager PageSize="10">
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowStatusBar="Hidden" />
                        <SettingsSearchPanel Visible="True" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="MembershipID" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>                           
                            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Type" Caption="Membership Type" VisibleIndex="3">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Individual" Value="Individual" />
                                        <dx:ListEditItem Text="Household" Value="Household" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="Length" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="StartDate" VisibleIndex="5">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="EndDate" VisibleIndex="6">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="MembershipStatus" Caption="Membership Status" VisibleIndex="7">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Inactive" Value="Inactive" />
                                        <dx:ListEditItem Text="Active" Value="Active" />
                                        <dx:ListEditItem Text="Voided" Value="Voided" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="PaymentStatus" Caption="Payment Status" VisibleIndex="8">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Unpaid" Value="Unpaid" />
                                        <dx:ListEditItem Text="Paid" Value="Paid" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="9">
                                <DataItemTemplate>
                                    <a href='RenewalDetails.aspx?ID=<%# Eval("MembershipID") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

