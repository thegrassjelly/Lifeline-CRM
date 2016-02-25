<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AddMedical.aspx.cs" Inherits="Admin_Users_Dispatch" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchHospital();
            SearchAmbulance();
            SearchDispatcher();
            SearchTeamleader();
            SearchTreatmentOfficer();
            SearchTransportOfficer();
        });

        function SearchAmbulance() {
            $(".search-ambulance").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddMedical.aspx/SearchAmbulance",
                        data: "{'ambulanceText':'" + document.getElementById('<%=txtAmbulance.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
            }

        function SearchHospital() {
            $(".search-hospital").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddMedical.aspx/SearchHospital",
                        data: "{'hospitalText':'" + document.getElementById('<%=txtHospital.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
            }

        function SearchTeamleader() {
            $(".search-tl").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddMedical.aspx/SearchTeamLeader",
                        data: "{'tlText':'" + document.getElementById('<%=txtTL.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
           }

        function SearchDispatcher() {
            $(".search-dispatcher").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddMedical.aspx/SearchDispatcher",
                        data: "{'dpText':'" + document.getElementById('<%=txtDispatcher.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
            }

        function SearchTreatmentOfficer() {
            $(".search-treatment").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddMedical.aspx/SearchTreatmentOfficer",
                        data: "{'treatText':'" + document.getElementById('<%=txtTreatmentOfficer.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
            }

        function SearchTransportOfficer() {
            $(".search-transport").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddMedical.aspx/SearchTransportOfficer",
                        data: "{'transText':'" + document.getElementById('<%=txtTransportOfficer.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true" />
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Add Medical History</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="medical" runat="server" class="alert alert-success text-center" visible="false">
                        Medical/Dispatch info added
                    </div>
                    <dx:ASPxGridView ID="gvMedicalList" runat="server"
                        OnDataBinding="gvMedicalList_OnDataBinding" Width="100%" AutoGenerateColumns="False" EnableTheming="True"
                        Theme="Moderno" KeyFieldName="DispatchID">
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <SettingsSearchPanel Visible="True" />
                        <SettingsPager PageSize="5">
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Operation" VisibleIndex="1" Width="10px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn Width="50px" VisibleIndex="8">
                                <DataItemTemplate>
                                    <a href='DispatchDetails.aspx?ID=<%# Eval("DispatchID") %>'><i class="fa fa-2x fa-folder"></i></a>
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataDateColumn FieldName="StartDate" VisibleIndex="2">
                                <PropertiesDateEdit DisplayFormatString="">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dxe:GridViewDataDateColumn FieldName="EndDate" VisibleIndex="4">
                                <PropertiesDateEdit DisplayFormatString="">
                                </PropertiesDateEdit>
                            </dxe:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Details" VisibleIndex="7" Width="130px">
                                <PropertiesTextEdit DisplayFormatString="d">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4">Medical Event</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtOperation" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Initial Date</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtStartDate" class="form-control" runat="server" TextMode="date" required />
                            <asp:RangeValidator ID="sdateVld" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="txtStartDate"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01"
                                MinimumValue="1900-01-01" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Discharge Date</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtEndDate" class="form-control" runat="server" TextMode="date" />
                            <asp:RangeValidator ID="edateBld" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="txtEndDate"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01"
                                MinimumValue="1900-01-01" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Prognosis</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtDetails" runat="server" class="form-control" required />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4">Dispatcher</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtDispatcher" runat="server" class="form-control search-dispatcher" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Call Date</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCallDate" class="form-control" runat="server" TextMode="date" />
                            <asp:RangeValidator ID="cdateVld" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="txtCallDate"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01"
                                MinimumValue="1900-01-01" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Recieving Hospital</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtHospital" runat="server" class="form-control search-hospital" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Ambulance</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtAmbulance" runat="server" class="form-control search-ambulance" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtAmbulance"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid ambulance name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Team Leader</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtTL" runat="server" class="form-control search-tl" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Transport Officer</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtTransportOfficer" runat="server" class="form-control search-transport" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Treatment Officer</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtTreatmentOfficer" runat="server" class="form-control search-treatment" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title"></div>
                <div class="clearfix"></div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnInsert" runat="server" class="btn btn-primary pull-right" Text="Submit"
                                OnClick="btnInsert_Click" OnClientClick="return validate()" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

