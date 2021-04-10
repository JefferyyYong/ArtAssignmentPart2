<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ArtistArtList.aspx.cs" Inherits="ArtAssignment.ArtistArtList" %>

<asp:Content ID="ArtistArtList" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:HiddenField ID="hfArtistEmail" runat="server"/>

<link href="ArtistArtList.css" rel="stylesheet">

    <div id="listingPg">
    <h1 style="font-size:30px;">ART LISTING</h1>

    <!--SQL(S)-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artID], [artName], [artDescription], [artCategory], [artUnitPrice], [artQuantity] FROM [ArtProduct] WHERE ([aEmail] = @aEmail)" DeleteCommand="DELETE FROM [ArtImage] WHERE [artID] = @artID
DELETE FROM [ArtProduct] WHERE [artID] = @artID

" UpdateCommand="UPDATE [ArtProduct] SET [artName] = @artName, [artDescription] = @artDescription, [artUnitPrice] = @artUnitPrice, [artQuantity] = @artQuantity WHERE [artID] = @artID
">
        <DeleteParameters>
            <asp:Parameter Name="artID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfArtistEmail" Name="aEmail" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="artName" />
            <asp:Parameter Name="artDescription" />
            <asp:Parameter Name="artUnitPrice" />
            <asp:Parameter Name="artQuantity" />
            <asp:Parameter Name="artID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--SQL(E)-->


    <!--Gridview(S)-->
    <asp:GridView ID="GridView1" runat="server"  HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" Borderline="Both" BorderColor="DarkSlateBlue" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="artID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="artID" HeaderText="ID" SortExpression="artID" Visible="false" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="artName" HeaderText="Name" SortExpression="artName" />
            <asp:BoundField DataField="artDescription" HeaderText="Description" SortExpression="artDescription" />
            <asp:BoundField DataField="artCategory" HeaderText="Category" Visible="false" SortExpression="artCategory" />
            <asp:BoundField DataField="artUnitPrice" HeaderText="Unit Price (RM)" SortExpression="artUnitPrice" />
            <asp:BoundField DataField="artQuantity" HeaderText="Quantity" SortExpression="artQuantity" />
            <asp:CommandField HeaderText="Quick Action" ShowEditButton="True" ShowDeleteButton="True"/>
            <asp:HyperLinkField HeaderText="Action" Text="View" DataNavigateUrlFields="artID, artName, artDescription, artCategory, artUnitPrice, artQuantity"
                DataNavigateUrlFormatString="ArtistEditArt.aspx?artID={0}&artName={1}&artDescription={2}&artCategory={3}&artUnitPrice={4}, artQuantity={5}" />
            
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" Width="10%"/>
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="False" Font-Underline="False" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" Font-Underline="False" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />

        <EmptyDataRowStyle CssClass="empty" />
        <EmptyDataTemplate>
            <br />
            <asp:Label ID="lblEmptyList" runat="server" style="font-size: 20px;" Text="There is no available listing at the moment."></asp:Label>
            <br />
        </EmptyDataTemplate>
        </asp:GridView>
    <!--Gridview(E)-->
      

    <div>
        <asp:Button ID="btnReturn" runat="server" PostBackUrl="~/ArtistManageArt.aspx" Text="Return" CssClass="btnReturnManageArt" />
    </div>
    <br />
    </div>
</asp:Content>
