<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GalleryEditor1.aspx.cs" Inherits="Website.GalleryEditor1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">
    function addMessage() {
        alert('New item added!');
    }
        </script>
    </head>

    <body>
        <form id="form1" runat="server">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Create Album"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtAlbumName" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCreateAlbum" runat="server" Text="Create" 
                    OnClick="btnCreateAlbum_Click" OnClientClick="addMessage()" />

                <br />
                <br />

                <asp:Label ID="Label2" runat="server" Text="Select Album"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlSelectAlbum1" runat="server" DataSourceID="SqlAlbum" 
                    DataTextField="Album_Name" DataValueField="Album_Id">
                </asp:DropDownList>
        
                <asp:SqlDataSource ID="SqlAlbum" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
                    SelectCommand="SELECT [Album_Id], [Album_Name] FROM [GalleryAlbum_2016]">
                </asp:SqlDataSource>
        
                &nbsp;&nbsp;&nbsp;
        
                <asp:Label ID="Label3" runat="server" Text="Caption"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtPicCap" runat="server"></asp:TextBox>
        
                &nbsp;&nbsp;&nbsp;
        
                <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtPicDate" runat="server"></asp:TextBox>
        
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label15" runat="server" Text="Sequence"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtPicSequence" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:FileUpload ID="fupImage" runat="server" />
                &nbsp;&nbsp;
                <asp:Button ID="btnSavePic" runat="server" Text="Save Picture" 
                    OnClick="btnSavePic_Click" OnClientClick="addMessage()" />
            
                <br />
                <br />
            
                <asp:Label ID="Label6" runat="server" Text="Select Album"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlSelectAlbum2" runat="server" DataSourceID="SqlAlbum" 
                    DataTextField="Album_Name" DataValueField="Album_Id">
                </asp:DropDownList>
        
                &nbsp;&nbsp;&nbsp;
        
                <asp:Label ID="Label7" runat="server" Text="Caption"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtVidCap" runat="server"></asp:TextBox>
        
                &nbsp;&nbsp;&nbsp;
        
                <asp:Label ID="Label8" runat="server" Text="Date"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtVidDate" runat="server"></asp:TextBox>
        
                &nbsp;&nbsp;&nbsp;
        
                <asp:Label ID="Label16" runat="server" Text="Sequence"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtVidSequence" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label17" runat="server" Text="Enter URL"></asp:Label>
                &nbsp;  
                <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
        
                <asp:Button ID="btnUploadVid" runat="server" Text="Upload Video" 
                    OnClick="btnUploadVid_Click" />

                &nbsp;&nbsp;&nbsp;
        
                <asp:Button ID="btnSelectVid" runat="server" Text="Select Video" 
                    OnClick="btnSelectVid_Click" />

                &nbsp;&nbsp;&nbsp;
        
                <asp:Button ID="btnInsertVid" runat="server" Text="Insert Video" 
                    OnClick="btnInsertVid_Click" OnClientClick="addMessage()" />

                <br />
                <br />
                <br />
            
                <asp:Button ID="btnEditAlbum" runat="server" Text="Edit Album" 
                    OnClick="btnEditAlbum_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEditMedia" runat="server" Text="Edit Media" 
                    OnClick="btnEditMedia_Click" />
            </div>
        </form>
    </body>
</html>
