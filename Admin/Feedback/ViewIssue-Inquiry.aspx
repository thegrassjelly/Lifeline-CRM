<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ViewIssue-Inquiry.aspx.cs" Inherits="Admin_Feedback_ViewIssue_Inquiry" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Issues/Inquiries list</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <a href='<%= Page.ResolveUrl("~/Admin/Feedback/Reports/IssueInquiryReport.aspx") %>' class="btn btn-primary btn-md pull-right">
                    <i class="fa fa-print"></i> Print reports
                </a>
                <dx:ASPxGridView ID="gvIssueInquiry" runat="server" Theme="Moderno" 
                    OnDataBinding="gvIssueInquiry_OnDataBinding" AutoGenerateColumns="False" Width="100%">
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                    <SettingsSearchPanel Visible="True" />
                    <SettingsPager PageSize="10">
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="MessageID" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataColumn Width="200px" Caption="Recipient" VisibleIndex="1">
                            <DataItemTemplate>
                                <%# Eval("LastName") %>, <%# Eval("FirstName") %>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="MessageCat" Caption="Message Category" VisibleIndex="3">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="User Interface problems" Value="User Interface problems" />
                                    <dx:ListEditItem Text="Website functionality problems" Value="Website functionality problems" />
                                    <dx:ListEditItem Text="Incorrect records" Value="Incorrect records" />
                                    <dx:ListEditItem Text="Error Pages" Value="Error Pages" />
                                    <dx:ListEditItem Text="Account/Membership Issues" Value="Account/Membership Issues" />
                                    <dx:ListEditItem Text="Client Account Request" Value="Client Account Request" />
                                    <dx:ListEditItem Text="Other" Value="Other" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="Subject" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="DateSubmitted" VisibleIndex="5">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="6">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Read" Value="Read" />
                                    <dx:ListEditItem Text="Unread" Value="Unread" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataColumn Width="50px" VisibleIndex="7">
                            <DataItemTemplate>
                                <a href='Issue-InquiryDetails.aspx?ID=<%# Eval("MessageID") %>'><i class="fa fa-2x fa-folder"></i></a>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                </dx:ASPxGridView>
            </div>
        </div>
    </form>
</asp:Content>

