<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Website.WebForm6" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <div id ="HeaderLinks"><a href="HomePage.aspx">HOME</a>&nbsp; <a href="Events.aspx">EVENTS</a>&nbsp; <a href="Gallery.aspx">GALLERY</a>&nbsp; <a href="Sponsers.aspx">SPONSERS</a>&nbsp; <a href="ClubInfo.aspx">CLUBINFO</a>&nbsp; <a href="ContactUs.aspx">CONTACT US</a>&nbsp; 
         </div>
    <br />
    <br />
    <br />
    <br />
     <h2>GALLERY!</h2><br />
     <div>
                <asp:GridView ID="grdViewAlbums" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlGetAlbums">
                    <Columns>
                        <asp:BoundField DataField="Album_Name" HeaderText="Album_Name" 
                            SortExpression="Album_Name" />
                        <asp:BoundField DataField="Album_Description" HeaderText="Album_Description" 
                            SortExpression="Album_Description" />
                    </Columns>
                </asp:GridView>
                
                <br />
                
                <asp:SqlDataSource ID="SqlGetAlbums" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Album_Name], [Album_Description] FROM [GalleryAlbum_2016]">
                </asp:SqlDataSource>
                
                <asp:Button ID="btnSelect" runat="server" Text="Select from" OnClick="btnSelect_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlSelectAlbum" runat="server" DataSourceID="SqlAlbum" 
                    DataTextField="Album_Name" DataValueField="Album_Id" >
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlAlbum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Album_Id], [Album_Name] FROM [GalleryAlbum_2016]" >
                </asp:SqlDataSource>

                <br />
                <br />

                <asp:GridView ID="grdViewMedia" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="MediaLink" HeaderText="MediaLink" 
                            SortExpression="MediaLink" />
                        <asp:BoundField DataField="FileType" HeaderText="FileType" 
                            SortExpression="FileType" />
                        <asp:BoundField DataField="Caption" HeaderText="Caption" 
                            SortExpression="Caption" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%#((Media)Container.DataItem).Render() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                
                <asp:SqlDataSource ID="SqlGetMedia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Media_Link], [File_Type], [Caption], [Date] FROM [Gallery_2016] WHERE ([Album_Id] = @Album_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlSelectAlbum" 
                            Name="Album_Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div> 
    <br />
    <br />
    <br />
    <br />
</asp:Content>
