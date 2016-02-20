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
                            <asp:RegularExpressionValidator ID="fnVldOne" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depOneFn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depOneLn" runat="server" class="form-control" MaxLength="80" required />
                            <asp:RegularExpressionValidator ID="lnVldOne" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depOneLn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
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
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depOneRelOthers"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid relationship" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depOneBday" class="form-control" runat="server" TextMode="date" 
                                MaxLength="10" required />
                            <asp:RangeValidator ID="bdayVldOne" runat="server" 
                                Display="Dynamic"         
                                ForeColor="Red"                       
                                ControlToValidate="depOneBday"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01" 
                                MinimumValue="1900-01-01" />
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
                            <asp:RegularExpressionValidator ID="fnVldTwo" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depTwoFn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depTwoLn" runat="server" class="form-control" MaxLength="80" />
                            <asp:RegularExpressionValidator ID="lnVldTwo" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depTwoLn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
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
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depTwoRelOthers"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid relationship" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depTwoBday" class="form-control" runat="server" TextMode="date" />
                            <asp:RangeValidator ID="bdayVldTwo" runat="server" 
                                Display="Dynamic"         
                                ForeColor="Red"                       
                                ControlToValidate="depTwoBday"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01" 
                                MinimumValue="1900-01-01" />
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
                            <asp:RegularExpressionValidator ID="fnVldThree" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depThreeFn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depThreeLn" runat="server" class="form-control" MaxLength="80" />
                            <asp:RegularExpressionValidator ID="lnVldThree" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depThreeLn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
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
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depThreeOthers"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid relationship" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depThreeBday" class="form-control" runat="server" TextMode="Date" />
                            <asp:RangeValidator ID="bdayVldThree" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="depThreeBday"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01"
                                MinimumValue="1900-01-01" />
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
                            <asp:RegularExpressionValidator ID="fnVldFour" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depFourFn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depFourLn" runat="server" class="form-control" MaxLength="80" />
                            <asp:RegularExpressionValidator ID="lnVldFour" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depFourLn"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid name" />
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
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                                ForeColor="Red"
                                display="Dynamic"
                                ControlToValidate="depFourOthers"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a valid relationship" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="depFourBday" class="form-control" runat="server" TextMode="Date" />
                            <asp:RangeValidator ID="bdayVldFour" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ControlToValidate="depFourBday"
                                ErrorMessage="Choose a valid date"
                                MaximumValue="2017-01-01"
                                MinimumValue="1900-01-01" />
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
                                OnClick="btnAdd_Click" OnClientClick="return validate()" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

