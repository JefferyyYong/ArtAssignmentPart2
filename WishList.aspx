<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="ArtAssignment.WishList" %>
<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  

    <style  type="text/css">
        .auto-style1 {
            width: 167px;
            height: 40px;
            border: 1px solid black;
        }
        .auto-style2 {
            width: 203px;
            height: 40px;
            border: 1px solid black;
        }
        .auto-style3 {
            width: 253px;
            height: 40px;
            border: 1px solid black;
        }
        .auto-style4 {
            width: 315px;
            height: 40px;
            border: 1px solid black;
        }
        
        table{
            border: 1px solid black;
            border-collapse: collapse;
        }

        listDetails tr{
             border: 1px solid black;
        }

        .auto-style6 {
            height: 178px;
        }
       
        .auto-style8 {
            width: 157px;
            height: 40px;
            border: 1px solid black;
        }
 
        .auto-style9 {
            width: 60%;
            height: 30px;
        }
     
        .auto-style10 {
            height: 50px;
        }

      </style>

        <div style="background-position: center center; text-align: center; background-image: url('Images/ribbon.png'); background-repeat: no-repeat;" class="auto-style6">
            <h2 style ="padding-top:40px;">My Wish List</h2>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM ArtProduct, WishList, ArtImage
WHERE (ArtProduct.artID = WishList.artID) AND (WishList.cEmail = @email) AND (ArtProduct.artID = ArtImage.artID) ">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />

        <div>
             <table style="margin:0 auto; border-collapse: collapse;" class="auto-style9" >
                <thead style="background-color:#B2D3C2;">
                    <tr style="text-align:center;">
                        <th class="auto-style1">Category</th>
                        <th class="auto-style8">Image</th>
                        <th class="auto-style4">Product Details</th>
                        <th class="auto-style3">Price</th>
                        <th class="auto-style2"></th>
                    </tr>
                </thead>

                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" >
                         <ItemTemplate>
                            <tr style=" border: 1px solid black;">
                                <td style=" border: 1px solid black; text-align:center;">
                                     <%# Eval("artCategory") %>
                                </td>

                                <td style=" border: 1px solid black; text-align:center;">      
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  Height="150px" Width="150px"/>
                                </td>

                                 <td style=" border: 1px solid black; padding:10px;">
                                    <strong><%# Eval("artName") %></strong><br /><br />
                                     Description: <%# Eval("artDescription") %>
                                 </td>

                                 <td style=" border: 1px solid black; text-align:center;">
                                    <%# Eval("artUnitPrice") %>
                                 </td>

                                 <td style=" border: 1px solid black; text-align:center; padding:10px 0;">
                                      <asp:LinkButton ID="LinkButton2" runat="server" style="text-decoration:none; text-align:center; padding: 14px 25px; background-color: #03AC13; color:white; display: inline-block; width:50px;" CommandArgument='<%# Eval("artID") %>' CommandName="AddOrder">Order</asp:LinkButton>
                                   <br /><br />
                                     <asp:LinkButton ID="LinkButton1" runat="server" style="text-decoration:none; text-align:center; padding: 14px 25px; background-color: #8D021F; color:white; display: inline-block;  width:50px;" CommandName="DeleteFromWishList" CommandArgument='<%# Eval("artID") %>'>Delete</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
     <br />
     <br />
     <br />
    </asp:Content>