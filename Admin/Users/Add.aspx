<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Users_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Add Users</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div id="user" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                    User Added
                </div>
                <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                    Email address already existing.
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-2 col-sm-12 col-xs-12">
                                <asp:Button class="btn btn-success" runat="server" Visible="false"></asp:Button>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-sm-12 col-xs-12">Profile picture</label>
                            <div class="col-lg-8">
                                <div class="thumbnail" id="usrPic">
                                    <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-8 col-lg-offset-4 col-sm-12 col-xs-12">
                                <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" />
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
                                <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" />
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
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="7" />
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
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="11" />
                                <asp:RegularExpressionValidator ID="MblVld" runat="server"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ControlToValidate="txtMobile"
                                    ValidationExpression="^[0-9]{11}$"
                                    ErrorMessage="Enter a valid mobile Number" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Date of Birth</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                 <asp:TextBox ID="txtBday" class="form-control" runat="server" TextMode="Date" />
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
                    <div class="col-lg-6">
                        <hr />
                        <div class="form-group">
                            <label class="control-label col-lg-4">Street</label>
                            <div class="col-lg-7 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtStreet" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Municipality</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" />
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
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtCity" runat="server" class="form-control" />
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
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" MaxLength="80" />
                                <asp:RegularExpressionValidator ID="emlVld" runat="server"
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="Please enter valid e-mail address"
                                    ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Password</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" MaxLength="30"
                                    TextMode="Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Status</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:DropDownList ID="ddlStatus" class="form-control" runat="server" data-toggle="tooltip">
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Pending</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">User Type</label>
                            <div class="col-lg-4 col-sm-12 col-xs-12">
                                <asp:DropDownList ID="ddlUserType" class="form-control" runat="server" data-toggle="tooltip">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnInsert" runat="server" class="btn btn-primary pull-right" Text="Submit"
                            OnClick="btnInsert_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

