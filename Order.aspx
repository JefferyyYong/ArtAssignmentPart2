<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ArtAssignment.Order" %>

<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM ArtProduct, ArtImage
WHERE ArtProduct.artID = @orderArtID and ArtProduct.artID = ArtImage.artID">
                <SelectParameters>
                    <asp:SessionParameter Name="orderArtID" SessionField="orderArtID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <table  style="margin:0 25%; border-collapse: collapse;">
                <thead>
                    <tr style="text-align:center;">
                        <th class="auto-style1" style=" border: 1px solid black;">Product Name</th>
                        <th class="auto-style8" style=" border: 1px solid black;">Image</th>
                        <th class="auto-style4" style=" border: 1px solid black;">Price</th>
                    </tr>
                </thead>

                <tbody>
                     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                         <ItemTemplate>
                            <tr style=" border: 1px solid black;">
                                <td style=" border: 1px solid black; text-align:center;">
                                     <%# Eval("artName") %>
                                </td>

                                <td style=" border: 1px solid black; text-align:center;">      
                                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  Height="150px" Width="150px"/>
                                </td>

                                 <td style=" border: 1px solid black; padding:10px;">
                                    <%# Eval("artUnitPrice") %>
                                 </td>

                                 <td style=" border: 1px solid black; text-align:center; padding:10px 0;">
                                      <asp:LinkButton ID="LinkButton1" runat="server" style="text-decoration:none; text-align:center; padding: 14px 25px; background-color: #03AC13; color:white; display: inline-block; width:70px;" CommandArgument='<%# Eval("artID") %>' CommandName="Order">Confirm</asp:LinkButton>                                 
                                </td>
                            </tr>
                        </ItemTemplate>
                     </asp:Repeater>
                </tbody>
            </table>           
            <br />
        </div>
 </asp:Content>