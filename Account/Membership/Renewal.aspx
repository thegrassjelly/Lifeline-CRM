﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Renewal.aspx.cs" Inherits="Account_Membership_Renewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Membership Renewal</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
            <div class="col-lg-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Billing Information</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div id="db_error" runat="server" class="alert alert-danger text-center" visible="false"
                            style="color: white;">
                            Membership Renewal did not continue, try again later.
                        </div>
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
                                <asp:TextBox ID="txtStreet" runat="server" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Municipality</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">City</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtCity" runat="server" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Phone No.</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Mobile No.</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Email Address</label>
                            <div class="col-lg-7 col-xs-12">
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" required />
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
                    <div class="x_content">
                        <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Renew for</label>
                            <div class="col-lg-3 col-xs-12">
                                <asp:TextBox ID="txtRenewYears" runat="server" class="form-control" type="number" min="1" max="10" required />
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
                                </asp:DropDownList>
                            </div>
                        </div>
                        <hr />
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Membership terms and agreement</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <asp:Panel runat="server" ScrollBars="vertical" Height="350px">
                            1. Lifeline offers membership to its Emergency Quick Response (EQR) Program to Metro Manila residents.
                        <br />
                            <br />
                            2. A membership enrollment form/clinical data sheet must be filled up and submitted to the Lifeline office with the corresponding membership fee.
                        The data will be used during any medical intervention involving the member.
                        <br />
                            <br />
                            3. Effectivity of membership starts upon receipt of payment of membership fee.
                        <br />
                            <br />
                            4. Membership provides free access to Lifeline's emergency medical service and covers only the period during which the member is attended to by the
                        Lifeline medical and nursing staff and its ambulance. Coverage ends upon proper endorsement to the emergency room of the receiving hospital.
                        <br />
                            <br />
                            5. The EQR can be reached and put into action by dialing the special access telephone numbers: 16-911 or 839 2520 to 30.
                        <br />
                            <br />
                            6. All legal actions brought against Lifeline in connection with this contract must be received within two (2) years from the date of the event which gave
                        rise to said legal action.
                        <br />
                            <br />
                            7. Lifeline will not be held responsible for failure to provide services or for delays caused by force majeure such as, but not limited to, natural disasters,
                        strikes or other conditions beyond its control. All claims arising under the agreement shall be vested exclusively in the courts of Parañaque City,
                        Metro Manila.
                        <br />
                            <br />
                            8. Lifeline has the right to be subrogated up to the amount of the service it has provided to the rights and causes of action of the member(s) of any party
                        responsible for acts which gave rise to injury or illness for whom Lifeline renders assistance.
                        <br />
                            <br />
                            9. The member hereby grants full authority to the Lifeline staff to do and execute any and all acts deemed proper for his/her best interests.<br />
                            <br />
                        </asp:Panel>
                        <hr />
                        <div class="form-group">
                            <label class="col-lg-12">
                                <asp:CheckBox ID="cboTerms" runat="server" required />&nbsp;
                            I agree with the terms and agreement as stated above, and that all the
                                information provided is correct.
                            </label>
                            <div class="col-lg-5">
                            </div>
                        </div>
                        <hr />
                        <div class="col-lg-12">
                            <span class="pull-right">
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Next" OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure?')" />
                            </span>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</asp:Content>
