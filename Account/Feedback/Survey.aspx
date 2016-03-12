<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="Survey.aspx.cs" Inherits="Account_Feedback_Survey" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>Feedbacks</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="x_panel">
        <div class="x_title">
            <h2>Answer a survey</h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div id="survey" runat="server" class="alert alert-success text-center" visible="false">
                            Thanks for answering the survey!
                        </div>
                        <div id="error" runat="server" class="alert alert-warning text-center" visible="false" style="color: white">
                            The survey pushed through, but there was an error in sending the email notification to you.
                        </div>
                        <asp:Literal ID="txtFirstName" runat="server" Visible="false"></asp:Literal>
                        <asp:Literal ID="txtEmail" runat="server" Visible="false"></asp:Literal>
                        <div class="row">
                            <div class="col-lg-10">
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        1: Lifeline Rescue Inc., service representatives (CSRs) are well trained.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidation"
                                        ControlToValidate="rblSurveyOne"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyOne" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        2: Lifeline Rescue Inc., service representatives (CSRs) are well supervised.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationTwo"
                                        ControlToValidate="rblSurveyOne"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyTwo" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        3: Lifeline Rescue Inc., service representatives (CSRs) adhere to professional standards of conduct.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationThree"
                                        ControlToValidate="rblSurveyThree"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyThree" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        4: Lifeline Rescue Inc., service representatives (CSRs) act in my best interest.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationFour"
                                        ControlToValidate="rblSurveyFour"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyFour" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        5: Overall, I am satisfied with the Lifeline Rescue Inc., service representatives (CSRs).
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationFive"
                                        ControlToValidate="rblSurveyFive"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyFive" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        6: The Lifeline Rescue Inc., account manager is knowledgeable and professional.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationSix"
                                        ControlToValidate="rblSurveySix"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveySix" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        7: The Lifeline Rescue Inc., account manager is making a positive contribution to my business.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationSeven"
                                        ControlToValidate="rblSurveySeven"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveySeven" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        8: The Lifeline Rescue Inc., account manager is making a positive contribution to my business.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationEight"
                                        ControlToValidate="rblSurveyEight"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyEight" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" style="font-size: 15px">
                                        9: Overall, I am very satisfied with the Lifeline Rescue Inc., account manager.
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationNine"
                                        ControlToValidate="rblSurveyNine"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyNine" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group" style="font-size: 15px">
                                    <label class="control-label">
                                        10: Overall, I am very satisfied with the service (general) offered by Lifeline Rescue Inc.,
                                    </label>
                                    <asp:RequiredFieldValidator
                                        runat="server"
                                        ID="ratingValidationTen"
                                        ControlToValidate="rblSurveyTen"
                                        ErrorMessage="Pick a rating">*
                                    </asp:RequiredFieldValidator>
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList ID="rblSurveyTen" RepeatDirection="Horizontal" runat="server" CssClass="cssSurvey" required>
                                            <asp:ListItem>Very Satisfied</asp:ListItem>
                                            <asp:ListItem>Somewhat Satisfed</asp:ListItem>
                                            <asp:ListItem>Neutral</asp:ListItem>
                                            <asp:ListItem>Somewhat Dissatisfied</asp:ListItem>
                                            <asp:ListItem>Very Dissatisfied</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <div class="col-lg-12 col-xs-12">
                                <label class="control-label">
                                    Comments
                                </label>
                                <asp:TextBox ID="txtMessage" Width="100%" Height="100px" runat="server" TextMode="MultiLine"
                                    Style="max-height: 100%; max-width: 100%" />
                            </div>
                        </div>
                        <hr />
                        <div class="col-lg-12">
                            <span>
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                            </span>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>

