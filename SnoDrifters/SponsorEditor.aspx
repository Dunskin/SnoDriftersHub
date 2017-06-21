<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="SponsorEditor.aspx.cs" Inherits="SnoDrifters.SponsorEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="Sponsor Editor" Height="359px">            
        <table>            
            <tr>
                <td class="auto-style1">
                    Name:<br /><asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>                   
                <td>
                    Phone:<br /><asp:TextBox ID="txtPhone"  runat="server"></asp:TextBox>
                </td>                   
            </tr>
            <tr>
                <td>
                    Address:<br /><asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="265px" Height="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>                     
                <td colspan="2">
                    Short Description:<br /><asp:TextBox ID="txtShortDescription" runat="server" TextMode="MultiLine" Width="265px" Height="50px"></asp:TextBox>
                </td>                                     
            </tr>
            <tr>
                <td class="auto-style1">
                    Email:<br /><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>Logo:<br />
                    <asp:FileUpload ID="fupLogo" runat="server" />
                </td>
            </tr>
            <tr>            
                <td colspan="2">
                    Website:<br /><asp:TextBox ID="txtWebsite" runat="server" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnInsert" runat="server" Text="Add Sponsor" Width="142px" OnClick="btnInsert_Click" />
                </td>
            </tr>                
        </table>
    </asp:Panel>
    <br />    
         All Sponsors
    <br />
    <br />    
        <div class="sponimg">   
            <asp:ScriptManager ID="ScriptManager" 
                   runat="server" />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                
            <%--OnRowCancelingEdit="grdSponsor_RowCancelingEdit" OnRowDeleting="grdSponsor_RowDeleting" OnRowEditing="grdSponsor_RowEditing" OnRowUpdating="grdSponsor_RowUpdating"--%>
            <asp:GridView ID="grdSponsor" runat="server" DataKeyNames="SponsorId" AutoGenerateEditButton="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDeleting="grdSponsor_RowDeleting">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkDeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); "></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SponsorId" HeaderText="SponsorId" Visible="False" InsertVisible="False" ReadOnly="True" SortExpression="SponsorId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" SortExpression="ShortDescription" />
                    <asp:ImageField DataImageUrlField="Logo" DataImageUrlFormatString="img/Sponsors/{0}" ReadOnly="true" InsertVisible="false">
                    </asp:ImageField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                </Columns>
            </asp:GridView>

            </ContentTemplate>
            </asp:UpdatePanel> 
        </div>       
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:snowdriftersdbConnectionString %>" 
        SelectCommand="SELECT * FROM [Sponsors]" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Sponsors] WHERE [SponsorId] = @original_SponsorId"
        InsertCommand="INSERT INTO [Sponsors] ([Name], [ShortDescription], [Logo], [Address], [Phone], [Email], [Website]) VALUES (@Name, @ShortDescription, @Logo, @Address, @Phone, @Email, @Website)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [Sponsors] SET [Name] = @Name, [ShortDescription] = @ShortDescription, [Address] = @Address, [Phone] = @Phone, [Email] = @Email, [Website] = @Website WHERE [SponsorId] = @original_SponsorId">
        <DeleteParameters>
            <asp:Parameter Name="original_SponsorId" Type="Int32" />            
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ShortDescription" Type="String" />
            <asp:Parameter Name="Logo" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Website" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ShortDescription" Type="String" />
            <asp:Parameter Name="Logo" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Website" Type="String" />
            <asp:Parameter Name="original_SponsorId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
