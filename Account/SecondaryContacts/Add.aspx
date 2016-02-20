<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Account_Secondary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Secondary Contact Information</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Add person(s) to contact in case of emergency</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" required/>
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
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" required/>
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
                            <label class="control-label col-lg-4">Mobile No.</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="11" required/>
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
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:DropDownList ID="ddlContact" runat="server" class="form-control" required>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">If others</label>
                            <div class="col-lg-5 col-sm-12 col-xs-12">
                                <asp:TextBox ID="txtOthers" runat="server" class="form-control" MaxLength="12" />
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
                        <asp:Button ID="btnInsert" runat="server" class="btn btn-primary pull-right" Text="Add Contact"
                            OnClick="btnInsert_Click" />
                    </div>
                </div>

            </form>
        </div>
    </div>

</asp:Content>

