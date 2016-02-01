<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="DepositPaymentDetails.aspx.cs" Inherits="Admin_Users_DepositPaymentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Deposit Slip</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="deposit" runat="server" class="alert alert-success text-center" visible="false">
                        Deposit slip uploaded
                    </div>
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
                                <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update"
                                    OnClick="btnUpdate_Click" />
                            </div>
                        </div>
                        <hr />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Payment Details</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Payment Date</label>
                        <div class="col-lg-6 col-xs-12 text-right">
                            <asp:TextBox ID="txtPaymentDate" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Amount Paid</label>
                        <div class="col-lg-5 col-xs-12 text-right">
                            <asp:TextBox ID="txtDepositAmount" runat="server" class="form-control" disabled/>
                        </div>
                    </div>
                    <hr/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

