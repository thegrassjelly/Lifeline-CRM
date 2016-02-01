<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Issue-InquiryDetails.aspx.cs" Inherits="Admin_Feedback_Issue_InquiryDetails" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
        <div class="x_panel">
        <div class="x_title">
            <h2>Issue/Inquiry Details</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtFirstName" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtLastName" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Email</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Message Category</label>
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtCategory" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Date Submitted</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtDate" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Subject</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtSubject" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Status</label>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="ddlStatus" class="form-control" runat="server">
                                    <asp:ListItem>Unread</asp:ListItem>
                                    <asp:ListItem>Read</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4"></label>
                            <div class="col-lg-5">
                                <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-12">
                        <dx:ASPxMemo ID="txtMessage" Width="100%" Height="250px" runat="server"></dx:ASPxMemo>
                    </div>
                </div>
                <hr />
            </form>
        </div>
    </div>
</asp:Content>

