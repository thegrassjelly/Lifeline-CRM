<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="SurveySummary.aspx.cs" Inherits="Admin_Feedback_SurveySummary" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Survey Summary</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <dx:ASPxGridView ID="gvSurveySummary" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Moderno"
                        onDataBinding="gvSurveySummary_OnDataBinding" Width="100%">
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <SettingsSearchPanel Visible="True" />
                        <SettingsPager PageSize="10">
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="SurveyID" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn Width="200px" Caption="Recipient" VisibleIndex="1">
                                <DataItemTemplate>
                                    <%# Eval("LastName") %>, <%# Eval("FirstName") %>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DateSubmitted" VisibleIndex="3">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="4">
                                <DataItemTemplate>
                                    <a href='SurveyDetails.aspx?ID=<%# Eval("SurveyID") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

