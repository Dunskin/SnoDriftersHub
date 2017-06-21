<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="GalleryEditor.aspx.cs" Inherits="SnoDrifters.GalleryEditor2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager" 
                   runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
               <div id="editAlbum">
                <asp:GridView ID="grdAlbums" runat="server"
                    AutoGenerateColumns="False" DataSourceID="SqlAlbum" DataKeyNames="Album_Id" OnRowDeleting="grdAlbums_RowDeleting">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkDeleteButtonAlbums" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete? *CAUTION DELETING ALBUM WILL DELETE ALL PICTURES IN THE ALBUM*'); "></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Album_Id" HeaderText="Album ID" Visible="True" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Album_Id"/>
                        
                        <asp:BoundField DataField="Album_Name" HeaderText="Album Name" SortExpression="Album_Name" />
                        <asp:BoundField DataField="Album_Sequence" HeaderText="Album Sequence" SortExpression="Album_Sequence" />
                        <asp:BoundField DataField="Album_Description" HeaderText="Album Description" SortExpression="Album_Description" />
                    </Columns>
                </asp:GridView>
                </div>
                </ContentTemplate>
             </asp:UpdatePanel>
                
                

                <br />  
        <h3>     
            Create new album
        </h3>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="albumNameLabel" runat="server" Text="Enter New Album Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAlbumName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="albumSequenceLabel" runat="server" Text="Album Sequence"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAlbumSeq" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="albumDescriptionLabel" runat="server" Text="Album Description"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAlbumDesc" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Button ID="btnSaveAlbum" runat="server" Text="Add Album" 
                            OnClick="btnSaveAlbum_Click"/> 
                        </td>
                    </tr>
                </table>     
        <br />
        <br />
        
    <h3>
        Upload new pictures
    </h3>
        <div>
            <table>                
                <tr>
                    <td>
                        Choose pictures to upload:&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:FileUpload runat="server" ID="UploadImages" AllowMultiple="true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Choose Album to upload pictures to:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAlbumsPicture" runat="server" DataSourceID="SqlAlbum" DataTextField="Album_Name" DataValueField="Album_Id">
                        </asp:DropDownList>
                        <asp:Button runat="server" ID="uploadedFile" Text="Upload" OnClick="uploadFile_Click"/>
                    </td>                    
                </tr>
            </table>
            
        <br />
            <asp:Label ID="listofuploadedfiles" runat="server" />
        </div>

        <br />
        <br />
        
        <asp:Label ID="lblSelectAlbum" runat="server" Text="Select an Album to view its photo's"></asp:Label>
        <asp:DropDownList ID="ddlAlbums" runat="server" AutoPostBack="True" DataSourceID="SqlGetAlbums"
            DataTextField="Album_Name" DataValueField="Album_Id" AppendDataBoundItems="True">
            <asp:ListItem Text="Select Album" Value="" />
        </asp:DropDownList>
                <br />               
                <br />            
                
  
        <div id="editMedia">
            <asp:UpdatePanel ID="updateGridview" runat="server">
                <ContentTemplate>
                <asp:GridView ID="grdMedia" runat="server" AutoGenerateEditButton="True"
                    AutoGenerateColumns="False" DataSourceID="SqlGetPics" DataKeyNames="Media_Id" OnRowDeleting="grdMedia_RowDeleting" AllowPaging="True">
                    <Columns>              
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkDeletebuton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); "></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>          
                        <asp:BoundField DataField="Media_Id" HeaderText="Media_Id" SortExpression="Media_Id" InsertVisible="False" ReadOnly="True" Visible="false"/>
                        <asp:BoundField DataField="Album_Id" ItemStyle-Width="10%" HeaderText="Album_Id" InsertVisible="False" ReadOnly="True" SortExpression="Album_Id" Visible="false" >
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="Media_Link" DataImageUrlFormatString="img/{0}" HeaderText="Picture" ReadOnly="True" InsertVisible="False" ItemStyle-Width="45%" ItemStyle-Height="300px" ControlStyle-CssClass="editmedia">
                        </asp:ImageField>
                        <asp:BoundField DataField="File_Type" HeaderText="File_Type" SortExpression="File_Type" InsertVisible="False" ReadOnly="True" Visible="false"/>
                        <asp:BoundField DataField="Media_Sequence" HeaderText="Picture Sequence" SortExpression="Media_Sequence" ItemStyle-Width="15%" />
                        
                        <asp:BoundField DataField="Caption" HeaderText="Caption" SortExpression="Caption" ItemStyle-Width="25%"/>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" InsertVisible="False" ReadOnly="True" Visible="false" />
                        
                    </Columns>
                </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
                <br />    

            <asp:SqlDataSource ID="SqlAlbum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT * FROM [GalleryAlbum_2016]" 
                    DeleteCommand="Delete from [GalleryAlbum_2016] where Album_Id=@Album_Id" 
                    UpdateCommand="UPDATE [GalleryAlbum_2016] SET [Album_Name] = @Album_Name, [Album_Sequence] = @Album_Sequence, [Album_Description] = @Album_Description where Album_Id=@Album_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Album_Id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

            <%-- SQL connection for the Drop Down List to find Albums --%>
                <asp:SqlDataSource ID="SqlGetAlbums" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Album_Id], [Album_Name] FROM [GalleryAlbum_2016]" >                    
                </asp:SqlDataSource>
                        
           <asp:SqlDataSource ID="SqlGetPics" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT * FROM [Gallery_2016] WHERE ([Album_Id] = @Album_Id)" 
                    DeleteCommand="DELETE FROM [Gallery_2016] WHERE [Media_Id] = @original_Media_Id" 
                    InsertCommand="INSERT INTO [Gallery_2016] ([Album_Id], [Media_Link], [File_Type], [Media_Sequence], [Caption], [Date]) VALUES (@Album_Id, @Media_Link, @File_Type, @Media_Sequence, @Caption, @Date)" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE [Gallery_2016] SET [Media_Link] = @Media_Link, [Media_Sequence] = @Media_Sequence, [Caption] = @Caption WHERE [Media_Id] = @original_Media_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Media_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Album_Id" Type="Int32" />
                        <asp:Parameter Name="Media_Link" Type="String" />
                        <asp:Parameter Name="File_Type" Type="String" />
                        <asp:Parameter Name="Media_Sequence" Type="Int32" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter DbType="Date" Name="Date" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlAlbums" Name="Album_Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Album_Id" Type="Int32" />
                        <asp:Parameter Name="Media_Link" Type="String" />
                        <asp:Parameter Name="File_Type" Type="String" />
                        <asp:Parameter Name="Media_Sequence" Type="Int32" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="Date" DbType="Date" />
                        <asp:Parameter Name="original_Media_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                &nbsp;&nbsp;&nbsp;
                
                &nbsp;&nbsp;&nbsp;
                
            </div>
            <br />
            <br />                 
</asp:Content>
