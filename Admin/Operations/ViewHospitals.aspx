<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ViewHospitals.aspx.cs" Inherits="Admin_Operations_ViewHospitals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Operations</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>View Hospitals</h2>
                <div class="clearfix"></div>
            </div>
            <div class="col-lg-12">
                <div class="form-group pull-left">
                    <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                    <div class="col-lg-8 col-xs-12">
                        <asp:DropDownList ID="ddlSortBy" runat="server" class="form-control"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" 
                            AutoPostBack="true">
                            <asp:ListItem Selected="True" Value="HospitalID">ID</asp:ListItem>
                            <asp:ListItem Value="HospitalName">Hospital</asp:ListItem>
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
                        <th>Hospital Name</th>
                        <th>Address</th>
                        <th>Municipality</th>
                        <th>City</th>
                        <th>Date Added</th>
                        <th>Date Modified</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvHospital" runat="server" 
                            OnPagePropertiesChanging="lvHospital_PagePropertiesChanging">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("HospitalID") %></td>
                                    <td><%# Eval("HospitalName") %></td>
                                    <td><%# Eval("Address") %></td>
                                    <td><%# Eval("Municipality") %></td>
                                    <td><%# Eval("City") %></td>
                                    <td><%# Eval("DateAdded", "{0:MM/dd/yyyy}") %></td>
                                    <td><%# Eval("DateModified", "{0:MM/dd/yyyy}") %></td>
                                    <td>
                                        <a href='UpdateHospital.aspx?ID=<%# Eval("HospitalID") %>'>
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
                        PagedControlID="lvHospital" PageSize="10">
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

