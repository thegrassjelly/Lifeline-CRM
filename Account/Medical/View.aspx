<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Medical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Medical Information</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>View my recent medical info </h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label class="control-label col-lg-6">Blood Type</label>
                            <div class="col-lg-2 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtBloodType" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">Allergies</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtAllergies" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">History of cancer in the family</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="isCancer" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">History of heart disease in the family</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="isHeart" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">History of asthma</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="isAsthma" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">History of epilepsy</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="isEpilepsy" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">History of liver disease</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:TextBox ID="isLiver" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-6">Others</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtOthers" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <table class="table table-striped projects">
                            <thead>
                                <th>Medical Event</th>
                                <th>Call Date</th>
                                <th>Discharge Date</th>
                                <th>Prognosis</th>
                                <th>Dispatch Info</th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvMedicalHistory" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <button type="button" class="btn btn-success btn-xs"><%# Eval("Operation") %></button>
                                            </td>
                                            <td><%# Eval("StartDate", "{0: MMMM dd, yyyy}") %></td>
                                            <td><%# Eval("EndDate", "{0: MMMM dd, yyyy}") %></td>
                                            <td><%# Eval("Details") %></td>
                                            <td>
                                                <a href='Dispatch.aspx?ID=<%# Eval("DispatchID") %>' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="10">
                                                <h2 class="text-center">No records found</h2>
                                            </td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

