<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Account_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Services</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="col-lg-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Services</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <h2>Standard membership/renewal rates of P <b>1,000.00 /year</b> and <b>P 3,000.00 /year</b> for households of four (4) persons.
                </h2>
                <br />
                <ul>
                    <li>24/7 Medical Advisory through Lifeline's dedicated emergency hotline 16-911 or alternative numbers: +63(2) 839-2520 up to 2530.
                    </li><br />
                    <li>Free use of the ambulance during emergencies.
                    </li><br />
                    <li>Free use of lifesaving equipment and supplies during emergencies (excluding cervical collars).
                    </li><br />
                    <li>Full endorsement to the hospital.
                    </li><br />
                    <li>20% Discount on inter-facility transfers (non-emergency patient transport).
                    </li><br />
                    <li>20% Discount on air medical evacuation and airlift services.
                    </li><br />
                    <li>15% Discount on home care services.
                    </li><br />
                    <li>Multi-awarded, world class emergency medical service by way of none (9) fully-equipped ambulances (emergency rooms on wheels), lifesaving equipment (including jaws of life), trunk radio communications and trained personnel.
                    </li><br />
                    <li>Hundreds of doctors on call.
                    </li><br />
                    <li>High quality yet very reasonably priced out-patient medical care through our clinics in Alabang and Makati.
                    </li><br />
                    <li>Partnerships with diagnostic and dental services to provide a full range of procedures.
                    </li>
                </ul><br />
                <p>For other membership schemes, ambulance rentals, site coverage and corporate membership, you send us an inquiry using the button below, or 
                    contact us at +63(2) 839-2520 up to 2530 for a quotation.
                </p>
                <p>
                    <a href="#" data-toggle="modal" data-target="#sendInquiry">
                        <span runat="server" class="btn btn-primary">
                            Send Inquiry
                        </span>
                    </a>
                </p>
            </div>
        </div>
    </div>
    <br />

    <form class="form-horizontal" runat="server">
        <div id="sendInquiry" class="modal fade" role="dialog">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdateProgress ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <div class="modal-dialog">
                <%-- Modal content--%>
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-sign-out"></i>&nbsp;Send Inquiry</h4>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-group">
                                    <div id="issue" runat="server" class="alert alert-success text-center" visible="false">
                                        A customer care representative will reply to you shortly, Thanks!
                                    </div>
                                    <div id="error" runat="server" class="alert alert-warning text-center" visible="false" style="color: white">
                                        The message pushed through, but there was an error in sending the email notification to you.
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="control-label pull-left">First Name</label>
                                                <div class="col-lg-12 col-xs-12">
                                                    <asp:TextBox ID="txtFirstName" class="form-control" runat="server" required />
                                                    <asp:RegularExpressionValidator ID="fnVld" runat="server"
                                                        ForeColor="red"
                                                        Display="Dynamic"
                                                        ControlToValidate="txtFirstName"
                                                        ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                                        Text="Enter a valid name" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label pull-left">Last Name</label>
                                                <div class="col-lg-12 col-xs-12">
                                                    <asp:TextBox ID="txtLastName" class="form-control" runat="server" required />
                                                    <asp:RegularExpressionValidator ID="lnVld" runat="server"
                                                        ForeColor="red"
                                                        Display="Dynamic"
                                                        ControlToValidate="txtLastName"
                                                        ValidationExpression="^[a-zA-Z'.\s]{1,50}"
                                                        Text="Enter a valid name" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label pull-left">Email</label>
                                                <div class="col-lg-12 col-xs-12">
                                                    <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" required />
                                                    <asp:RegularExpressionValidator ID="emlVld" runat="server"
                                                        ForeColor="red"
                                                        Display="Dynamic"
                                                        ControlToValidate="txtEmail"
                                                        ErrorMessage="Please enter valid e-mail address"
                                                        ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label pull-left">Category</label>
                                                <div class="col-lg-12 col-xs-12">
                                                    <asp:TextBox ID="txtCategory" class="form-control" runat="server" disabled>Issues/Inquiries</asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="control-label pull-left">Issue/Inquiry Type</label>
                                                <div class="col-lg-12 col-xs-12">
                                                    <asp:DropDownList ID="ddlMessageCat" runat="server" class="form-control" required>
                                                        <asp:ListItem>General membership inquiry</asp:ListItem>
                                                        <asp:ListItem>Corporate membership inquiry</asp:ListItem>
                                                        <asp:ListItem>Other services inquiry</asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label pull-left">Subject</label>
                                                <div class="col-lg-12 col-xs-12">
                                                    <asp:TextBox ID="txtSubject" class="form-control" runat="server" required />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <hr />
                                    <div class="form-group">
                                        <div class="col-lg-12 col-xs-12">
                                            <label class="control-label">
                                                Message
                                            </label>
                                            <asp:TextBox ID="txtMessage" Width="100%" Height="100px" runat="server" TextMode="MultiLine"
                                                Style="max-height: 100%; max-width: 100%" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="col-lg-12">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Submit Inquiry" runat="server"
                                        OnClick="btnSubmit_Click" />
                                    <br />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

