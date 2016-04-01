<%@ Page Title="" Language="C#" MasterPageFile="~/Account/customer.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Account_ChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <h3>My Profile</h3>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Change Password</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="x_content">
                            <div id="changepass" runat="server" class="alert alert-success text-center" visible="false">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Password Changed.
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Password</label>
                                <div class="col-lg-7">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" MaxLength="20"
                                        TextMode="Password" required />
                                    <ajaxToolkit:PasswordStrength ID="ajaxPwd" runat="server"
                                        TargetControlID="txtPassword"
                                        DisplayPosition="BelowRight"
                                        StrengthIndicatorType="Text"
                                        PreferredPasswordLength="10"
                                        PrefixText="Strength: "
                                        HelpStatusLabelID="TextBox1_HelpLabel"
                                        TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent"
                                        StrengthStyles="TextIndicator_TextBox1_Strength1;TextIndicator_TextBox1_Strength2;TextIndicator_TextBox1_Strength3;TextIndicator_TextBox1_Strength4;TextIndicator_TextBox1_Strength5"
                                        MinimumNumericCharacters="0"
                                        MinimumSymbolCharacters="0"
                                        RequiresUpperAndLowerCaseCharacters="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Repeat Password</label>
                                <div class="col-lg-7">
                                    <asp:TextBox ID="txtPassword2" runat="server" class="form-control" MaxLength="20"
                                        TextMode="Password" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <asp:CompareValidator ID="cmprPwd" runat="server" CssClass="pull-right"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToCompare="txtPassword"
                                        ControlToValidate="txtPassword2"
                                        ErrorMessage="Passwords do not match" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary pull-right" Text="Change Password"
                                        OnClick="btnUpdate_Click" />
                                </div>
                            </div>
                        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

