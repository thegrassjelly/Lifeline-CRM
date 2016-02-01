<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="ArticleView.aspx.cs" Inherits="Account_ArticleView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Article</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_content">
                <div class="col-lg-8">

                    <!-- Blog Post -->

                    <!-- Title -->
                    <h1><asp:Literal ID="ltTitle" runat="server"/></h1>

                    <!-- Author -->
                    <p class="lead">
                        by <asp:Literal ID="ltLN" runat="server"/>, <asp:Literal ID="ltFN" runat="server"/>
                    </p>
                    <p>Under <asp:Literal ID="ltArticleType" runat="server"/> <asp:Literal ID="ltOthers" runat="server"/></p>
                    <hr>

                    <!-- Date/Time -->
                    <p>
                        <span class="glyphicon glyphicon-time"></span> Posted on <asp:Literal ID="ltDateSubmitted" runat="server"/>
                    </p>

                    <hr>

                    <!-- Preview Image -->
                    <asp:HyperLink ID="imgArticleLink" runat="server" data-lightbox="lbDB">
                        <asp:Image ID="imgArticlePic" class="img-responsive" runat="server" />
                    </asp:HyperLink>
                    <hr>

                    <!-- Post Content -->
                    <p class="lead"><asp:Literal ID="ltSummary" runat="server"/></p>
                    <p><asp:Literal ID="ltBody" runat="server"/></p>
                    <hr />
                        <div id="fbdiv" class="fb-comments" runat="server" data-href="" data-width="668" data-numposts="5"></div>
                    <hr />
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
                    </div>
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
                    <div class="well">
                        <h4>Lifeline Ambulance Rescue</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

