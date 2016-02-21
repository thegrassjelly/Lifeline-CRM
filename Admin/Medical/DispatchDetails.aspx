<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="DispatchDetails.aspx.cs" Inherits="Admin_Medical_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Medical & Dispatch Details</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <asp:ScriptManager runat="server" EnablePageMethods="true" />
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <ul class="stats-overview">
                        <li>
                            <span class="name">Medical Operation</span>
                            <span class="value text-success">
                                <asp:Literal ID="txtOperation" runat="server"></asp:Literal>
                            </span>
                        </li>
                        <li>
                            <span class="name">Call Date </span>
                            <span class="value text-success">
                                <asp:Literal ID="txtStartDate" runat="server"></asp:Literal>
                            </span>
                        </li>
                        <li>
                            <span class="name">Discharge Date</span>
                            <span class="value text-success">
                                <asp:Literal ID="txtEndDate" runat="server"></asp:Literal>
                            </span>
                        </li>
                        <li>
                            <span class="name">Prognosis </span>
                            <span class="value text-success">
                                <asp:Literal ID="txtDetails" runat="server"></asp:Literal>
                            </span>
                        </li>
                    </ul>
                    <div class="row">
                        <br/>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="control-label col-lg-4">Dispatch ID</label>
                                <div class="col-lg-2 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtDispatchID" runat="server" class="form-control" disabled/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Dispatcher</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtDispatcher" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Date</label>
                                <div class="col-lg-5 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtDate" class="form-control" runat="server" TextMode="date" />
                                    <asp:RangeValidator ID="dtVld" runat="server"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txtDate"
                                        ErrorMessage="Choose a valid date"
                                        MaximumValue="2017-01-01"
                                        MinimumValue="1900-01-01" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Receiving Hospital</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtHospital" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Municipality</label>
                                <div class="col-lg-5 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" />
                                    <asp:RegularExpressionValidator ID="MncpltyVld" runat="server"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ControlToValidate="txtMunicipality"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                        Text="Enter a valid Municipality" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">City</label>
                                <div class="col-lg-5 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtCity" runat="server" class="form-control" />
                                    <ajaxToolkit:AutoCompleteExtender ID="ajaxCity" runat="server"
                                        ServiceMethod="SearchCity"
                                        MinimumPrefixLength="1"
                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                        TargetControlID="txtCity"
                                        FirstRowSelected="false" />
                                    <asp:RegularExpressionValidator ID="CtyVld" runat="server"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ControlToValidate="txtCity"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                        Text="Enter a valid City" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="control-label col-lg-4">Ambulance</label>
                                <div class="col-lg-4 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtAmbulance" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Team Leader</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtTL" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Transport Officer</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtTransport" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Treatment Officer</label>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <asp:TextBox ID="txtTreatment" runat="server" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update"
                                OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

