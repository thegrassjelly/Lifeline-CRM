<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Account_SecondaryContacts_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Secondary Contact Information</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Person(s) to contact in case of emergency</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <div class="row">
                <asp:ListView ID="lvSecondary" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-4 col-xs-12 animated fadeInDown">
                            <div class="well profile_view">
                                <div class="col-sm-12">
                                    <div class="left col-xs-7">
                                        <h2>
                                            <i class="fa fa-group"></i> <%# Eval("FirstName") %> <%# Eval("LastName") %>
                                        </h2>
                                        <hr />
                                        <p><strong>Relationship </strong><%# Eval("Relationship") %></p>
                                        <ul class="list-unstyled">
                                            <li><i class="fa fa-phone"></i> <%# Eval("TelNo") %> </li>
                                            <li><i class="fa fa-mobile"></i> <%# Eval("MobileNo") %> </li>
                                        </ul>
                                    </div>
                                </div>
                                <a href='Update.aspx?ID=<%# Eval("SecondaryContactID") %>'>
                                    <button type="button" class="btn btn-primary pull-right">
                                        <i class="fa fa-user"></i> Update Contact
                                    </button>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <tr>
                            <td colspan="12">
                                <h2 class="text-center">No records found</h2>
                            </td>
                        </tr>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>

