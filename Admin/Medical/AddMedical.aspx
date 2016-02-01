<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AddMedical.aspx.cs" Inherits="Admin_Users_Dispatch" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dxe" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
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
                        <SettingsDetail ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <h2>Dispatch Details</h2>
                                <dxe:ASPxGridView ID="gvDispatchDetails" runat="server"
                                    OnBeforePerformDataSelect="gvDispatchDetails_OnBeforePerformDataSelect"
                                    Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="MetropolisBlue">
                                    <Columns>
                                        <dxe:GridViewDataTextColumn FieldName="Dispatcher" VisibleIndex="2">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn FieldName="Date" VisibleIndex="3">
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataDateColumn FieldName="Ambulance" VisibleIndex="4">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataDateColumn FieldName="TeamLeader" VisibleIndex="5">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataDateColumn FieldName="TransportOfficer" VisibleIndex="6">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataDateColumn FieldName="TreatmentOfficer" VisibleIndex="7">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataDateColumn FieldName="ReceivingHospital" VisibleIndex="8">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataDateColumn FieldName="Municipality" VisibleIndex="9">
                                        </dxe:GridViewDataDateColumn>
                                        <dxe:GridViewDataDateColumn FieldName="City" VisibleIndex="10">
                                        </dxe:GridViewDataDateColumn>
                                    </Columns>
                                </dxe:ASPxGridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>"
                                    SelectCommand="SELECT [DispatchID], [Dispatcher], [Date], [Ambulance], 
                                    [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital], 
                                    [Municipality], [City] FROM [Dispatch] WHERE ([DispatchID] = @DispatchID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="DispatchID" SessionField="DispatchID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
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
                            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                            <telerik:RadDatePicker ID="txtStartDate" runat="server" class="form-control"></telerik:RadDatePicker>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Discharge Date</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <telerik:RadDatePicker ID="txtEndDate" runat="server" class="form-control"></telerik:RadDatePicker>
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
                            <asp:TextBox ID="txtDispatcher" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Call Date</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <telerik:RadDatePicker ID="txtCallDate" runat="server" class="form-control"></telerik:RadDatePicker>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Recieving Hospital</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtHospital" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Municipality</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">City</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCity" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Ambulance</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
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
                            <asp:TextBox ID="txtTransportOfficer" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Treatment Officer</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtTreatmentOfficer" runat="server" class="form-control" />
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
                                OnClick="btnInsert_Click" OnClientClick="return confirm('Are you sure?')" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

