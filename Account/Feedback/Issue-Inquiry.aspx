<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Issue-Inquiry.aspx.cs" Inherits="Account_Issue_Inquiry" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Issues and Inquiries form</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div id="issue" runat="server" class="alert alert-success text-center" visible="false">
                    A customer care representative will reply to you shortly, Thanks!
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">First Name</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtFirstName" class="form-control" runat="server" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtLastName" class="form-control" runat="server" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Email</label>
                            <div class="col-lg-8 col-xs-12">
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" required 
                                    title="Please enter a valid email address so we can respond to your issue/inquiry"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Category</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtCategory" class="form-control" runat="server" disabled>Issues/Inquiries</asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Issue/Inquiry Type</label>
                            <div class="col-lg-5 col-xs-12">
                                <asp:DropDownList ID="ddlMessageCat" runat="server" class="form-control" required>
                                    <asp:ListItem>User Interface problems</asp:ListItem>
                                    <asp:ListItem>Website functionality problems</asp:ListItem>
                                    <asp:ListItem>Incorrect records</asp:ListItem>
                                    <asp:ListItem>Error Pages</asp:ListItem>
                                    <asp:ListItem>Account/Membership Issues</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Subject</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtSubject" class="form-control" runat="server" required 
                                    title="For site issues, please include the name of the webpage."/>
                            </div>
                        </div>

                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-12 col-xs-12">
                        <dx:ASPxMemo ID="txtMessage" Width="100%" Height="250px" runat="server"></dx:ASPxMemo>

                    </div>
                </div>
                <hr />
                <div class="col-lg-12">
                    <span class="pull-right">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                    </span>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

