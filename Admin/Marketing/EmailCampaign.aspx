<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="EmailCampaign.aspx.cs" Inherits="Admin_Marketing_EmailCampaign" %>
<%@ Register TagPrefix="CKEditor" Namespace="CKEditor.NET" Assembly="CKEditor.NET, Version=3.6.6.2, Culture=neutral, PublicKeyToken=e379cdf2f8354999" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="de" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Mail Automation</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-7">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Contact List </h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group pull-left">
                        <label class="control-label col-lg-4 col-xs-12">User Type</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:DropDownList ID="ddlUserGroup" runat="server" class="form-control"
                                OnSelectedIndexChanged="ddlUserGroup_OnSelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>Guest</asp:ListItem>
                                <asp:ListItem>Pending Client</asp:ListItem>
                                <asp:ListItem>Client</asp:ListItem>
                                <asp:ListItem>Administrator</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group pull-left">
                        <label class="control-label col-lg-4 col-xs-12">Status</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:DropDownList ID="ddlUserStatus" runat="server" class="form-control"
                                OnSelectedIndexChanged="ddlUserStatus_OnSelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    </div>
                <div class="x_content">
                    <asp:GridView ID="gvUsers" runat="server"
                        class="table table-responsive table-bordered" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="UserType" HeaderText="User Type" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkEmail" runat="server"
                                        Text='<%# Eval("Email") %>' NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            No records found
                        </EmptyDataTemplate>
                    </asp:GridView>
                    </div>
                </div>
            </div>
        <div class="col-lg-5">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Mail Form</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="complete" runat="server" class="alert alert-success text-center" visible="false"
                        style="color: white;">
                        Message Sent Successful
                    </div>
                    <div id="error" runat="server" class="alert alert-danger text-center" visible="false"
                        style="color: white;">
                        An error occured while sending messages
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Subject</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:TextBox ID="txtSubject" class="form-control" runat="server" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-12 col-xs-12">
                            <dx:ASPxMemo ID="txtMessage" Width="100%" Height="250px" runat="server"></dx:ASPxMemo>
                        </div>
                    </div>
                    <hr />
                    <asp:Button ID="btnSent" runat="server" class="btn btn-primary pull-right" Text="Send Mail"
                        OnClick="btnSent_OnClick" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>

