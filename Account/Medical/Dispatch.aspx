<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Dispatch.aspx.cs" Inherits="Account_Medical_Dispatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Medical Information</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Medical Details</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <ul class="stats-overview">
                        <li>
                            <span class="name">Medical Operation</span>
                            <span class="value text-success">
                                <asp:literal id="txtOperation" runat="server"></asp:literal>
                            </span>
                        </li>
                        <li>
                            <span class="name">Call Date </span>
                            <span class="value text-success">
                                <asp:literal id="txtStartDate" runat="server"></asp:literal>
                            </span>
                        </li>
                        <li>
                            <span class="name">Discharge Date</span>
                            <span class="value text-success">
                                <asp:literal id="txtEndDate" runat="server"></asp:literal>
                            </span>
                        </li>
                        <li>
                            <span class="name">Prognosis </span>
                            <span class="value text-success">
                                <asp:literal id="txtDetails" runat="server"></asp:literal>
                            </span>
                        </li>
                    </ul>
                    <br/>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="control-label col-lg-4">Dispatch ID</label>
                                <div class="col-lg-2 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtDispatchID" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Dispatcher</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtDispatcher" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Date</label>
                                <div class="col-lg-5 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtDate" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Receiving Hospital</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtHospital" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Address</label>
                                <div class="col-lg-7 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Municipality</label>
                                <div class="col-lg-5 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtMunicipality" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">City</label>
                                <div class="col-lg-5 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtCity" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="control-label col-lg-4">Ambulance</label>
                                <div class="col-lg-4 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtAmbulance" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Team Leader</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtTL" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Transport Officer</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtTransport" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Treatment Officer</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:textbox id="txtTreatment" runat="server" class="form-control" disabled />
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <br />
                </div>
            </form>
        </div>
    </div>
</asp:Content>

