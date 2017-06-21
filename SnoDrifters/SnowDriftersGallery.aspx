<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SnowDriftersGallery.aspx.cs" Inherits="SnoDrifters.SnowDriftersGallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:DataList ID="dtlGalleryPhotos"     
                DataSourceID="sqlGalleryPhotos"
                runat ="server"
                RepeatColumns = "5" 
                RepeatDirection ="Horizontal" 
                BorderStyle="None"
                BorderWidth="2px" 
                CellPadding="5" 
                CellSpacing="5">
     
       <ItemTemplate>

            <asp:Image ID="TestLink2" 
             runat="server" 
             Width="300px" Height="200px" 
             ImageUrl='<%# Bind("Media_Link", "~/img/{0}") %>' 
             style="padding-left:40px"  /> 
                 
        </Itemtemplate>

     </asp:DataList>



                       
    <asp:SqlDataSource ID="sqlGalleryPhotos"
             ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
             SelectCommand="SELECT Media_Id, Album_Id, Media_Link, File_Type, Caption, Media_Sequence, Date From Gallery_2016 WHERE Album_Id=@Album_Id" 
             runat="server">

           <SelectParameters>
                   
               <asp:QueryStringParameter Name="Album_Id"
                     QueryStringField="id" />
           </SelectParameters>
         
    </asp:SqlDataSource>



    
    </div>
    </form>
</body>
</html>
