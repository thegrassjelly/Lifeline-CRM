<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="PaymentsHistory.aspx.cs" Inherits="Account_Membership_PreviousPayments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Membership Renewal</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Payments History</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="form-group pull-left">
                    <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                    <div class="col-lg-8 col-xs-12">
                        <asp:DropDownList ID="ddlSortBy" runat="server" class="form-control"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="PaymentStatus">Status</asp:ListItem>
                            <asp:ListItem>Amount</asp:ListItem>
                            <asp:ListItem>Length</asp:ListItem>
                            <asp:ListItem>Type</asp:ListItem>
                            <asp:ListItem Selected="True" Value="StartDate">Start Date</asp:ListItem>
                            <asp:ListItem Value="EndDate">End Date</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group pull-left">
                    <label class="control-label col-lg-4 col-xs-12">Direction</label>
                    <div class="col-lg-8 col-xs-12">
                        <asp:DropDownList ID="ddlDirection" runat="server" class="form-control"
                            OnSelectedIndexChanged="ddlDirection_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="ASC">Ascending</asp:ListItem>
                            <asp:ListItem Selected="True" Value="DESC">Descending</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-lg-12">
                    <hr />
                    <table class="table table-striped projects">
                        <thead>
                            <th>Payment Status</th>
                            <th>Amount</th>
                            <th>Length</th>
                            <th>Type</th>
                            <th>StartDate</th>
                            <th>EndDate</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvPaymentHistory" runat="server" OnPagePropertiesChanging="lv_PagePropertiesChanging">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-success btn-xs"><%# Eval("PaymentStatus") %></button>
                                        </td>
                                        <td>
                                            <%# Eval("Amount", "{0: ₱ #,###.00}") %>
                                        </td>
                                        <td>
                                            <%# Eval("Length") %>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-info btn-xs"><%# Eval("Type") %></button>
                                        </td>
                                        <td>
                                            <%# Eval("StartDate", "{0: MMMM dd, yyyy}") %>
                                        </td>
                                        <td>
                                            <%# Eval("EndDate", "{0: MMMM dd, yyyy}") %>
                                        </td>
                                        <td>
                                            <a href='PaymentsHistoryDetails.aspx?ID=<%# Eval("MembershipID") %>' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Details </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <tr>
                                        <td colspan="12">
                                            <h2 class="text-center">No records found</h2>
                                        </td>
                                    </tr>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <div class="x_panel">
            <div class="text-center">
                <asp:DataPager ID="lvDataPager" runat="server" PagedControlID="lvPaymentHistory" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                        <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </form>
</asp:Content>

