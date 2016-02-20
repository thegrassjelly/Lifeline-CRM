<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form runat="server">
    <div class="row tile_count">
        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
                <a href='<%= Page.ResolveUrl("~/Admin/Users/View.aspx") %>'>
                    <span class="count_top"><i class="fa fa-user"></i>Total Users</span>
                    <div class="count">
                        <asp:Literal ID="ltUserCount" runat="server" /></div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>
                        <asp:Literal ID="ltUserNew" runat="server" /></i>last 24 hours</span>
                </a>
            </div>
        </div>
        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
                <a href='<%= Page.ResolveUrl("~/Admin/Users/Verification.aspx") %>'>
                    <span class="count_top"><i class="fa fa-check"></i>Membership Verifications</span>
                    <div class="count">
                        <asp:Literal ID="ltVerification" runat="server" /></div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>
                        <asp:Literal ID="ltVerificationNew" runat="server" />
                    </i>last 24 hours</span>
                </a>
            </div>
        </div>
        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
                <a href='<%= Page.ResolveUrl("~/Admin/Membership/Renewals.aspx") %>'>
                    <span class="count_top"><i class="fa fa-suitcase"></i>New Renewals</span>
                    <div class="count">
                        <asp:Literal ID="ltRenewals" runat="server" /></div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>
                        <asp:Literal ID="ltRenewalsNew" runat="server" />
                    </i>last 24 hours</span>
                </a>
            </div>
        </div>
        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
                <a href='<%= Page.ResolveUrl("~/Admin/Membership/MembershipApplications.aspx") %>'>
                    <span class="count_top"><i class="fa fa-suitcase"></i>Membership Applications</span>
                    <div class="count">
                        <asp:Literal ID="ltMembership" runat="server" /></div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>
                        <asp:Literal ID="ltMembershipNew" runat="server" />
                    </i>last 24 hours</span>
                </a>
            </div>
        </div>
        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
                    <span class="count_top"><i class="fa fa-inbox"></i>Total Unread Messages</span>
                    <div class="count">
                        <asp:Literal ID="ltUnreadMsg" runat="server" /></div>
                    <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>
                        <asp:Literal ID="ltUnreadNew" runat="server" />
                    </i>last 24 hours</span>
            </div>
        </div>
        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
                <span class="count_top"><i class="fa fa-bank"></i> Total Logs</span>
                <div class="count"><asp:Literal ID="ltLogs" runat="server"/></div>
                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i><asp:Literal ID="ltLogsNew" runat="server"/> </i> last 24 hours</span>
            </div>
        </div>
        </div>
    <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Recent Message</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <asp:ListView ID="lvMessages" runat="server">
                        <ItemTemplate>
                            <div class="dashboard-widget-content">
                                <ul class="list-unstyled timeline widget">
                                    <li>
                                        <div class="block">
                                            <div class="block_content">
                                                <h2 class="title">
                                                    <a><%# Eval("Category") %></a>
                                                </h2>
                                                <div class="byline">
                                                    <span><%# Eval("DateSubmitted") %></span> by <a><%# Eval("LastName") %>, <%# Eval("FirstName") %></a>
                                                </div>
                                                <div class="byline">
                                                    <span><%# Eval("Subject") %></span>
                                                </div>
                                                <p class="excerpt">
                                                    <%# Eval("Message") %> 
                                                <br/><br/><a href="<%= Page.ResolveUrl("~/Admin/Feedback/ViewFeedback.aspx") %>">Read&nbsp;More</a>
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-8 col-xs-12">
            <div class="tile-stats">
                <div class="icon">
                    <i class="fa fa-bank"></i>
                </div>
                <div class="count"><asp:Literal ID="ltDeposit24Hrs" runat="server"></asp:Literal></div>
                <br/>
                <h3>Total Renewal Deposits</h3>
                <p>Verified Deposits for the last 24 Hours</p>
                <p>From <asp:Literal ID="ltDeposit24HrsTime" runat="server"></asp:Literal></p>
            </div>
        </div>
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-8 col-xs-12">
            <div class="tile-stats">
                <div class="icon">
                    <i class="fa fa-bank"></i>
                </div>
                <div class="count"><asp:Literal ID="ltDeposit30Days" runat="server"></asp:Literal></div>
                <br />
                <h3>Total Renewal Deposits</h3>
                <p>Verified Deposits for the last 30 Days</p>
                <p>From <asp:Literal ID="ltDeposit30DaysTime" runat="server"></asp:Literal></p>
            </div>
        </div>
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-8 col-xs-12">
            <div class="tile-stats">
                <div class="icon">
                    <i class="fa fa-building-o"></i>
                </div>
                <div class="count"><asp:Literal ID="ltCorporatePayments" runat="server"></asp:Literal></div>
                <br />
                <h3>Corporate Membership Payments</h3>
                <p>Payments for the last 30 Days</p>
                 <p>From <asp:Literal ID="ltCorporate30DaysOne" runat="server"></asp:Literal></p>
            </div>
        </div>
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-8 col-xs-12">
            <div class="tile-stats">
                <div class="icon">
                    <i class="fa fa-building-o"></i>
                </div>
                <div class="count"><asp:Literal ID="ltCorporateBalance" runat="server"></asp:Literal></div>
                <br />
                <h3>Corporate Membership Balance</h3>
                <p>Sum of payables in 30 Days</p>
                <p>From <asp:Literal ID="ltCorporate30DaysTwo" runat="server"></asp:Literal></p>
            </div>
        </div>
    <div class="col-md-8 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Membership Renewals</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div>
                    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                    <asp:Literal ID="ltRenewalChart" runat="server"></asp:Literal>
                    <div id="chart_div" style="width: 600px; height: 250px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Membership Composition</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div>
                    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                    <asp:Literal ID="ltRenewalComposition" runat="server"></asp:Literal>
                    <div id="piechart_renewal" style="width: 300px; height: 200px;">  
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>User Composition</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div>
                    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                    <asp:GridView ID="gvUserComposition" runat="server"></asp:GridView>
                    <asp:Literal ID="ltUserComposition" runat="server"></asp:Literal>
                    <div id="piechart_user" style="width: 300px; height: 200px;">  
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</asp:Content>

