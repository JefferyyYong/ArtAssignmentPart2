<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="ArtAssignment.product" %>

<asp:Content ID="productContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >  
    <style>
        .pageBackground{
            background-image:url(Properties/wishList3.png);
        }
        .productLayout{
            margin-top:2%;
            margin-left:10%;
            color:black;
            font-weight:bold;
        }
    </style>
    <div class="pageBackground">
    <span style="text-decoration:underline;font-size:25pt;font-weight:500;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Product</span>
        <div class="productLayout">

            <asp:ListView ID="artList" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="artList_ItemCommand" GroupItemCount="4" >
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                   <table style="margin-top:2%; margin-left:10%; color:black; font-weight:bold;">
                       <tr>
                           <td>
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  Height="170px" Width="170px" style="border:solid" CommandArgument='<%# Eval("artID") %>' CommandName="checkDetail"/>/>
                                   </td>
                       </tr>
                        <tr>
                           <td>
                             Category Type : <%# Eval("artCategory") %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                              Art Name : <%# Eval("artName") %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                                Price : RM <%# Eval("artUnitPrice") %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                                Available Stock : <%# Eval("artQuantity") %>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:LinkButton ID="LinkButton1" runat="server"  style="text-decoration:none; text-align:center; padding: 10px 15px; background-color: lightskyblue ; color:white; display: inline-block; width:145px;" CommandArgument='<%# Eval("artID") %>' CommandName="AddToWishList" >Add To Wish List</asp:LinkButton>         
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:LinkButton ID="LinkButton3" runat="server"  style="text-decoration:none; text-align:center; padding: 10px 15px; background-color: lightskyblue ; color:white; display: inline-block; width:145px;" CommandArgument='<%# Eval("artID") %>' CommandName="AddOrder">Order</asp:LinkButton>         
                           </td>
                       </tr>
                       <tr>
                                <td>&nbsp;</td>
                            </tr>
                   </table>
                        </td>
               </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>

            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM ArtProduct, ArtImage
WHERE ArtProduct.artID = ArtImage.artID"></asp:SqlDataSource>
            <br />
        </div>
        </div>
   </asp:Content>