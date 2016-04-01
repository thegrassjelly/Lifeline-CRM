<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="MembershipApplication.aspx.cs" Inherits="Account_ClientForms_MembershipApplication" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h3>Membership Application Form</h3>
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
                        url: "MembershipApplication.aspx/SearchCity",
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
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Billing Information</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="db_error" runat="server" class="alert alert-danger text-center" visible="false"
                        style="color: white;">
                        Membership Application submission was not successful, try again later.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">First Name</label>
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control" MaxLength="80" required />
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
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control" MaxLength="80" required />
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
                        <label class="control-label col-lg-4">Mobile No.</label>
                        <div class="col-lg-4 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="11" required />
                            <asp:RegularExpressionValidator ID="MblVld" runat="server"
                                ForeColor="Red"
                                Display="Dynamic"
                                ControlToValidate="txtMobile"
                                ValidationExpression="^[0-9]{11}$"
                                ErrorMessage="Enter a valid Mobile Number" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Date of Birth</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtBday" class="form-control" runat="server" TextMode="date" />
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
                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Municipality</label>
                        <div class="col-lg-5 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" required />
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
                            <asp:TextBox ID="txtCity" runat="server" class="form-control autosuggest" required />
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
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" MaxLength="80" required />
                            <asp:RegularExpressionValidator ID="emlVld" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Please enter valid e-mail address"
                                ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Membership Type</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:DropDownList ID="ddlMembershiptype" runat="server" class="form-control"
                                data-toggle="tooltip"
                                title="Individual: P 1,000.00 /year, Household: P 3,000.00 /year" required>
                                <asp:ListItem>Individual</asp:ListItem>
                                <asp:ListItem>Household</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                    <div id="error" runat="server" class="alert alert-danger text-center" visible="false" style="color: white">
                        Invalid password.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Enter your password</label>
                        <div class="col-lg-7 col-xs-12">
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" required />
                        </div>
                    </div>
                    <hr />
                    <label class="control-label col-lg-10 col-xs-12">
                        Please verify that all the information above is correct<br />
                    </label>
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
                                <asp:ListItem>A +</asp:ListItem>
                                <asp:ListItem>B +</asp:ListItem>
                                <asp:ListItem>AB +</asp:ListItem>
                                <asp:ListItem>O +</asp:ListItem>
                                <asp:ListItem>A -</asp:ListItem>
                                <asp:ListItem>B -</asp:ListItem>
                                <asp:ListItem>AB -</asp:ListItem>
                                <asp:ListItem>O -</asp:ListItem>
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
                            <asp:RegularExpressionValidator ID="OthVld" runat="server"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtOthers"
                                ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                Text="Enter a value" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Membership terms and agreement</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <asp:Panel runat="server" ScrollBars="vertical" Height="350px">
                        1. Lifeline offers membership to its Emergency Quick Response (EQR) Program to Metro Manila residents.
                        <br />
                        <br />
                        2. A membership enrollment form/clinical data sheet must be filled up and submitted to the Lifeline office with the corresponding membership fee.
                        The data will be used during any medical intervention involving the member.
                        <br />
                        <br />
                        3. Effectivity of membership starts upon receipt of payment of membership fee.
                        <br />
                        <br />
                        4. Membership provides free access to Lifeline's emergency medical service and covers only the period during which the member is attended to by the
                        Lifeline medical and nursing staff and its ambulance. Coverage ends upon proper endorsement to the emergency room of the receiving hospital.
                        <br />
                        <br />
                        5. The EQR can be reached and put into action by dialing the special access telephone numbers: 16-911 or 839 2520 to 30.
                        <br />
                        <br />
                        6. All legal actions brought against Lifeline in connection with this contract must be received within two (2) years from the date of the event which gave
                        rise to said legal action.
                        <br />
                        <br />
                        7. Lifeline will not be held responsible for failure to provide services or for delays caused by force majeure such as, but not limited to, natural disasters,
                        strikes or other conditions beyond its control. All claims arising under the agreement shall be vested exclusively in the courts of Parañaque City,
                        Metro Manila.
                        <br />
                        <br />
                        8. Lifeline has the right to be subrogated up to the amount of the service it has provided to the rights and causes of action of the member(s) of any party
                        responsible for acts which gave rise to injury or illness for whom Lifeline renders assistance.
                        <br />
                        <br />
                        9. The member hereby grants full authority to the Lifeline staff to do and execute any and all acts deemed proper for his/her best interests.<br />
                        <br />
                    </asp:Panel>
                    <hr />
                    <div class="form-group">
                        <label class="col-lg-12">
                            <asp:CheckBox ID="cboTerms" runat="server" required />&nbsp;
                            I agree with the terms and agreement as stated above, and that all the
                                information provided is correct.
                        </label>
                        <div class="col-lg-5">
                        </div>
                    </div>
                    <hr />
                    <div class="col-lg-12">
                        <span class="pull-right">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Next"
                                OnClick="btnSubmit_Click" OnClientClick="return validate()" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

