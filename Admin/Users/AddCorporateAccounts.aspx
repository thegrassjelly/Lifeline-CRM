<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AddCorporateAccounts.aspx.cs" Inherits="Admin_Users_AddCorporateAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Employer Details</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="employer" runat="server" class="alert alert-success text-center" visible="false"
                        style="color: white;">
                        Employer Added
                    </div>
                    <div id="db_error" runat="server" class="alert alert-danger text-center" visible="false"
                        style="color: white;">
                        Input Error, The employer was not added to records.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Company Name</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCompanyName" runat="server" class="form-control" MaxLength="80" requireed/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Nature of Business</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlNature" runat="server" class="form-control" requireed>
                                <asp:ListItem>Service</asp:ListItem>
                                <asp:ListItem>Merchandising</asp:ListItem>
                                <asp:ListItem>Manufacturing</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtOthers" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Phone No.</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="7" required/>
                            <asp:RegularExpressionValidator ID="PhnVld" runat="server"
                                ForeColor="Red"
                                Display="Dynamic"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^[0-9]{7}$"
                                ErrorMessage="Enter a valid Phone Number" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Fax No.</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtFax" runat="server" class="form-control" MaxLength="7" required/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ForeColor="Red"
                                Display="Dynamic"
                                ControlToValidate="txtFax"
                                ValidationExpression="^[0-9]{7}$"
                                ErrorMessage="Enter a valid fax Number" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Street</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Municipality</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" required/>
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
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCity" runat="server" class="form-control" required/>
                            <asp:RegularExpressionValidator ID="CtyVld" runat="server"
                                ForeColor="Red"
                                Display="Dynamic"
                                ControlToValidate="txtCity"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid City" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Email Address</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" MaxLength="80" required/>
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
                        <label class="control-label col-lg-4">Status</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlStatus" class="form-control" runat="server" data-toggle="tooltip" required>
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Billing Information</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Membership Length</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtLength" runat="server" class="form-control" type="number" min="1" max="10" required />
                        </div>
                        <label class="control-label">Year(s)</label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Payment Terms</label>
                        <div class="col-lg-3 col-xs-12">
                            <asp:DropDownList ID="ddlPaymentTerms" runat="server" class="form-control" required>
                                <asp:ListItem>Net 7</asp:ListItem>
                                <asp:ListItem>Net 10</asp:ListItem>
                                <asp:ListItem>Net 30</asp:ListItem>
                                <asp:ListItem>Net 60</asp:ListItem>
                                <asp:ListItem>Net 90</asp:ListItem>
                                <asp:ListItem>EOM</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Discount Rate</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtDiscountRate" class="form-control" min="1" max="25"
                                runat="server" MaxLength="2"></asp:TextBox>
                        </div>
                        <label class="control-label">%</label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Total amount due for payment</label>
                        <div class="col-lg-4 col-xs-12 text-right">
                            <asp:TextBox ID="txtBalance" runat="server" class="form-control"
                                data-toggle="tooltip" title="No commas" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Submit"
                                OnClick="btnAdd_Click" OnClientClick="return confirm('Are you sure?')" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

