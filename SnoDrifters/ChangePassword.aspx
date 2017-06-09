<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SnoDrifters.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label ID="usernameLabel" runat="server" Text="Enter Username: "></asp:Label>
    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="oldpasswordLabel" runat="server" Text="Enter Old Password: "></asp:Label>
    <asp:TextBox ID="OldPassword" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="newpasswordLabel" runat="server" Text="Enter New Password: "></asp:Label>
    <asp:TextBox ID="NewPassword" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="newpasswordLabel2" runat="server" Text="Confirm New Password: "></asp:Label>
    <asp:TextBox ID="NewPasswordConfirmed" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="PasswordButton" runat="server" Text="Change" OnClick="PasswordButton_Click" />
</asp:Content>
