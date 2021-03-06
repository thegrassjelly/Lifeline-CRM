﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="MembershipApplicationDetails.aspx.cs" Inherits="Admin_Membership_MembershipApplicationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="row">
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Application Details</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-1 col-xs-12">Start Date</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtStartDate" class="form-control" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Membership Length</label>
                        <div class="col-lg-1 col-xs-12">
                            <asp:TextBox ID="txtMembershipLength" class="form-control text-center" runat="server" disabled />
                        </div>
                        <label class="col-lg-1 col-xs-12">Year(s)</label>
                        <label class="control-label col-lg-2 col-xs-12">Membership Type</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtMembershipType2" class="form-control text-center" runat="server" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-1 col-xs-12">End Date</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtEndDate" class="form-control" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Payment</label>
                        <div class="col-lg-2 text-center">
                            <asp:TextBox ID="txtPaymentStatus" class="form-control text-center" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Membership Status</label>
                        <div class="col-lg-2 text-center">
                            <asp:TextBox ID="txtMembershipStatus" class="form-control text-center" runat="server" disabled />
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="col-lg-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Billing Information</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">First Name</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtFN" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtLN" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Street</label>
                            <div class="col-lg-7 col-xs-12">
                                <asp:TextBox ID="txtStreet" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Municipality</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">City</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtCity" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Phone No.</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Mobile No.</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Email Address</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                    <hr />
                    <div class="form-group">
                        <label class="control-label col-lg-4">Status</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtUserStatus" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">User Type</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtUserType" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <hr />
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Dependents Summary</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table class="table table-striped projects">
                            <thead>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvGetDependents" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("FirstName") %></td>
                                            <td><%# Eval("LastName") %></td>
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
            <div class="col-lg-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Payment Summary</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Membership for</label>
                            <div class="col-lg-2 col-xs-12">
                                <asp:TextBox ID="txtMembershipYears" runat="server" class="form-control" type="number" min="1" max="10" disabled />
                            </div>
                            <label class="control-label">Year(s)</label>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Membership Type</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtMembershipType" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Registered Dependents</label>
                            <div class="col-lg-2 col-xs-12">
                                <asp:TextBox ID="txtDep" runat="server" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Gross Amount</label>
                            <div class="col-lg-4 col-xs-12 text-right">
                                <asp:TextBox ID="txtGross" runat="server" class="form-control text-center" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">VAT (12%)</label>
                            <div class="col-lg-4 col-xs-12 text-right">
                                <asp:TextBox ID="txtVat" runat="server" class="form-control text-center" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Total amount due for payment</label>
                            <div class="col-lg-4 col-xs-12 text-right">
                                <button type="button" id="btnPriceLit" class="btn btn-success btn-md">
                                    <asp:Literal ID="txtPriceLit" runat="server"></asp:Literal>
                                </button>
                            </div>
                        </div>
                        <hr />
                    </div>
                </div>
            </div>
            <div class="col-lg-6"></div>
            <div class="col-lg-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Payment Method</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <h2>Bank Deposit</h2>
                        <div class="form-group">
                            <div class="thumbnail col-lg-12" id="divDepositSlip">
                                <asp:HyperLink ID="imgDepositSlipLb" runat="server" data-lightbox="lbDB">
                                    <asp:Image ID="imgDepositSlip" class="img-responsive pull-left" runat="server" />
                                </asp:HyperLink>
                            </div>
                            <div class="col-lg-12">
                                <asp:FileUpload ID="fileDepositSlip" runat="server" class="file" />
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-4 col-lg-8">
                                    <asp:Button ID="btnUpload" runat="server" class="btn btn-primary pull-right" Text="Upload"
                                        OnClick="btnUpload_Click" OnClientClick="return confirm('Are you sure?')"/>
                                </div>
                            </div>
                            <hr />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-l2">
            <div class="x_panel">
                <div class="x_title"></div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary pull-right" Text="Approve"
                                OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure?')"/>
                            <asp:Button ID="btnVoid" runat="server" class="btn btn-primary pull-right" Text="Void Application"
                                OnClick="btnVoid_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

