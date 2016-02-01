<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="AutomaticRenewal.aspx.cs" Inherits="Account_Membership_AutomaticRenewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Membership Renewal</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Automatic Renewal Form</h2>
         <div class="clearfix"></div>      
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="col-lg-12">
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
                                    <div class="col-lg-8 col-xs-12">
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
                                        <asp:TextBox ID="txtPhone" runat="server" class="form-control" disabled/>
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
                                    <div class="col-lg-7 col-xs-12">
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <hr />
                                <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                                    Invalid password.
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Enter your password</label>
                                    <div class="col-lg-7 col-xs-12">
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" required />
                                    </div>
                                </div>
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
                                <div id="disable" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                                    Automatic Renewal Disabled
                                </div>
                                <div id="enable" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                                    Automatic Renewal Enabled
                                </div>
                                <div id="nomem" runat="server" class="alert alert-info text-center" visible="false" style="color: white">
                                    No current (Individual/Household) membership found
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Current Membership</label>
                                    <div class="col-lg-7 col-xs-12">
                                        <label class="control-label">Ends On</label>
                                        <asp:TextBox ID="txtEndDate" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Subscription</label>
                                    <div class="col-lg-4 col-xs-12">
                                        <asp:TextBox ID="txtStatus" runat="server" class="form-control" disabled/>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Renew for</label>
                                    <div class="col-lg-2 col-xs-12">
                                        <asp:TextBox ID="txtRenewYears" runat="server" class="form-control" Text="1" disabled/>
                                    </div>
                                    <label class="control-label">Year(s)</label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Membership Type</label>
                                    <div class="col-lg-5 col-xs-12">
                                        <asp:DropDownList ID="ddlMembershiptype" runat="server" class="form-control"
                                            data-toggle="tooltip"
                                            title="Individual: P 1,000.00 /year, Household: P 3,000.00 /year" required>
                                            <asp:ListItem>Individual</asp:ListItem>
                                            <asp:ListItem>Household</asp:ListItem>
                                            <asp:ListItem>Corporate/Bulk</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-xs-12">Notify me</label>
                                    <div class="col-lg-3 col-xs-12">
                                        <asp:DropDownList ID="ddlReminder" runat="server" class="form-control" required>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <label class="control-label">Days prior end</label>
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
                                <div class="col-lg-12">
                                    <span class="pull-right">
                                        <asp:Button ID="btnDisable" runat="server" class="btn btn-primary" Text="Disable Renewal" OnClick="btnDisable_OnClick" OnClientClick="return confirm('Are you sure?')" />
                                    </span>                                    
                                    <span class="pull-right">
                                        <asp:Button ID="btnEnable" runat="server" class="btn btn-primary" Text="Enable Renewal" OnClick="btnEnable_OnClick" OnClientClick="return confirm('Are you sure?')" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

