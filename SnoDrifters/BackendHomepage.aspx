<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackendHomepage.aspx.cs" Inherits="SnoDrifters.BackendHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>WELCOME</h1>
        <asp:Button runat="server" ID="LogoutButton" Text="Logout" OnClick="LogoutButton_Click"/>
    </div>
    </form>
</body>
</html>
