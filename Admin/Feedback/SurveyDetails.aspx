<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="SurveyDetails.aspx.cs" Inherits="Admin_Feedback_SurveyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Survey Details</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtFirstName" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtLastName" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Email</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Date Submitted</label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtDate" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #1</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ1" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #2</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ2" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #3</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ3" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #4</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ4" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #5</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ5" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #6</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ6" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #7</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ7" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #8</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ8" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #9</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ9" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Question #10</label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtQ10" class="form-control" runat="server" disabled />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <h3>Survey Questions</h3>
                <p style="font-size: 14px">
                    1: Lifeline Rescue Inc., service representatives (CSRs) are well trained.
                </p>
                <p style="font-size: 14px">
                    2: Lifeline Rescue Inc., service representatives (CSRs) are well supervised.
                </p>
                <p style="font-size: 14px">
                    3: Lifeline Rescue Inc., service representatives (CSRs) adhere to professional standards of conduct.
                </p>
                <p style="font-size: 14px">
                    4: Lifeline Rescue Inc., service representatives (CSRs) act in my best interest.
                </p>
                <p style="font-size: 14px">
                    5: Overall, I am satisfied with the Lifeline Rescue Inc., service representatives (CSRs).
                </p>
                <p style="font-size: 14px">
                    6: The Lifeline Rescue Inc., account manager is knowledgeable and professional.
                </p>
                <p style="font-size: 14px">
                    7: The Lifeline Rescue Inc., account manager is making a positive contribution to my business.
                </p>
                <p style="font-size: 14px">
                    8: The Lifeline Rescue Inc., account manager is making a positive contribution to my business.
                </p>
                <p style="font-size: 14px">
                    9: Overall, I am very satisfied with the Lifeline Rescue Inc., account manager.
                </p>
                <p style="font-size: 14px">
                    10: Overall, I am very satisfied with the service (general) offered by Lifeline Rescue Inc.,
                </p>
                <hr />
                <div class="form-group">
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtMessage" Width="100%" Height="100" TextMode="Multiline" runat="server" 
                            style="max-width: 100%" disabled />
                    </div>
                </div>
                <hr />
            </form>
        </div>
    </div>
</asp:Content>

