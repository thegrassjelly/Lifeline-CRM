<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Admin_Articles_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Articles</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
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
                                <a href="ArticleSingle.aspx?ID=<%# Eval("ArticleID") %>"><%# Eval("Title") %></a>
                            </h3>
                            <p class="lead">
                                by <a href="index.php"><%# Eval("LastName") %>, <%# Eval("FirstName") %></a>
                            </p>
                            <p>Under <%# Eval("ArticleType") %> <%# Eval("Others") %></p>
                            <p><span class="glyphicon glyphicon-time"></span> Posted on <%# Eval("DateSubmitted") %></p>
                            <hr />
                            <img class="img-responsive" src="<%= Page.ResolveUrl("~/articlepics/") %><%# Eval("ArticlePic") %>" alt="" />
                            <hr />
                            <p><%# Eval("Summary") %></p>
                            <a class="btn btn-primary" href="ArticleSingle.aspx?ID=<%# Eval("ArticleID") %>">Update <span class="glyphicon glyphicon-chevron-right"></span></a>
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
                <h4>Blog Search</h4>
                <div class="input-group">
                    <input type="text" class="form-control" />
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
                <!-- /.input-group -->
            </div>

            <!-- Blog Categories Well -->
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
                    <!-- /.col-lg-6 -->
                </div>
                <!-- /.row -->
            </div>

            <!-- Side Widget Well -->
            <div class="well">
                <h4>Widget</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
            </div>
        </div>
    </form>
</asp:Content>

