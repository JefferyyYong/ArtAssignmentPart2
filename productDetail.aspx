<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="productDetail.aspx.cs" Inherits="ArtAssignment.productDetail" %>

<asp:Content ID="productDetailContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url(Properties/wishList3.png);">
    <asp:FormView ID="productDetailPage" runat="server" DataSourceID="SqlDataSource1" CssClass="form" OnItemCommand="productDetailPage_ItemCommand" style="margin:auto; color: black; font-size: 24px; font-weight:bold;">
        <ItemTemplate>
            <div>
                <h1><%# Eval("artName") %></h1>
            </div>
            <br />
            <table style="margin:auto; color: black; font-size: 24px; font-weight:bold;">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  Height="100%" Width="100%" style="border:solid"/><br /><br /><br /><br />
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;">
                        <b>Description : </b><%# Eval("artDescription") %><br /><span><b>Art Category : </b>&nbsp;<%# Eval("artCategory") %></span><br /><span><b>Price : RM </b>&nbsp;<%# Eval("artUnitPrice") %></span><br /><span><b>Available Stock : </b>&nbsp;<%# Eval("artQuantity") %></span><br /><br />

            <asp:LinkButton ID="LinkButton1" runat="server"  style="margin-top:5%; text-decoration:none; text-align:center; padding: 10px 15px; background-color: lightskyblue ; color:white; margin:auto; width:145px;" CommandArgument='<%# Eval("artID") %>' CommandName="WishListAdd" >Add To Wish List</asp:LinkButton>    
                        <br /><br />
                        <asp:LinkButton ID="LinkButton3" runat="server"  style="margin-top:5%; text-decoration:none; text-align:center; padding: 10px 15px; background-color: lightskyblue ; color:white; margin:auto; width:145px;" CommandArgument='<%# Eval("artID") %>' CommandName="OrderAdd">Order</asp:LinkButton>   
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM ArtProduct, ArtImage
WHERE ArtProduct.artID = @specifyArtID and ArtProduct.artID = ArtImage.artID">
        <SelectParameters>
            <asp:SessionParameter Name="specifyArtID" SessionField="specifyArtID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>