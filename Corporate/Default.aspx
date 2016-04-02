<%@ Page Title="" Language="C#" MasterPageFile="~/Corporate/corporate.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Corporate_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Account Management</h3>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });

        function Default(index)
        {
            document.getElementById('<%= hdfValue.ClientID %>').value = index;
            $("#<%=btnButton.ClientID %>")[0].click();

        }
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
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
                                    <asp:HiddenField runat="server" ID="hdfValue" />
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
                                        OnPagePropertiesChanging="lvEmployees_PagePropertiesChanging" DataKeyNames="UserID" OnItemCommand="lvEmployees_ItemCommand" OnItemDataBound="lvEmployees_ItemDataBound">
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
                                                    <a data-toggle="modal" data-target="#modalUsers" runat="server">
                                                        <asp:Label runat="server" ID="lblUser"><i class="fa fa-folder"></i></asp:Label>
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
                            <div class="form-group">
                                <div class="col-lg-offset-4 col-lg-8">
                                    <a data-toggle="modal" data-target="#modalAddUser" runat="server">
                                        <asp:Button ID="btnAdd" runat="server" class="btn btn-primary pull-right" Text="Add Employee" />
                                    </a>
                                </div>
                            </div>
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
        <div id="modalUsers" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <%-- Modal content--%>
                <div class="modal-content">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><i class="fa fa-user"></i>&nbsp;User Details</h4>
                                <asp:Button ID="btnButton" CssClass="btn btn-default" runat="server" OnClick="btnButton_Click" Text="Refresh" style="display:none"/>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-sm-12 col-xs-12">Profile picture</label>
                                    <div class="col-lg-8">
                                        <div class="thumbnail" id="usrPic">
                                            <asp:HyperLink ID="imgUserLb" runat="server" data-lightbox="lbDB">
                                                <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label class="control-label col-lg-4">First Name</label>
                                    <div class="col-lg-6 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserFN" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Last Name</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserLN" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phone No.</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserPhone" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mobile No.</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserMobile" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Date of Birth</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserBday" class="form-control" runat="server" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Street</label>
                                    <div class="col-lg-6 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserStreet" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Municipality</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserMunicicpality" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">City</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserCity" runat="server" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Email Address</label>
                                    <div class="col-lg-6 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserEmail" runat="server" class="form-control" TextMode="Email" disabled />
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Status</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserStatus" class="form-control" runat="server" disabled>
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">User Type</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtUserType" class="form-control" runat="server" disabled>
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Priority</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtPriority" class="form-control" runat="server" disabled>
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <hr />

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div id="modalAddUser" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <%-- Modal content--%>
                <div class="modal-content">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title"><i class="fa fa-user"></i>&nbsp;User Details</h4>
                            </div>
                            <div id="employeeAdded" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                User Added
                            </div>
                            <div id="employeeError" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Email address already existing.
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label col-lg-4 col-sm-12 col-xs-12">Profile picture</label>
                                    <div class="col-lg-8">
                                        <div class="thumbnail" id="usrPic">
                                            <asp:Image ID="imgEmployee" class="img-responsive" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-lg-offset-4 col-sm-12 col-xs-12">
                                        <asp:FileUpload ID="usrEmployeeUpload" runat="server" class="file" />
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label class="control-label col-lg-4">First Name</label>
                                    <div class="col-lg-6 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeFN" runat="server" class="form-control" required/>
                                        <asp:RegularExpressionValidator ID="fnVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeeFN"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Last Name</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeLN" runat="server" class="form-control"  required/>
                                        <asp:RegularExpressionValidator ID="lnVld" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeeLN"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phone No.</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeePN" runat="server" class="form-control" MaxLength="7" required/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ForeColor="Red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeePN"
                                            ValidationExpression="^[0-9]{7}$"
                                            ErrorMessage="Enter a valid Phone Number" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mobile No.</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeMN" runat="server" class="form-control" MaxLength="11" required/>
                                        <asp:RegularExpressionValidator ID="MblVld" runat="server"
                                            ForeColor="Red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeeMN"
                                            ValidationExpression="^[0-9]{11}$"
                                            ErrorMessage="Enter a valid mobile Number" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Date of Birth</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeBday" class="form-control" TextMode="Date" runat="server"  required/>
                                        <asp:RangeValidator ID="rValidatorBday" runat="server"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txtEmployeeBday"
                                            ErrorMessage="Choose a valid date"
                                            MaximumValue="2017-01-01"
                                            MinimumValue="1900-01-01" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Street</label>
                                    <div class="col-lg-6 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeST" runat="server" class="form-control"  required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Municipality</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeMNCPLTY" runat="server" class="form-control" required />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                            ForeColor="Red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeeMNCPLTY"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid Municipality" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">City</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeCT" runat="server" class="form-control"  required/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                            ForeColor="Red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeeCT"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                            Text="Enter a valid City" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Email Address</label>
                                    <div class="col-lg-6 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployeeEA" runat="server" class="form-control" TextMode="Email" required/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                            ForeColor="red"
                                            Display="Dynamic"
                                            ControlToValidate="txtEmployeeEA"
                                            ErrorMessage="Please enter valid e-mail address"
                                            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Status</label>
                                    <div class="col-lg-4 col-sm-12 col-xs-12"> 
                                        <asp:DropDownList ID="ddlEmployeeStatus" class="form-control" runat="server">
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <div class="col-lg-offset-4 col-lg-8">
                                        <asp:Button ID="btnAddEmployee" runat="server" class="btn btn-primary pull-right" Text="Add Employee"
                                            OnClick="btnAddEmployee_Click" />
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

