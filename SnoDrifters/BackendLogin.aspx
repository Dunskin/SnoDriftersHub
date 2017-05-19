<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackendLogin.aspx.cs" Inherits="SnoDrifters.BackendLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

<h2>Login Form</h2>

<form runat="server">
  <div class="imgcontainer">
    <img src="img/SnoDrifters/MJSNOWGUY.png" alt="Avatar" class="avatar"/>
  </div>

  <div class="container">
    <label><b>Username</b></label>
    <asp:TextBox runat="server" id="userName"></asp:TextBox>

    <label><b>Password</b></label>
    <asp:TextBox runat="server" id="passWord" textmode="Password"></asp:TextBox>    
        
    <asp:button type="submit" id="loginButton" runat="server" Text="Login" OnClick="loginButton_Click"/>
  </div>
  
  
</form>

</body>
</html>
