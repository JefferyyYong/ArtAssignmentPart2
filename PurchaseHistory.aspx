<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="ArtAssignment.PurchaseHistory" %>

<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style type="text/css">
        .auto-style7 {
            width: 681px;
        }
        .auto-style8 {
            width: 142px;
            height: 43px;
        }
        .auto-style10 {
            height: 43px;
            width: 210px;
        }
        .auto-style11 {
            width: 142px;
        }
        .auto-style15 {
            width: 836px;
            margin-left: 21%;
            height: 228px;
        }
        .auto-style21 {
            width: 244px;
        }
        .auto-style22 {
            width: 204px;
            height: 38px;
        }
        .auto-style23 {
            width: 244px;
            height: 38px;
        }
        </style>


        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM OrderDetails, ArtProduct, ArtImage
WHERE ArtProduct.artID = ArtImage.artID and ArtProduct.artID = OrderDetails.artID and OrderDetails.cEmail = @email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>

        </asp:SqlDataSource>

        <div>
             <h2 style="text-align: center;">My Purchase History</h2>
             <table style="border-collapse: collapse; border: 1px solid black; margin-right: 25%; margin-top: 0; margin-bottom: 0;" class="auto-style15">
                <thead style="background-color:#B2D3C2;">
                    <tr>
                        <th class="auto-style22" style="text-align: center; border: 1px solid black;">Order Id</th>
                        <th class="auto-style23" style="text-align: center; border: 1px solid black;">Order Details</th>
                    </tr>
                </thead>

                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="AddSessionOrderId">          
                    <ItemTemplate>
                            <tr>
                                <td style="text-align: center; border: 1px solid black;"><%# Eval("orderID") %></td>
                                <td style="text-align: center; border: 1px solid black;">
                                    <asp:LinkButton ID="LinkButton1" runat="server" style="text-decoration:none; background-color: #03AC13; color:white; display: inline-block; text-align:center; padding:5px;" CommandArgument='<%# Eval("orderID") %>'>Click</asp:LinkButton>
                                </td>
                            </tr>
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>
             </table>
        </div>
         <br />
         <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *
FROM OrderDetails,  ArtProduct, ArtImage
WHERE OrderDetails.artID = ArtProduct.artID and OrderDetails.orderID = @orderID and ArtProduct.artID = ArtImage.artID">
            <SelectParameters>
                <asp:SessionParameter Name="orderID" SessionField="orderID" />
            </SelectParameters>
        </asp:SqlDataSource>

        <table class="auto-style7" style="margin: 0 25%; border-collapse: collapse; border: 1px solid black;">
        <% if (Session["orderID"] != null)
            {%>
         
        <tr style="background-color:#B2D3C2;">
            <th class="auto-style8" style="text-align:center; border: 1px solid black;"></th>
            <th class="auto-style10" style="text-align:center; border: 1px solid black;">Product Details</th>
            <th class="auto-style11" style="text-align:center; border: 1px solid black;">Price</th>
        </tr>

        <%} %>
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <tr style=" border: 1px solid black;">
                    <td style="border: 1px solid black;">
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>'  Height="150px" Width="150px"/>
                    </td>
                    <td style="border: 1px solid black; padding:10px; ">
                        <strong><p><asp:Label ID="lblProName" runat="server" Text='<%# Eval("artName") %>' /></p></strong>
                        <p><asp:Label ID="lblProDescription" runat="server" Text='<%# Eval("artDescription") %>' /></p>
                     </td>
                    <td style="border: 1px solid black; text-align:center;">RM <%# Eval("artUnitPrice") %> </td>
                </tr>
                <br />
            </ItemTemplate>
        </asp:Repeater>     
        </table>
    <br />
 </asp:Content>
