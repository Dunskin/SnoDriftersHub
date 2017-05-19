<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ownerlogin.aspx.cs" Inherits="Website.ownerlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<link rel="icon" 
      type="image/png" 
      href="favicon.ico">
<script runat="server">
  void Logon_Click(object sender, EventArgs e)
  {
    if ((Username.Text == "snodrifters") && 
            (UserPass.Text == "est1969"))
      {
          Session["status"] = "valid";
          FormsAuthentication.RedirectFromLoginPage
              
             (Username.Text, Persist.Checked);
      }
      else
      {
          Msg.Text = "Invalid credentials. Please try again.";
      }
  }
</script>
<html>
<head id="Head1" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 267px;
        }
    </style>
  <title>Snodrifters Log in</title>
</head>
<body>

  <form id="form1" runat="server">
      <div>
        <body style="background: #b2adad url(images/bg01.png) repeat;">
        <div id="header" class="container">
	<div id="logo" class="container">
		<h1><a href="HomePage.aspx" class="image-full"><img src="images/MJSNOWGUY.png" alt="" /></a></h1>

    <h3>
      Welcome to the login Page</h3>
    <table>
      <tr>
        <td>
          Username:</td>
        <td>
          <asp:TextBox ID="Username" runat="server" /></td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            ControlToValidate="Username"
            Display="Dynamic" 
            ErrorMessage="Cannot be empty." 
            runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Password:</td>
        <td>
          <asp:TextBox ID="UserPass" TextMode="Password" 
             runat="server" />
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            ControlToValidate="UserPass"
            ErrorMessage="Cannot be empty." 
            runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Remember me?</td>
        <td>
          <asp:CheckBox ID="Persist" runat="server" /></td>
      </tr>
    </table>
    <asp:Button ID="Submit1" OnClick="Logon_Click" Text="Log in" 
       runat="server" />
    <p>
      <asp:Label ID="Msg" ForeColor="red" runat="server" />
    </p>
  </form>
</body>
</html>
