<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Account_Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>My Profile</h3>
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
                        url: "Profile.aspx/SearchCity",
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
        <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Personal Information</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div id="profile" runat="server" class="alert alert-success text-center" visible="false">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            Profile updated.
                        </div>
                        <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            Email Address already exist.
                        </div>
                        <div id="fsizeError" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            The image file size is larger than the maximum accepted.
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
                                            <asp:HyperLink ID="imgUserLb" runat="server" data-lightbox="lbDB">
                                                <asp:Image ID="imgUser" class="img-responsive" runat="server" />
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-lg-offset-4 col-sm-12 col-xs-12">
                                        <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                                        <asp:RegularExpressionValidator runat="server" 
                                            ForeColor="Red"
                                            ErrorMessage="Only picture files are allowed" 
                                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.gif|.GIF|.jpg|.JPG|.jpeg|.JPEG|.png)$" 
                                            ControlToValidate="usrPicUpload" 
                                            Display="Dynamic" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label col-lg-12">Account Status</label>
                                    <div class="col-lg-4 col-lg-offset-8 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtStatus" runat="server" class="form-control text-center" disabled />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-12">Account Type</label>
                                    <div class="col-lg-4 col-lg-offset-8 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtType" runat="server" class="form-control text-center" disabled />
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
                                    <label class="control-label col-lg-4">Area Code</label>
                                    <div class="col-lg-2 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtAreaCode" runat="server" class="form-control" MaxLength="3" />
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
                                    <label class="control-label col-lg-4">Extension</label>
                                    <div class="col-lg-3 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtExt" runat="server" class="form-control" MaxLength="4" />
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

                                <div id="employererror" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Invalid Employer Code
                                </div>
                                <div id="employercorrect" runat="server" class="alert alert-success text-center" visible="false" style="color: white">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Employer Added
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Employer Code</label>
                                    <div class="col-lg-5 col-sm-12 col-xs-12">
                                        <asp:TextBox ID="txtEmployerCode" runat="server" class="form-control" MaxLength="8" />
                                        <br />
                                        <asp:Button ID="btnAddEmployer" runat="server" class="btn btn-primary pull-right" Text="Submit" OnClick="btnAddEmployer_Click" />
                                    </div>
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Sent Messages</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="form-group pull-left">
                            <label class="control-label col-lg-4 col-xs-12">Sort By</label>
                            <div class="col-lg-8 col-xs-12">
                                <asp:DropDownList ID="ddlSortBy" runat="server" class="form-control"
                                    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"
                                    AutoPostBack="true">
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
                                    OnSelectedIndexChanged="ddlDirection_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="ASC">Ascending</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="DESC">Descending</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <table class="table table-striped projects">
                            <thead>
                                <th>Category</th>
                                <th>Message Category</th>
                                <th>Subject</th>
                                <th>Date Submitted</th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvUserMessage" runat="server"
                                    OnPagePropertiesChanging="lv_PagePropertiesChanging">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <button type="button" class="btn btn-success btn-xs">
                                                    <%# Eval("Category") %>
                                                </button>
                                            </td>
                                            <td>
                                                <%# Eval("MessageCat") %> 
                                            </td>
                                            <td>
                                                <%# Eval("Subject") %>
                                            </td>
                                            <td><%# Eval("DateSubmitted", "{0: MMMM dd, yyyy}") %></td>
                                            <td>
                                                <a href='MessageDetails.aspx?ID=<%# Eval("MessageID") %>'>
                                                    <button type="button" class="btn btn-primary btn-xs">
                                                        <i class="fa fa-folder"></i>Message details
                                                    </button>
                                                </a>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

