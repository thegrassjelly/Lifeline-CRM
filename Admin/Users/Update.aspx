<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Admin_Users_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>User Management</h3>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });

        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Update.aspx/SearchCity",
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
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true" />
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>User Details</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="profile" runat="server" class="alert alert-success text-center" visible="false">
                        Profile updated.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-sm-12 col-xs-12">Profile picture</label>
                        <div class="col-lg-8">
                            <div class="thumbnail" id="usrPic">
                                <asp:HyperLink ID="imgUserLb" runat="server" data-lightbox="lbDB">
                                    <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                </asp:HyperLink>
                            </div>
                        </div>
                        <div class="col-lg-8 col-lg-offset-4 col-sm-12 col-xs-12">
                            <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                        </div>
                    </div>
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
                        <div class="col-lg-5 col-sm-12 col-xs-12">
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
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="8" />
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
                        <div class="col-lg-4 col-sm-12 col-xs-12">
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
                    <div class="form-group">
                        <label class="control-label col-lg-4">Street</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
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
                    <hr />
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
                    <div class="form-group">
                        <label class="control-label col-lg-4">Priority</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlPriority" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem>Normal</asp:ListItem>
                                <asp:ListItem>Contact Immediately</asp:ListItem>
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
                    <h2>Secondary Contact(s)</h2>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="x_content">
                    <table class="table table-striped projects">
                        <thead>
                            <th>Contact ID</th>
                            <th>Name</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvSecondaryContact" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("SecondaryContactID") %></td>
                                        <td><%# Eval("LastName") %>, <%# Eval("FirstName") %></td>
                                        <td>
                                            <a href='ViewSecondaryContact.aspx?ID=<%# Eval("SecondaryContactID") %>' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>Details</a>
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
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Medical Information</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="medicalinfo" runat="server" class="alert alert-success text-center" visible="false">
                        Profile updated.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Blood Type</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlBloodType" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>AB</asp:ListItem>
                                <asp:ListItem>O</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Allergies</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtAllergies" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">History of cancer in the family</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlCancerHis" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">History of heart disease in the family</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlHeartHis" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">History of asthma</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlAsthmaHis" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">History of epilepsy</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlEpilepsyHis" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">History of liver disease</label>
                        <div class="col-lg-3 col-sm-12 col-xs-12">
                            <asp:DropDownList ID="ddlLiverHis" class="form-control" runat="server" data-toggle="tooltip">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Others</label>
                        <div class="col-lg-7 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtOthers" runat="server" class="form-control" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Add Employer</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="employererror" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                        Invalid Employer Code
                    </div>
                    <div id="employercorrect" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                        Employer Added
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Employer Code</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtEmployerCode" runat="server" class="form-control" MaxLength="8" />
                        </div>
                    </div>
                    <hr />
                    <asp:Button ID="btnAddEmployer" runat="server" class="btn btn-primary pull-right" Text="Submit"
                        OnClick="btnAddEmployer_Click" />
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
                            <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update Info"
                                OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnPrint" runat="server" class="btn btn-primary pull-right" Text="Print user report"
                                OnClick="btnPrint_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>User Messages</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="form-group pull-left">
                                <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                                <div class="col-lg-8 col-xs-12">
                                    <asp:DropDownList ID="ddlSortBy" runat="server" class="form-control"
                                        OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Selected="True" Value="MessageID">ID</asp:ListItem>
                                        <asp:ListItem Value="MessageCat">Category</asp:ListItem>
                                        <asp:ListItem>Subject</asp:ListItem>
                                        <asp:ListItem Value="DateSubmitted">Date Submitted</asp:ListItem>
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
                            <table class="table table-striped projects">
                                <thead>
                                    <th>ID</th>
                                    <th>Category</th>
                                    <th>Message Category</th>
                                    <th>Subject</th>
                                    <th>Date Submitted</th>
                                    <th>Status</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lvUserMessage" runat="server" OnPagePropertiesChanging="lv_PagePropertiesChanging">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("MessageID") %></td>
                                                <td>
                                                    <button type="button" class="btn btn-info btn-xs"><%# Eval("Category") %></button>
                                                </td>
                                                <td>
                                                    <%# Eval("MessageCat") %>
                                                </td>
                                                <td>
                                                    <%# Eval("Subject") %>
                                                </td>
                                                <td><%# Eval("DateSubmitted", "{0: MMMM dd, yyyy}") %></td>
                                                <td>
                                                    <button runat="server" type="button"
                                                        class='<%# Eval("Status").ToString() == "Read" ?
                                                    "btn btn-success btn-xs" : "btn btn-danger btn-xs" %>'>
                                                        <%# Eval("Status") %>
                                                    </button>
                                                </td>
                                                <td>
                                                    <a href='MessageDetails.aspx?ID=<%# Eval("MessageID") %>' class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Message details </a>
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
                                <asp:DataPager ID="lvDataPager" runat="server" PagedControlID="lvUserMessage" PageSize="5">
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
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>User Renewals</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="form-group pull-left">
                                <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                                <div class="col-lg-8 col-xs-12">
                                    <asp:DropDownList ID="ddlRenewalCategory" runat="server" class="form-control"
                                        OnSelectedIndexChanged="ddlRenewalCategory_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Selected="True" Value="MembershipID">ID</asp:ListItem>
                                        <asp:ListItem Value="Type">Membership Type</asp:ListItem>
                                        <asp:ListItem>Length</asp:ListItem>
                                        <asp:ListItem Value="StartDate">Start Date</asp:ListItem>
                                        <asp:ListItem Value="EndDate">End Date</asp:ListItem>
                                        <asp:ListItem Value="MembershipStatus">Membership Status</asp:ListItem>
                                        <asp:ListItem Value="PaymentStatus">Payment Status</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group pull-left">
                                <label class="control-label col-lg-4 col-xs-12">Direction</label>
                                <div class="col-lg-8 col-xs-12">
                                    <asp:DropDownList ID="ddlRenewalDirection" runat="server" class="form-control"
                                        OnSelectedIndexChanged="ddlRenewalDirection_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="ASC">Ascending</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="DESC">Descending</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <hr />
                                <table class="table table-striped projects">
                                    <thead>
                                        <th>Membership ID</th>
                                        <th>Membership Type</th>
                                        <th>Length</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Membership Status</th>
                                        <th>Payment Status</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lvUserRenewals" runat="server" OnPagePropertiesChanging="lvRenewals_PagePropertiesChanging">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("MembershipID") %>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-info btn-xs"><%# Eval("Type") %></button>
                                                    </td>
                                                    <td>
                                                        <%# Eval("Length") %> Year(s)
                                                    </td>
                                                    <td>
                                                        <%# Eval("StartDate", "{0: MMMM dd, yyyy}") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("EndDate", "{0: MMMM dd, yyyy}") %>
                                                    </td>
                                                    <td>
                                                        <button runat="server" type="button"
                                                            class='<%# Eval("MembershipStatus").ToString() == "Active" ?
                                                    "btn btn-success btn-xs" : "btn btn-danger btn-xs" %>'>
                                                            <%# Eval("MembershipStatus") %>
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <button runat="server" type="button"
                                                            class='<%# Eval("PaymentStatus").ToString() == "Paid" ?
                                                    "btn btn-success btn-xs" : "btn btn-danger btn-xs" %>'>
                                                            <%# Eval("PaymentStatus") %>
                                                        </button>
                                                    </td>
                                                    <td>
                                                        <a href='<%= Page.ResolveUrl("~/Admin/Membership/RenewalDetails.aspx?ID=") %>
                                                    <%# Eval("MembershipID") %>'
                                                            class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Details </a>
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
                                    <asp:DataPager ID="lvRenewalPager" runat="server" PagedControlID="lvUserRenewals" PageSize="5">
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
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

