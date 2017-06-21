<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="EventEditor.aspx.cs" Inherits="SnoDrifters.EventEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
          
        <asp:Panel ID="eventsPanel" 
            runat="server" 
            GroupingText="Add an Event">
                         
                <asp:Label ID="lblDay" Text="Day:" AssociatedControlID="txtDay" runat="server" /> 
                <asp:TextBox ID="txtDay" runat="server" Width="100px"></asp:TextBox>

                <asp:Label ID="lblMonth" Text="Month:" AssociatedControlID="txtMonth" runat="server" /> 
                <asp:TextBox ID="txtMonth" runat="server" Width="100px"></asp:TextBox> 
               
                <asp:Label ID="lblYear" Text="Year:" AssociatedControlID="txtYear" runat="server" />
                <asp:TextBox ID ="txtYear" runat="server" Width="100px"></asp:TextBox> <br/>

                <asp:Label ID="lblTitle" Text="Events Title:" AssociatedControlID="txtEventTitle" runat="server" />
                <asp:TextBox ID="txtEventTitle" runat="server"></asp:TextBox> 
                <%--<asp:RequiredFieldValidator ID="reqTextTitle" ControlToValidate="txtEventTitle" Text="(Required)" runat="server" /><br />--%>

                <asp:Label ID="lblLocation" Text="Location:" AssociatedControlID="txtLocation" runat="server"  />
                <asp:TextBox ID="txtLocation" runat="server" TextMode="MultiLine" Width="100px" Height="47px"></asp:TextBox><br />
            
                <asp:Label ID="lblDescription" Text="Description:" AssociatedControlID="txtDescription" runat="server" />
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="300px" Height="46px"></asp:TextBox> <br />

                <!--Upload Pic Event --> 
                <asp:Label ID="lblEventsImage" Text="Choose a Picture!"  runat="server" />
                <asp:FileUpload ID="imgEventPic" runat="server" Width="247px" Height="19px" />  <br />
                                               
               <!--Save Event --> 
               <asp:Button ID="btnSaveEvent" runat="server" OnClick="btnInsert_Click" Text="Add Event" Width="100px" />
                                 
            
<<<<<<< HEAD
        </asp:Panel>

        <br />

         <asp:Panel ID="deleteEventPanel"
             runat="server"
             GroupingText="Delete an Event">
              

             
         <asp:DropDownList ID="ddlEventsToDelete" runat="server" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="Id">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" SelectCommand="SELECT [Id], [title] FROM [EventsPic]"></asp:SqlDataSource>
             <asp:Button ID="Button1" runat="server" CausesValidation="true" OnClientClick="return confirm('Event Deleted')" Text="Delete Event" />
         </asp:Panel>

=======
>>>>>>> origin/master
            
        </asp:Panel>

         <br />
         <br />
         <div class="sponimg">
         <asp:GridView ID="grdEvents" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="true" DataKeyNames="Id" DataSourceID="sqlGetEvents">
             <Columns>                 
                 <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkDeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); "></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                 <asp:BoundField DataField="month" HeaderText="Month" SortExpression="month" />
                 <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                 <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                 <asp:ImageField DataImageUrlField="MediaLink" DataImageUrlFormatString="img/{0}" ReadOnly="true" InsertVisible="false">
                 </asp:ImageField>
                 <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />                 
                 <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
             </Columns>
         </asp:GridView>

         <asp:SqlDataSource ID="sqlGetEvents" runat="server" ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
             SelectCommand="SELECT [Id], [day], [month], [year], [title], [description], [MediaLink], [location] FROM [EventsPic]" 
             ConflictDetection="CompareAllValues" 
             DeleteCommand="DELETE FROM [EventsPic] WHERE [Id] = @original_Id"
             OldValuesParameterFormatString="original_{0}" 
             UpdateCommand="UPDATE [EventsPic] SET [day] = @day, [month] = @month, [year] = @year, [title] = @title, [description] = @description, [location] = @location WHERE [Id] = @original_Id">
             <DeleteParameters>
                 <asp:Parameter Name="original_Id" Type="Int32" />
                 <asp:Parameter Name="original_day" Type="Int32" />
                 <asp:Parameter Name="original_month" Type="String" />
                 <asp:Parameter Name="original_year" Type="Int32" />
                 <asp:Parameter Name="original_title" Type="String" />
                 <asp:Parameter Name="original_description" Type="String" />
                 <asp:Parameter Name="original_MediaLink" Type="String" />
                 <asp:Parameter Name="original_location" Type="String" />
             </DeleteParameters>             
             <UpdateParameters>
                 <asp:Parameter Name="day" Type="Int32" />
                 <asp:Parameter Name="month" Type="String" />
                 <asp:Parameter Name="year" Type="Int32" />
                 <asp:Parameter Name="title" Type="String" />
                 <asp:Parameter Name="description" Type="String" />
                 <asp:Parameter Name="MediaLink" Type="String" />
                 <asp:Parameter Name="location" Type="String" />
                 <asp:Parameter Name="original_Id" Type="Int32" />
                 <asp:Parameter Name="original_day" Type="Int32" />
                 <asp:Parameter Name="original_month" Type="String" />
                 <asp:Parameter Name="original_year" Type="Int32" />
                 <asp:Parameter Name="original_title" Type="String" />
                 <asp:Parameter Name="original_description" Type="String" />
                 <asp:Parameter Name="original_MediaLink" Type="String" />
                 <asp:Parameter Name="original_location" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>
             </div>
    </div>

</asp:Content>
