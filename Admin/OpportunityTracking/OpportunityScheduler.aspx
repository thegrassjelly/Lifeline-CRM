<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="OpportunityScheduler.aspx.cs" Inherits="Admin_OpportunityTracking_OpportunityScheduler" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.XtraScheduler.v15.1.Core, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Schedule Activity</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">

                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <dxwschs:ASPxDateNavigator ID="ASPxDateNavigator1" runat="server" ClientIDMode="AutoID" MasterControlID="schOpportunityActivity">
                        <Properties Columns="3">
                        </Properties>
                    </dxwschs:ASPxDateNavigator>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <dxwschs:ASPxScheduler ID="schOpportunityActivity" runat="server" Theme="MetropolisBlue" 
                        AppointmentDataSourceID="SqlDataSource1" ClientIDMode="AutoID" Start="2015-10-28"
                        ActiveViewType="Timeline">
                        <Storage>
                            <Appointments AutoRetrieveId="True">
                                <Mappings AllDay="AllDay" AppointmentId="OpportunityActivityID" 
                                    Description="Description" End="EndDate" Label="Label" Location="Location" 
                                    RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" 
                                    ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                            </Appointments>
                        </Storage>
                        <Views>
                            <DayView>
                                <TimeRulers>
                                    <cc1:TimeRuler></cc1:TimeRuler>
                                </TimeRulers>
                            </DayView>

                            <WorkWeekView>
                                <TimeRulers>
                                    <cc1:TimeRuler></cc1:TimeRuler>
                                </TimeRulers>
                            </WorkWeekView>
                            <WeekView Enabled="false">
                            </WeekView>
                            <FullWeekView Enabled="true">
                                <TimeRulers>
                                    <cc1:TimeRuler></cc1:TimeRuler>
                                </TimeRulers>
                            </FullWeekView>
                        </Views>
                    </dxwschs:ASPxScheduler>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbLifelineConnectionString %>" 
                        DeleteCommand="DELETE FROM [OpportunityActivity] WHERE [OpportunityActivityID] = @OpportunityActivityID AND 
                        [OpportunityID] = @OpIDDelete"
                        InsertCommand="INSERT INTO [OpportunityActivity] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], 
                        [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], 
                        [OpportunityID]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label,
                         @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField, @OpIDInsert)"
                        SelectCommand="SELECT * FROM [OpportunityActivity] WHERE ([OpportunityID] = @OpIDSelect)" 
                        UpdateCommand="UPDATE [OpportunityActivity] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, 
                        [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, 
                        [Label] = @Label, [ResourceID] = @ResourceID, [ResourceIDs] = @ResourceIDs, [ReminderInfo] = @ReminderInfo, 
                        [RecurrenceInfo] = @RecurrenceInfo, [CustomField] = @CustomField, [OpportunityID] = @OpIDUpdate WHERE 
                        [OpportunityActivityID] = @OpportunityActivityID AND [OpportunityID] = @OpIDUpdate">
                        <DeleteParameters>
                            <asp:Parameter Name="OpportunityActivityID" Type="Int32" />
                            <asp:QueryStringParameter Name="OpIDDelete" QueryStringField="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Type" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="StartDate" />
                            <asp:Parameter DbType="Date" Name="EndDate" />
                            <asp:Parameter Name="AllDay" Type="Boolean" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Status" Type="Int32" />
                            <asp:Parameter Name="Label" Type="Int32" />
                            <asp:Parameter Name="ResourceID" Type="Int32" />
                            <asp:Parameter Name="ResourceIDs" Type="String" />
                            <asp:Parameter Name="ReminderInfo" Type="String" />
                            <asp:Parameter Name="RecurrenceInfo" Type="String" />
                            <asp:Parameter Name="CustomField" Type="String" />
                            <asp:Parameter Name="OpportunityID" Type="Int32" />
                        </InsertParameters>
                        <InsertParameters>
                            <asp:QueryStringParameter Name="OpIDInsert" QueryStringField="ID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="OpIDSelect" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Type" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="StartDate" />
                            <asp:Parameter DbType="Date" Name="EndDate" />
                            <asp:Parameter Name="AllDay" Type="Boolean" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Status" Type="Int32" />
                            <asp:Parameter Name="Label" Type="Int32" />
                            <asp:Parameter Name="ResourceID" Type="Int32" />
                            <asp:Parameter Name="ResourceIDs" Type="String" />
                            <asp:Parameter Name="ReminderInfo" Type="String" />
                            <asp:Parameter Name="RecurrenceInfo" Type="String" />
                            <asp:Parameter Name="CustomField" Type="String" />
                            <asp:Parameter Name="OpportunityID" Type="Int32" />
                            <asp:Parameter Name="OpportunityActivityID" Type="Int32" />
                        </UpdateParameters>
                        <UpdateParameters>
                            <asp:QueryStringParameter Name="OpIDUpdate" QueryStringField="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

