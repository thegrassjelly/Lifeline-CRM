<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="UpdateHospital.aspx.cs" Inherits="Admin_Operations_UpdateHospital" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Operations</h3>
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
                        url: "UpdateHospital.aspx/SearchCity",
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
        <div class="x_panel">
            <div class="x_title">
                <h2>Update Hospital</h2>
                <div class="clearfix"></div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="control-label col-lg-4">Hospital Name</label>
                    <div class="col-lg-6 col-sm-12 col-xs-12">
                        <asp:TextBox ID="txtHospital" runat="server" class="form-control" MaxLength="80" required />
                        <asp:RegularExpressionValidator ID="nmVld" runat="server"
                            ForeColor="red"
                            Display="Dynamic"
                            ControlToValidate="txtHospital"
                            ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                            Text="Enter a valid name" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Address</label>
                    <div class="col-lg-7 col-sm-12 col-xs-12">
                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="100" required />
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
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Update"
                            OnClick="btnUpdate_Click" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </form>
</asp:Content>

