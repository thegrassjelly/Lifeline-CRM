<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Account_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Welcome!</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="x_panel" id="panelMembership" runat="server" visible="false">
                <div class="x_title">
                    <h2>Current Membership</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-1 col-xs-12">Start Date</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtStartDate" class="form-control" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Total Membership Length</label>
                        <div class="col-lg-1 col-xs-12">
                            <asp:TextBox ID="txtMembershipLength" class="form-control text-center" runat="server" disabled />
                        </div>
                        <label class="col-lg-1 col-xs-12">Year(s)</label>
                        <label class="control-label col-lg-2 col-xs-12">Recent Membership Type</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtMembershipType" class="form-control text-center" runat="server" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-1 col-xs-12">End Date</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtEndDate" class="form-control" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Recent Payment</label>
                        <div class="col-lg-2 text-center">
                            <asp:TextBox ID="txtPayStatus" class="form-control text-center" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Recent Membership Status</label>
                        <div class="col-lg-2 text-center">
                            <asp:TextBox ID="txtMemStatus" class="form-control text-center" runat="server" disabled />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="x_panel" id="panelCorporate" runat="server" visible="false">
                <div class="x_title">
                    <h2>Corporate Membership Info</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="control-label col-lg-1 col-xs-12">Employer Name</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtEmployerName" class="form-control text-center" runat="server" disabled />
                        </div>
                        <label class="control-label col-lg-2 col-xs-12">Total Membership Length</label>
                        <div class="col-lg-1 col-xs-12">
                            <asp:TextBox ID="txtCorporateLength" class="form-control text-center" runat="server" disabled />
                        </div>
                        <label class="col-lg-1 col-xs-12">Year(s)</label>
                        <label class="control-label col-lg-2 col-xs-12">Membership Type</label>
                        <div class="col-lg-2 col-xs-12">
                            <asp:TextBox ID="txtCorporateType" class="form-control text-center" runat="server" disabled />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Articles</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content"> 
                    <asp:ListView ID="lvArticles" runat="server" OnPagePropertiesChanging="lv_PagePropertiesChanging">
                        <ItemTemplate>
                            <h3>
                                <a href="ArticleView.aspx?ID=<%# Eval("ArticleID") %>"><%# Eval("Title") %></a>
                            </h3>
                            <p class="lead">
                                by <%# Eval("LastName") %>, <%# Eval("FirstName") %>
                            </p>
                            <p>Under <%# Eval("ArticleType") %> <%# Eval("Others") %></p>
                            <p><span class="glyphicon glyphicon-time"></span> Posted on <%# Eval("DateSubmitted") %></p>
                            <hr />
                            <img class="img-responsive" src="<%= Page.ResolveUrl("~/articlepics/") %><%# Eval("ArticlePic") %>" alt="" />
                            <hr />
                            <p><%# Eval("Summary") %></p>
                            <a class="btn btn-primary" href="ArticleView.aspx?ID=<%# Eval("ArticleID") %>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                            <hr />
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="text-center">
                        <asp:DataPager ID="lvDataPager" runat="server" PagedControlID="lvArticles" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                                <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-xs-12">
            <div class="well">
                <h4>Blog Categories</h4>
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-unstyled">
                            <li><a href="#">Company News</a>
                            </li>
                            <li><a href="#">Health News</a>
                            </li>
                            <li><a href="#">Services</a>
                            </li>
                            <li><a href="#">Careers</a>
                            </li>
                            <li><a href="#">Others</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

