<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Articles_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Articles</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="x_panel">
            <div class="x_title">
                <h2>Add articles</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12"></label>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Title</label>
                            <div class="col-lg-8 col-xs-12">
                                <asp:TextBox ID="txtTitle" class="form-control" runat="server" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Summary</label>
                            <div class="col-lg-8 col-xs-12">
                                <asp:TextBox ID="txtSummary" class="form-control" runat="server" TextMode="Multiline"
                                    style="max-width: 100%"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Article Category</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:DropDownList ID="ddlArticleCat" class="form-control" runat="server" required>
                                    <asp:ListItem>Company News</asp:ListItem>
                                    <asp:ListItem>Health News</asp:ListItem>
                                    <asp:ListItem>Services</asp:ListItem>
                                    <asp:ListItem>Careers</asp:ListItem>
                                    <asp:ListItem>Services</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4 col-xs-12">Other category</label>
                            <div class="col-lg-6 col-xs-12">
                                <asp:TextBox ID="txtOthers" class="form-control" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="form-group">
                            <label class="col-lg-12 col-sm-12 col-xs-12">
                                Article Photo
                            </label>
                            <div class="thumbnail col-lg-11 col-xs-12" id="divImgArticle">
                                <asp:HyperLink ID="imgArticlelnk" runat="server" data-lightbox="lbDB">
                                    <asp:Image ID="imgArticle" class="img-responsive" runat="server" />
                                </asp:HyperLink>
                            </div>
                            <div class="col-lg-3 col-xs-12">
                                <asp:FileUpload ID="fileImgArticle" runat="server" class="file" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-lg-12 col-xs-12">
                        <asp:Textbox ID="txtMessage" class="form-control" TextMode="Multiline" 
                            style="max-width: 100%;" runat="server"></asp:Textbox>
                        <br />
                    </div>
                <hr />
                <div class="col-lg-12">
                    <span class="pull-right">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                    </span>
                </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

