<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ViewOpportunityList.aspx.cs" Inherits="Admin_OpportunityTracking_ViewOpportunityList" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Opportunity Tracking</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Opportunity List</h2>
                <div class="clear"></div>
            </div>
            <div class="x_content">
                <dx:ASPxGridView ID="gvOpportunityList" runat="server" runat="server" OnDataBinding="gvOpportunityList_OnDataBinding"
                    Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                    Theme="Moderno" KeyFieldName="OpportunityID">
                    <SettingsDetail ShowDetailRow="True" />
                    <SettingsContextMenu Enabled="True">
                    </SettingsContextMenu>
                    <SettingsPager PageSize="5">
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                    <SettingsSearchPanel Visible="True" />
                    <Templates>
                        <DetailRow>
                            <h2>Oppportunity Info</h2>
                            <dxe:ASPxGridView ID="gvOpportunityDetails" runat="server" OnBeforePerformDataSelect="gvOpportunityDetails_OnBeforePerformDataSelect"
                                Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Rating" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Details" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Source" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="DateAdded" VisibleIndex="3">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataDateColumn FieldName="CloseDate" VisibleIndex="4">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Probability" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Stage" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PhoneNo" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Priority" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dxe:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>" 
                                SelectCommand="SELECT [Rating], [Details], [Source], [DateAdded], [CloseDate], [Amount], [Probability], 
                                [Stage], [Type], [PhoneNo], [Email], [Priority] FROM [OpportunityTracking] WHERE ([OpportunityID] = @OpportunityID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="OpportunityID" SessionField="OpportunityID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br/>
                            <h2>Activity Log</h2>
                            <dxe:ASPxGridView ID="gvOpportunityActivity" runat="server" OnBeforePerformDataSelect="gvOpportunityActivity_OnBeforePerformDataSelect"
                                Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" DataSourceID="SqlDataSource2" KeyFieldName="OpportunityActivityID">
                                <SettingsPager PageSize="5">
                                    <PageSizeItemSettings Visible="True">
                                    </PageSizeItemSettings>
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Subject" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Label" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="StartDate" VisibleIndex="6">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataDateColumn FieldName="EndDate" VisibleIndex="7">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn FieldName="AllDay" VisibleIndex="9">
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                            </dxe:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>" 
                                SelectCommand="SELECT [Type], [StartDate], [EndDate], [Subject], [Location], [Description], [Status], [Label], 
                                [AllDay], [OpportunityActivityID], [OpportunityID] FROM [OpportunityActivity] WHERE ([OpportunityID] = @OpportunityID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="OpportunityID" SessionField="OpportunityID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </DetailRow>
                    </Templates>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ClientName" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AccountName" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Rating" VisibleIndex="2">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Cold" Value="Cold" />
                                    <dx:ListEditItem Text="Warm" Value="Warm" />
                                    <dx:ListEditItem Text="Hot" Value="Hot" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn FieldName="DateAdded" VisibleIndex="5">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="CloseDate" VisibleIndex="6">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="7">
                            <PropertiesTextEdit DisplayFormatString="c">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Probability" VisibleIndex="8" Caption="Probability (%)">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Stage" VisibleIndex="4">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Lead" Value="Lead" />
                                    <dx:ListEditItem Text="Prospecting" Value="Prospecting" />
                                    <dx:ListEditItem Text="Needs Analysis" Value="Needs Analysis" />
                                    <dx:ListEditItem Text="Value Proposition" Value="Value Proposition" />
                                    <dx:ListEditItem Text="Proposal/Price Quote" Value="Proposal/Price Quote" />
                                    <dx:ListEditItem Text="Paperwork" Value="Paperwork" />
                                    <dx:ListEditItem Text="Closed" Value="Closed" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataColumn Width="50px" VisibleIndex="8">
                            <DataItemTemplate>
                                <a href='OpportunityDetails.aspx?ID=<%# Eval("OpportunityID") %>'><i class="fa fa-2x fa-edit"></i></a>
                                <a href='<%= Page.ResolveUrl("~/Admin/OpportunityTracking/OpportunityScheduler.aspx?ID=") %><%# Eval("OpportunityID") %>'><i class="fa fa-2x fa-calendar"></i></a>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                </dx:ASPxGridView>
            </div>
        </div>
    </form>
</asp:Content>

