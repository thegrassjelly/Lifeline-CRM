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
                <div id="survey" runat="server" class="alert alert-success text-center" visible="false">
                    Thanks for answering the survey!
                </div>
                <asp:Literal ID="txtFirstName" runat="server" Visible="false"></asp:Literal>
                <asp:Literal ID="txtEmail" runat="server" Visible="false"></asp:Literal>
                <div class="row">
                    <div class="col-lg-10">
                        <div class="form-group">
                            <label class="control-label">
                                Survey 1: Heyah
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
                            <label class="control-label">
                                Survey 2
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
                            <label class="control-label">
                                Survey 3
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
                            <label class="control-label">
                                Survey 4
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
                            <label class="control-label">
                                Survey 5
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
                            <label class="control-label">
                                Survey 6
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
                            <label class="control-label">
                                Survey 7
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
                            <label class="control-label">
                                Survey 8
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
                            <label class="control-label">
                                Survey 9
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
                        <div class="form-group">
                            <label class="control-label">
                                Survey 10
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
                            style="max-height: 100%; max-width: 100%"/>
                    </div>
                </div>
                <hr />
                <div class="col-lg-12">
                    <span>
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                    </span>
                </div>
            </form>
        </div>
    </div>
</asp:Content>

