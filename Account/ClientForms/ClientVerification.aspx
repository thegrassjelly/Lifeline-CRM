<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="ClientVerification.aspx.cs" Inherits="Account_ClientForms_PendingClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Client Forms</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Client Verification Request Form</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="verify" runat="server" class="alert alert-success text-center" visible="false"
                        style="color: white;">
                        Verification Sent. Please wait for further instructions.
                    </div>
                    <div id="verify_error" runat="server" class="alert alert-danger text-center" visible="false"
                        style="color: white;">
                        Verification Not Sent. Try again later.
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">First Name</label>
                        <div class="col-lg-6 col-xs-12">
                            <asp:TextBox ID="txtFN" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Last Name</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:TextBox ID="txtLN" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Date of Birth</label>
                        <div class="col-lg-8 col-sm-12 col-xs-12">
                            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                            <telerik:RadDatePicker ID="txtBday" runat="server" class="form-control"></telerik:RadDatePicker>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Street</label>
                        <div class="col-lg-8 col-xs-12">
                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Municipality</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:TextBox ID="txtMunicipality" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">City</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:TextBox ID="txtCity" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Phone No.</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:TextBox ID="txtPhone" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Mobile No.</label>
                        <div class="col-lg-5 col-xs-12">
                            <asp:TextBox ID="txtMobile" runat="server" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4 col-xs-12">Email Address</label>
                        <div class="col-lg-7 col-xs-12">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" required />
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
                    <h2>Personal Information Verification</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="form-group">
                        <label class="col-lg-12 col-sm-12 col-xs-12">
                            Upload a scanned copy of your valid ID (Government / Company Issued) 
                        </label>
                        <div class="col-lg-12">
                            <br />
                            <asp:FileUpload ID="usrIdUpload" runat="server" class="file" required />
                        </div>
                    </div>
                </div>
                <hr />
            </div>
        </div>
        <div class="col-lg-6">
            <div class="x_panel">
                <div class="x_title">
                    <h2>List of valid ID's for submission</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <asp:Panel runat="server" ScrollBars="vertical" Height="247px">
                        1. Police Clearance<br />
                        2. Postal ID<br />
                        3. Voter’s ID<br />
                        4. Tax Identification Number<br />
                        5. Barangay Certification<br />
                        6. Government Service Insurance System (GSIS) E-card<br />
                        7. Certification from the National Council for the Welfare of Disabled Persons (NCWDP)<br />
                        8. Department of Social Welfare and Development (DSWD) Certification<br />
                        9. Integrated Bar of the Philippines ID<br />
                        10. Social Security System<br />
                        11. Senior Citizen Card<br />
                        12. Overseas Workers Welfare Administration<br />
                        13. Seaman’s Book<br />
                        14. Alien Certification of Registration/Immigrant Certificate of Registration<br />
                        15. Government Office and GOCC ID e.g Armed Forces of the Philippines (AFP ID), Home Development Mutual Fund (HDMF ID)<br />
                        16. ID Issued by the National Council on Disability Affairs (NCDA);<br />
                        17. Company ID’s issued by private entities or institutions registered with or supervised or Regulated either by the BSP, SEC or IC; and<br />
                        18. Philhealth Health Insurance Card ng Bayan<br />
                    </asp:Panel>
                    <hr />
                </div>
            </div>
        </div>
        <div class="col-lg-l2">
            <div class="x_panel">
                <div class="x_title"></div>
                <div class="x_content">
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary pull-right" Text="Submit"
                                OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure?')" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

