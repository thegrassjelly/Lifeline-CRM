<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Account_SecondaryContacts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Secondary Contact Information</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Update Contact</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:textbox id="txtFirstName" runat="server" class="form-control" maxlength="80" required/>
                                <asp:RegularExpressionValidator ID="fnVld" runat="server"
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtFirstName"
                                    ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                    Text="Enter a valid name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:textbox id="txtLastName" runat="server" class="form-control" maxlength="80" required/>
                                <asp:RegularExpressionValidator ID="lnVld" runat="server"
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtLastName"
                                    ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                    Text="Enter a valid name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Phone No.</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:textbox id="txtPhone" runat="server" class="form-control" maxlength="7" required/>
                                <asp:RegularExpressionValidator ID="PhnVld" runat="server"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ControlToValidate="txtPhone"
                                    ValidationExpression="^[0-9]{7}$"
                                    ErrorMessage="Enter a valid Phone Number" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Mobile No.</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:textbox id="txtMobile" runat="server" class="form-control" maxlength="11" required/>
                                <asp:RegularExpressionValidator ID="MblVld" runat="server"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ControlToValidate="txtMobile"
                                    ValidationExpression="^[0-9]{11}$"
                                    ErrorMessage="Enter a valid Mobile Number" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">

                        <div class="form-group">
                            <label class="control-label col-lg-4">Relationship</label>
                            <div class="col-lg-3 col-sm-12 col-xs-12">
                                <asp:textbox id="txtContactRel" runat="server" class="form-control" disabled>
                            </asp:textbox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">If others</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:textbox id="txtOthers" runat="server" class="form-control" maxlength="12" disabled />
                                <asp:RegularExpressionValidator ID="nmVld" runat="server"
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtOthers"
                                    ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                    Text="Enter a valid value" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:button id="btnUpdate" runat="server" class="btn btn-primary pull-right" text="Update Contact"
                            onclick="btnUpdate_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

