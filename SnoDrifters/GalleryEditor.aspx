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
                </ContentTemplate>
             </asp:UpdatePanel>
                
                <asp:SqlDataSource ID="SqlAlbum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT * FROM [GalleryAlbum_2016]" 
                    DeleteCommand="Delete from [GalleryAlbum_2016] where Album_Id=@Album_Id" UpdateCommand="UPDATE [GalleryAlbum_2016] SET [Album_Name] = @Album_Name, [Album_Sequence] = @Album_Sequence, [Album_Description] = @Album_Description where Album_Id=@Album_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Album_Id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

                <br />                        
               </div>
                           
                <%--<asp:Label ID="albumLabel" runat="server" Text="Select Album"></asp:Label>
                &nbsp;  
                
                <asp:DropDownList ID="ddlSelectAlbum1" runat="server" DataSourceID="SqlAlbum" 
                    DataTextField="Album_Name" DataValueField="Album_Id">
                </asp:DropDownList>--%>
                
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="albumNameLabel" runat="server" Text="Enter New Album Name"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtAlbumName" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="albumSequenceLabel" runat="server" Text="Album Sequence"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtAlbumSeq" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="albumDescriptionLabel" runat="server" Text="Album Description"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtAlbumDesc" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSaveAlbum" runat="server" Text="Add Album" 
                    OnClick="btnSaveAlbum_Click"/>            
            
        <br />
        <br />

        <div>
            <asp:FileUpload runat="server" ID="UploadImages" AllowMultiple="true"/>

            <asp:DropDownList ID="ddlAlbumsPicture" runat="server" DataSourceID="SqlAlbum" DataTextField="Album_Name" DataValueField="Album_Id">
            </asp:DropDownList>

            <asp:Button runat="server" ID="uploadedFile" Text="Upload" OnClick="uploadFile_Click"/>
        <br />
            <asp:Label ID="listofuploadedfiles" runat="server" />
        </div>

        <br />
        <br />
        
        <asp:Label ID="lblSelectAlbum" runat="server" Text="Select an Album to view its photo's"></asp:Label>
        <asp:DropDownList ID="ddlAlbums" runat="server" AutoPostBack="True" DataSourceID="SqlMedia"
            DataTextField="Album_Name" DataValueField="Album_Id" AppendDataBoundItems="True">
            <asp:ListItem Text="Select Album" Value="" />
        </asp:DropDownList>
                <br />               
                <br />            
                <%-- SQL connection for the Pictures --%>
                <asp:SqlDataSource ID="SqlMedia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Album_Id], [Album_Name] FROM [GalleryAlbum_2016]" >                    
                </asp:SqlDataSource>
  
        <div id="editMedia">
            <asp:UpdatePanel ID="updateGridview" runat="server">
                <ContentTemplate>
                <asp:GridView ID="grdMedia" runat="server" AutoGenerateEditButton="True"
                    AutoGenerateColumns="False" DataSourceID="SqlGetPics" DataKeyNames="Media_Id" OnRowDeleting="grdMedia_RowDeleting">
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
                
           <%-- Pat start here Friday, need to setup a place to put new photo's in --%>
                <%--<asp:Label ID="lblPicName" runat="server" Text="Enter New Picture Name"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtPicName" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblPicSeq" runat="server" Text="Picture Sequence"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtPicSeq" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblPicCap" runat="server" Text="Picture Caption"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtPicCap" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnInsertPicture" runat="server" Text="Add Photo" 
                    OnClick="btnSavePhoto_Click"/>--%>
               <%--<asp:Label ID="Label3" runat="server" Text="Select Picture"></asp:Label>
                &nbsp;  
                <asp:DropDownList ID="ddlSelectPicture" runat="server" DataSourceID="SqlGetPics" 
                    DataTextField="Media_Link" DataValueField="Media_Id">
                </asp:DropDownList>--%>
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
                <%--<asp:Label ID="Label5" runat="server" Text="Caption"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtPicCap" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="Date"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtPicDate" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Sequence"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtPicSequence" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                
                <br />
                
                <asp:Button ID="btnSelectPic" runat="server" Text="Select Picture" 
                    OnClick="btnSelectPic_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSavePic" runat="server" Text="Save Changes" 
                    OnClick="btnSavePic_Click" OnClientClick ="editMessage()" />
            
                <br />
                <br />
            
                <asp:Label ID="Label8" runat="server" Text="Select Video"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlSelectVideo" runat="server" DataSourceID="SqlGetVids" 
                    DataTextField="Media_Link" DataValueField="Media_Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlGetVids" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Media_Id], [Media_Link] FROM [Gallery_2016] WHERE ([File_Type] = @File_Type)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="File_Type" QueryStringField="Video" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;
                
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="Caption"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtVidCap" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Text="Date"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtVidDate" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label12" runat="server" Text="Sequence"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtVidSequence" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server" Text="Enter URL"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnInsertVid" runat="server" Text="Insert Video" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSaveVid" runat="server" Text="Save Changes" 
                    OnClick="btnSaveVid_Click" OnClientClick ="editMessage()"/>--%>
            </div>

            <br />
            <br />
            <%--<asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" /> --%>     
</asp:Content>
