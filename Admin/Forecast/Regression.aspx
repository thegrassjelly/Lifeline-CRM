<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Regression.aspx.cs" Inherits="Admin_Forecast_SalesForecast" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Forecasting </h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-8">
        <div class="x_panel">
            <div class="x_title">
                <h2>Regression Analysis</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                    Insufficient Data in the database, Cannot generate forecast formula.
                </div>
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1" Width="650px">
                    <div class="form-group">
                        <asp:Label class="control-label col-lg-3 col-xs-12 pull" Text="Regression Type " runat="server" AssociatedControlID="RegressionTypeButtonList" />
                        <div class="col-lg-3 col-xs-12">
                            <asp:DropDownList ID="RegressionTypeButtonList"
                                class="form-control pull-left" runat="server" AutoPostBack="true">
                                <asp:ListItem Text="Linear" Selected="true" />
                                <asp:ListItem Text="Logarithmic" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr/>
                    <telerik:RadHtmlChart Skin="Bootstrap" runat="server" ID="RadHtmlChart1" Width="650px" Height="400px" EnableViewState="false">
                        <PlotArea>
                            <Series>
                                <telerik:ScatterSeries DataFieldY="yValues" DataFieldX="xValues" Name="Variance">
                                    <LabelsAppearance Visible="false">
                                    </LabelsAppearance>
                                </telerik:ScatterSeries>
                            </Series>
                            <XAxis>
                                <TitleAppearance Text="Period">
                                </TitleAppearance>
                                <MajorGridLines Color="#EFEFEF" Width="2"></MajorGridLines>
                                <MinorGridLines Color="#F7F7F7" Width="2"></MinorGridLines>
                            </XAxis>
                            <YAxis>
                                <TitleAppearance Text="Data">
                                </TitleAppearance>
                                <LabelsAppearance></LabelsAppearance>
                                <MajorGridLines Color="#EFEFEF" Width="2"></MajorGridLines>
                                <MinorGridLines Color="#F7F7F7" Width="2"></MinorGridLines>
                            </YAxis>
                        </PlotArea>
                        <ChartTitle Text="Regression Model"></ChartTitle>
                    </telerik:RadHtmlChart>
                </telerik:RadAjaxPanel>
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Bootstrap"></telerik:RadAjaxLoadingPanel>
                <hr />
            </div>
        </div>
        </div>
        <div class="col-lg-4">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Dataset Selection</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Period</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:DropDownList ID="ddlPeriod" class="form-control" runat="server" >
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem Selected="True">30</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Span</label>
                        <div class="col-lg-6 col-xs-12">
                            <asp:DropDownList ID="ddlSpan" class="form-control" runat="server" >
                                <asp:ListItem Selected="True" Value="30">30 Days</asp:ListItem>
                                <asp:ListItem Value="90">3 Months</asp:ListItem>
                                <asp:ListItem Value="180">6 Months</asp:ListItem>
                                <asp:ListItem Value="360">12 Months</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Dataset</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:DropDownList ID="ddlDataSet" class="form-control" runat="server">
                                <asp:ListItem Value="Payments">Payment Amounts</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Renewals">No. of Renewals</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnRefresh" runat="server" class="btn btn-primary" Text="Submit"
                            OnClick="btnRefresh_OnClick" />
                    </div>
                </div>
                    <hr/>
                    <table class="table table-striped projects">
                        <thead>
                            <th>Period</th>
                            <th><asp:Literal ID="ltyValue" runat="server"></asp:Literal></th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ltData" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("xValues") %>
                                        </td>
                                        <td>
                                            <%# Eval("yValues") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                    <hr/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

