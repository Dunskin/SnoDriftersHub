<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="EventEditor.aspx.cs" Inherits="SnoDrifters.EventEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
          
        <asp:Panel ID="eventsPanel" 
            runat="server" 
            GroupingText="Event Editor">
                         
                <asp:Label ID="lblDay" Text="Day:" AssociatedControlID="txtDay" runat="server" /> 
                <asp:TextBox ID="txtDay" runat="server" Width="100px"></asp:TextBox>

                <asp:Label ID="lblMonth" Text="Month:" AssociatedControlID="txtMonth" runat="server" /> 
                <asp:TextBox ID="txtMonth" runat="server" Width="100px"></asp:TextBox> 
               
                <asp:Label ID="lblYear" Text="Year:" AssociatedControlID="txtYear" runat="server" />
                <asp:TextBox ID ="txtYear" runat="server" Width="100px"></asp:TextBox> <br/>

                <asp:Label ID="lblTitle" Text="Events Title:" AssociatedControlID="txtEventTitle" runat="server" />
                <asp:TextBox ID="txtEventTitle" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="reqTextTitle" ControlToValidate="txtEventTitle" Text="(Required)" runat="server" /><br />

                <asp:Label ID="lblLocation" Text="Location:" AssociatedControlID="txtLocation" runat="server"  />
                <asp:TextBox ID="txtLocation" runat="server" TextMode="MultiLine" Width="100px" Height="47px"></asp:TextBox><br />
            
                <asp:Label ID="lblDescription" Text="Description:" AssociatedControlID="txtDescription" runat="server" />
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="300px" Height="46px"></asp:TextBox> <br />

                <!--Upload Pic Event --> 
                <asp:Label ID="lblEventsImage" Text="Choose a Picture!"  runat="server" />
                <asp:FileUpload ID="imgEventPic" runat="server" Width="247px" Height="19px" />  <br />
                                               
               <!--Save Event --> 
               <asp:Button ID="btnSaveEvent" runat="server" OnClick="btnInsert_Click" Text="Add Event" Width="100px" /> 
                      
            
        </asp:Panel>
            
                </div>
</asp:Content>
