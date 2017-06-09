<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="SnoDrifters.Email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Contact Us</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />  
    </head>
    <body>
        <form id="ContactForm" runat="server">
            <div>
                <fieldset>
                    <legend>Contact us</legend> 
                        <div class='short_explanation'>* required fields</div>   
                        <div class='container'>
                            <asp:Label ID="lblName" runat="server" 
                                        Text="Your Name*:" CssClass="label"/><br/>
                            <asp:TextBox ID="txtName" runat="server"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                                        runat="server" 
                                                        ControlToValidate="txtName" 
                                                        ErrorMessage="Enter Your Name" 
                                                        SetFocusOnError="True">*
                            </asp:RequiredFieldValidator><br />
                        </div>  
                       <div class='container'>
                           <asp:Label ID="lblEmail" runat="server" 
                                      Text="Email*:" CssClass="label"/>
                           <br/>
                           <asp:TextBox ID="txtMail" runat="server"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                                       runat="server" 
                                                       ControlToValidate="txtMail" 
                                                       ErrorMessage="Please Provide 
                                                                    Your Email Address" 
                                                       SetFocusOnError="True">*
                           </asp:RequiredFieldValidator>
                           <br />
                       </div>
    
                       <div class='container'>
                           <asp:Label ID="lblSubject" runat="server" 
                                      Text="Subject*:" CssClass="label"/>
                           <br/>
                           <asp:TextBox ID="txtSubject" runat="server"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                       runat="server" 
                                                       ControlToValidate="txtSubject" 
                                                       ErrorMessage="Please provide 
                                                                    reason to contact us" 
                                                       SetFocusOnError="True">*
                           </asp:RequiredFieldValidator>
                           <br />
                       </div>
    
                       <div class='container'>
                           <asp:Label ID="lblMessage" runat="server" 
                                      Text="Feedback:" CssClass="label"/>
                           <br/>
                           <asp:TextBox ID="txtMessage" runat="server" 
                                       TextMode="MultiLine" Width="268px"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                                       runat="server" 
                                                      ControlToValidate="txtMessage" 
                                                      ErrorMessage="Write your feedback" 
                                                      SetFocusOnError="True">*
                           </asp:RequiredFieldValidator>
                           <br />
                       </div>    
                       <div class='container'>
                           <asp:Button ID="btnSubmit" runat="server" 
                                       Text="Submit" onclick="btnSubmit_Click"/>
                           </div>
                           <asp:ValidationSummary ID="ValidationSummary1" 
                                                  runat="server" CssClass="error"/>
                           </fieldset>
                           <asp:Label ID="Label1" runat="server" Text=""/>
                       </div>
               </form>
        </body>
   </html>
