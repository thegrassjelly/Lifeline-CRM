﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Corporate/corporate.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Corporate_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Account Management</h3>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });

        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({7
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Default.aspx/SearchCity",
                        data: "{'prefixText':'" + document.getElementById('<%=txtCity.ClientID%>').value + "'}",
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                alert("Error" + result.result);
                            }
                        });
                    }
                });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Employees</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                            <asp:ListItem Text="Active" Value="Active" />
                                            <asp:ListItem Text="Inactive" Value="Inactive" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtSearch" runat="server" class="form-control"
                                            placeholder="Keyword..." />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-info"
                                                OnClick="btnSearch_Click">
                                      <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <table class="table table-striped project">
                                <thead>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Contact No.</th>
                                    <th>Street</th>
                                    <th>Municipality</th>
                                    <th>City</th>
                                    <th>Status</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lvEmployees" runat="server"
                                        OnPagePropertiesChanging="lvEmployees_PagePropertiesChanging">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("LastName") %>, <%# Eval("FirstName") %></td>
                                                <td><%# Eval("Email") %></td>
                                                <td><%# Eval("Phone") %> / <%# Eval("Mobile") %></td>
                                                <td><%# Eval("Street") %></td>
                                                <td><%# Eval("Municipality") %></td>
                                                <td><%# Eval("City") %></td>
                                                <td><%# Eval("Status") %></td>
                                                <td>
                                                    <a href='<%# ResolveUrl("~/Corporate/UserDetails.aspx?ID=") %><%# Eval("UserID") %>'>
                                                        <asp:Label runat="server"><i class="fa fa-folder"></i></asp:Label>
                                                    </a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <tr>
                                                <td colspan="12">
                                                    <h2 class="text-center">No records found.</h2>
                                                </td>
                                            </tr>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                </tbody>
                            </table>
                            <hr />
                            <div class="text-center">
                                <asp:DataPager ID="dpEmployees" runat="server" PagedControlID="lvEmployees" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                        <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <hr />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Employer Details</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="employer_up" runat="server" class="alert alert-success text-center" visible="false">
                        Employer Updated
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Employer Code</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <button type="button" class="btn btn-info btn-md">
                                <asp:Literal ID="ltEmployerCode" runat="server"></asp:Literal>
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Employeer Login</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtUserName" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Employer Name</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtName" class="form-control" runat="server" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Nature of Business</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlNature" runat="server" class="form-control">
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
                        <div class="col-lg-4 col-sm-12 col-xs-12">
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
                        <label class="control-label col-lg-4">Fax No.</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtFax" runat="server" class="form-control" MaxLength="7" />
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
                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Municipality</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
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
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtCity" runat="server" class="form-control autosuggest" />
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
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" MaxLength="80" />
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
                        <label class="control-label col-lg-4">Password</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" MaxLength="30"
                                TextMode="Password" />
                            <ajaxtoolkit:passwordstrength id="ajaxPwd" runat="server"
                                targetcontrolid="txtPassword"
                                displayposition="BelowRight"
                                strengthindicatortype="Text"
                                preferredpasswordlength="10"
                                prefixtext="Strength: "
                                helpstatuslabelid="TextBox1_HelpLabel"
                                textstrengthdescriptions="Very Poor;Weak;Average;Strong;Excellent"
                                strengthstyles="TextIndicator_TextBox1_Strength1;TextIndicator_TextBox1_Strength2;TextIndicator_TextBox1_Strength3;TextIndicator_TextBox1_Strength4;TextIndicator_TextBox1_Strength5"
                                minimumnumericcharacters="0"
                                minimumsymbolcharacters="0"
                                requiresupperandlowercasecharacters="false" />
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <label class="control-label col-lg-4">Status</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox id="txtStatus" class="form-control" runat="server" disabled />
                        </div>
                    </div>
                    <hr />
                </div>
                <div class="x_title">
                    <h2>Billing Information</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Membership Length</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtLength" runat="server" class="form-control" type="number" min="1" max="10" disabled />
                        </div>
                        <label class="control-label">Year(s)</label>
                    </div>
                <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Payment Terms</label>
                        <div class="col-lg-3 col-xs-12">
                        <asp:TextBox ID="txtPaymentTerms" class="form-control" min="1" max="25"
                            runat="server" MaxLength="2" disabled></asp:TextBox>
                        </div>
                    </div>
                <div class="form-group">
                    <label class="control-label col-lg-4 col-xs-12">Discount Rate</label>
                    <div class="col-lg-2 col-xs-12">
                        <asp:TextBox ID="txtDiscountRate" class="form-control" min="1" max="25"
                            runat="server" MaxLength="2" disabled></asp:TextBox>
                    </div>
                    <label class="control-label">%</label>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4 col-xs-12">Total amount due for payment</label>
                    <div class="col-lg-4 col-xs-12 text-right">
                        <asp:TextBox ID="txtBalance" runat="server" class="form-control" disabled/>
                    </div>
                </div>
                <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Payments</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group pull-left">
                        <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:DropDownList ID="ddlSortBy" runat="server" class="form-control"
                                OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Selected="True" Value="DepositID">ID</asp:ListItem>
                                <asp:ListItem>Amount</asp:ListItem>
                                <asp:ListItem Value="PaymentDate">Payment Date</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group pull-left">
                        <label class="control-label col-lg-4 col-xs-12">Direction</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:DropDownList ID="ddlDirection" runat="server" class="form-control"
                                OnSelectedIndexChanged="ddlDirection_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="ASC">Ascending</asp:ListItem>
                                <asp:ListItem Selected="True" Value="DESC">Descending</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table class="table table-striped projects">
                                <thead>
                                    <th>ID</th>
                                    <th>Amount Paid</th>
                                    <th>Payment Date</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lvPaymentHistory" runat="server" OnPagePropertiesChanging="lv_PagePropertiesChanging">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("DepositID") %></td>
                                                <td>
                                                    <%# Eval("Amount", "{0:₱ #,###.00}") %>
                                                </td>
                                                <td>
                                                    <%# Eval("PaymentDate", "{0: MMMM dd, yyyy}") %>
                                                </td>
                                                <td>
                                                    <a href='DepositPaymentDetails.aspx?ID=<%# Eval("DepositID") %>' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Details</a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            <tr>
                                                <td colspan="12">
                                                    <h2 class="text-center">No records found</h2>
                                                </td>
                                            </tr>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                </tbody>
                            </table>
                            <hr />
                            <div class="text-center">
                                <asp:DataPager ID="lvDataPager" runat="server" PagedControlID="lvPaymentHistory" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                        <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <hr />
                    <div id="db_error" runat="server" class="alert alert-danger text-center" visible="false"
                        style="color: white;">
                        Input Error, Payment was not added.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Amount</label>
                        <div class="col-lg-5 col-xs-12 text-right">
                            <asp:TextBox ID="txtDepositAmount" runat="server" class="form-control" min="1" max="" TextMode="Number"/>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <div class="thumbnail col-lg-12" id="divDepositSlip">
                            <asp:HyperLink ID="imgDepositSlipLb" runat="server" data-lightbox="lbDB">
                                <asp:Image ID="imgDepositSlip" class="img-responsive pull-left" runat="server" />
                            </asp:HyperLink>
                        </div>
                        <div class="col-lg-12">
                            <asp:FileUpload ID="fileDepositSlip" runat="server" class="file" />
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-4 col-lg-8">
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary pull-right" Text="Add Payment"
                                    OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure?')"/>
                            </div>
                        </div>
                        <hr />
                    </div>
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
                            <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update"
                                OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
