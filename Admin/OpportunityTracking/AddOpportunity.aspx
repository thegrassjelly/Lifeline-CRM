<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AddOpportunity.aspx.cs" Inherits="Admin_OpportunityTracking_AddOpportunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Opportunity Tracking</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Opportunity Details</h2>
                    <div class="clear"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4">Opportunity Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtName" runat="server" class="form-control" MaxLength="80" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Account Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtAccountName" runat="server" class="form-control" MaxLength="80" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Description</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtDesctiption" runat="server" class="form-control" MaxLength="80" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Contact No.</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtContact" runat="server" class="form-control" MaxLength="7" required/>
                            <asp:RegularExpressionValidator ID="ctnctVld" runat="server"
                                ForeColor="Red"
                                Display="Dynamic"
                                ControlToValidate="txtContact"
                                ValidationExpression="^[0-9]{7}$"
                                ErrorMessage="Enter a valid contact Number" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Email</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="80"
                                TextMode="Email" required/>
                            <asp:RegularExpressionValidator ID="emlVld" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Please enter valid e-mail address"
                                ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <label class="control-label col-lg-4">Type</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlType" runat="server" Class="form-control" required>
                                <asp:ListItem>New Business</asp:ListItem>
                                <asp:ListItem>Existing Business</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Rating</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlRating" runat="server" Class="form-control" required>
                                <asp:ListItem>Cold</asp:ListItem>
                                <asp:ListItem>Warm</asp:ListItem>
                                <asp:ListItem>Hot</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Source</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlSource" runat="server" Class="form-control" required>
                                <asp:ListItem>Advertisement</asp:ListItem>
                                <asp:ListItem>Cold Call</asp:ListItem>
                                <asp:ListItem>Fax</asp:ListItem>
                                <asp:ListItem>Website</asp:ListItem>
                                <asp:ListItem>Seminar</asp:ListItem>
                                <asp:ListItem>Email</asp:ListItem>
                                <asp:ListItem>Existing Customer</asp:ListItem>
                                <asp:ListItem>Fax</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Priority</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlPriority" runat="server" Class="form-control" required>
                                <asp:ListItem>Normal</asp:ListItem>
                                <asp:ListItem>High</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Other Details</h2>
                    <div class="clear"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4">Stage</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlStage" runat="server" class="form-control" required>
                                <asp:ListItem>Lead</asp:ListItem>
                                <asp:ListItem>Prospecting</asp:ListItem>
                                <asp:ListItem>Needs Analysis</asp:ListItem>
                                <asp:ListItem>Value Proposition</asp:ListItem>
                                <asp:ListItem>Proposal/Price Quote</asp:ListItem>
                                <asp:ListItem>Paperwork</asp:ListItem>
                                <asp:ListItem>Closed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Opportunity Amount</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtAmount" runat="server" class="form-control"
                                TextMode="Number" Min="1" Max="9999999" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Probability</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtProbability" runat="server" class="form-control" TextMode="Number" Min="1" Max="100" 
                                MaxLength="3" required/>
                        </div>
                        <label class="control-label">%</label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Expected Close Date</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCloseDate" class="form-control" runat="server" TextMode="date" />
                            <asp:RangeValidator ID="cdVld" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="txtCloseDate"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2050-01-01"
                                MinimumValue="1900-01-01" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="x_panel">
                <div class="x_title">
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnAdd" runat="server" class="btn btn-primary pull-right" Text="Submit"
                                OnClick="btnAdd_OnClick" OnClientClick="return validate()" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

