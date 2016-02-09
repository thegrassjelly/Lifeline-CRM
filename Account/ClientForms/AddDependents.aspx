<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="AddDependents.aspx.cs" Inherits="Account_ClientForms_AddDependents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Membership Application</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Add household dependents - First dependent</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depOneFn" runat="server" class="form-control" MaxLength="80" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depOneLn" runat="server" class="form-control" MaxLength="80" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Relationship</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlDepOneRel" runat="server" class="form-control" required>
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Husband</asp:ListItem>
                                <asp:ListItem>Wife</asp:ListItem>
                                <asp:ListItem>Son</asp:ListItem>
                                <asp:ListItem>Daugther</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depOneRelOthers" runat="server" class="form-control" MaxLength="12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depOneBday" class="form-control" runat="server" data-toggle="tooltip"
                                title="Date format: mm/dd/yyyy" MaxLength="10" required />
                            <asp:RegularExpressionValidator
                                ID="dateValRegex"
                                runat="server"
                                ControlToValidate="depOneBday"
                                ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)"
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Second Dependent</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depTwoFn" runat="server" class="form-control" MaxLength="80" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depTwoLn" runat="server" class="form-control" MaxLength="80" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Relationship</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlDepTwoRel" runat="server" class="form-control">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Husband</asp:ListItem>
                                <asp:ListItem>Wife</asp:ListItem>
                                <asp:ListItem>Son</asp:ListItem>
                                <asp:ListItem>Daugther</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depTwoRelOthers" runat="server" class="form-control" MaxLength="12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depTwoBday" class="form-control" runat="server" data-toggle="tooltip"
                                title="Date format: mm/dd/yyyy" MaxLength="10" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                runat="server"
                                ControlToValidate="depTwoBday"
                                ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)"
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Third Dependent</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depThreeFn" runat="server" class="form-control" MaxLength="80" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depThreeLn" runat="server" class="form-control" MaxLength="80" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Relationship</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlDepThreeRel" runat="server" class="form-control">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Husband</asp:ListItem>
                                <asp:ListItem>Wife</asp:ListItem>
                                <asp:ListItem>Son</asp:ListItem>
                                <asp:ListItem>Daugther</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depThreeOthers" runat="server" class="form-control" MaxLength="12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depThreeBday" class="form-control" runat="server" data-toggle="tooltip"
                                title="Date format: mm/dd/yyyy" MaxLength="10" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2"
                                runat="server"
                                ControlToValidate="depThreeBday"
                                ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)"
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Fourth Dependent</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depFourFn" runat="server" class="form-control" MaxLength="80" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depFourLn" runat="server" class="form-control" MaxLength="80" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Relationship</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlFourRel" runat="server" class="form-control">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Husband</asp:ListItem>
                                <asp:ListItem>Wife</asp:ListItem>
                                <asp:ListItem>Son</asp:ListItem>
                                <asp:ListItem>Daugther</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">If others</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depFourOthers" runat="server" class="form-control" MaxLength="12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depFourBday" class="form-control" runat="server" data-toggle="tooltip"
                                title="Date format: mm/dd/yyyy" MaxLength="10" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator3"
                                runat="server"
                                ControlToValidate="depFourBday"
                                ErrorMessage="Please Enter a valid date in the format (mm/dd/yyyy)"
                                ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title"></div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnAdd" runat="server" class="btn btn-primary pull-right" Text="Add Dependent(s)"
                                OnClick="btnAdd_Click" OnClientClick="return confirm('Are you sure?')" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

