<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="UpdateDependents.aspx.cs" Inherits="Account_Membership_UpdateDependents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Membership Application</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Update Dependent</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" required />
                            <asp:RegularExpressionValidator ID="fnVld" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtFirstName"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" required />
                            <asp:RegularExpressionValidator ID="lnVld" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtLastName"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Relationship</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlRelationship" runat="server" class="form-control" required>
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Husband</asp:ListItem>
                                <asp:ListItem>Wife</asp:ListItem>
                                <asp:ListItem>Son</asp:ListItem>
                                <asp:ListItem>Daugther</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtOtherRel" runat="server" class="form-control" MaxLength="12" />
                            <asp:RegularExpressionValidator ID="nmVld" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtOtherRel"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid value" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtBday" class="form-control" runat="server" TextMode="date" />
                            <asp:RangeValidator ID="bdayVld" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="txtBday"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01"
                                MinimumValue="1900-01-01" />
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
        </div>
    </form>
</asp:Content>

