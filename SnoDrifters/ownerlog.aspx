<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ownerlog.aspx.cs" Inherits="SnoDrifters.ownerlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/loginform.css" rel="stylesheet" />

<%--<script runat="server">
</script>--%>

    <title></title>
</head>
<body>
    <h2>SnoDrifters Login Form</h2>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="/OwnerPage.aspx" runat="server">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img/SnoDrifters/MJSNOWGUY_Logo.png" alt="Avatar"/>
    </div>

    <div class="container">
      <label><b>Username</b></label>
        
        <asp:RequiredFieldValidator runat="server" ControlToValidate="uName"
                                ErrorMessage="The user name field is required." />
        <asp:TextBox ID="uName" runat="server" />
      <%--<input type="text" placeholder="Enter Username" name="UserName" id="uName" required="required"/>--%>

      <label><b>Password</b></label>
       <asp:RequiredFieldValidator runat="server" ControlToValidate="psw" 
                                ErrorMessage="The password field is required." />
        <asp:TextBox ID="psw" TextMode="Password" runat="server" />
      <%--<input type="password" placeholder="Enter Password" name="Password" id="psw" required="required"/>--%>
        
      <button type="submit" onclick="Logon_Click">Login </button>      
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>
