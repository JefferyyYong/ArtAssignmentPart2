<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="cDashboard.aspx.cs" Inherits="ArtAssignment.cDashboard" %>

<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Properties/wishList3.png" Height="100%" Width="100%" />
    <asp:Button ID="wishListBtn" runat="server" Text="Wish List" OnClick="wishListBtn_Click" CssClass="auto-style1"/>
    <asp:Button ID="purchaseHistoryBtn" runat="server" Text="Purchase History" OnClick="purchaseHistoryBtn_Click" CssClass="auto-style2"/>
    <asp:Button ID="viewProductBtn" runat="server" Text="View Product" OnClick="viewProductBtn_Click" CssClass="auto-style4" />
    
    <style type="text/css">
        .auto-style1{
            position:absolute;
            top: 300px;
            left: 100px;
            background-color: dodgerblue;
            border: none;
            color: white;
            text-align: center;
            padding: 15px 75px;
            text-decoration: none;
            display: inline-block;
            font-size: 24px;
            font-weight: bold;
        }
        .auto-style2{
           position:absolute;
            top: 300px;
            right: 100px;
            background-color: dodgerblue;
            border: none;
            color: white;
            padding: 15px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 24px;
            font-weight: bold;
        }
         .auto-style3{
            position:absolute;
            top: 400px;
            left: 550px;
            color: white;
            font-family: 'Helvetica Neue', sans-serif;
            font-size: 54px;
            font-weight: bold;
            letter-spacing: -1px;
            line-height: 1;
            text-align: center;
        }
        .auto-style4 {
            position: absolute;
            top: 300px;
            left: 43%;
            background-color: dodgerblue;
            border: none;
            color: white;
            padding: 15px 36px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</asp:Content>
