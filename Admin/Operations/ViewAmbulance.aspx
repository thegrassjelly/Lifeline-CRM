<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ViewAmbulance.aspx.cs" Inherits="Admin_Operations_ViewAmbulance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Operations</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>View Ambulance</h2>
                <div class="clearfix"></div>
            </div>
            <div class="col-lg-12">
                <div class="form-group pull-left">
                    <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                    <div class="col-lg-8 col-xs-12">
                        <asp:DropDownList ID="ddlSortBy" runat="server" class="form-control"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" 
                            AutoPostBack="true">
                            <asp:ListItem Selected="True" Value="AmbulanceID">ID</asp:ListItem>
                            <asp:ListItem Value="AmbulanceName">Ambulance</asp:ListItem>
                            <asp:ListItem Value="AmbulanceStatus">Status</asp:ListItem>
                            <asp:ListItem Value="DateAdded">DateAdded</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group pull-left">
                    <label class="control-label col-lg-4 col-xs-12">Direction</label>
                    <div class="col-lg-8 col-xs-12">
                        <asp:DropDownList ID="ddlDirection" runat="server" class="form-control"
                            OnSelectedIndexChanged="ddlDirection_SelectedIndexChanged" 
                            AutoPostBack="true">
                            <asp:ListItem Value="ASC">Ascending</asp:ListItem>
                            <asp:ListItem Selected="True" Value="DESC">Descending</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <table class="table table-striped projects">
                    <thead>
                        <th>ID</th>
                        <th>Ambulance Name</th>
                        <th>Plate #</th>
                        <th>Status</th>
                        <th>Date Added</th>
                        <th>Date Modified</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvAmbulance" runat="server" 
                            OnPagePropertiesChanging="lv_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("AmbulanceID") %></td>
                                    <td><%# Eval("AmbulanceName") %></td>
                                    <td><%# Eval("PlateNo") %></td>
                                    <td>
                                        <button runat="server" type="button"
                                            class='<%# Eval("AmbulanceStatus").ToString() == 
                                                "Active" ? "btn btn-success btn-xs" : "btn btn-danger btn-xs" %>'>
                                            <%# Eval("AmbulanceStatus") %>
                                        </button>
                                    </td>
                                    <td><%# Eval("DateAdded", "{0:MM/dd/yyyy}") %></td>
                                    <td><%# Eval("DateModified", "{0:MM/dd/yyyy}") %></td>
                                    <td>
                                        <a href='UpdateAmbulance.aspx?ID=<%# Eval("AmbulanceID") %>' >
                                            <button type="button" class="btn btn-primary btn-xs">
                                                <i class="fa fa-folder"></i>
                                            </button>           
                                        </a>
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
                <hr />
                <div class="text-center">
                    <asp:DataPager ID="lvDataPager" runat="server" 
                        PagedControlID="lvAmbulance" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                            <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                            <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <hr />
            </div>
        </div>
    </form>
</asp:Content>

