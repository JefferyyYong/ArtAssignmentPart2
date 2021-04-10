<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="ArtAssignment.homepage" %>


<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  

    <style>
        .homeTV {
            position: absolute;
            left: 0px;
            top: 186px;
            margin:auto;
            height: 600px;
            background-color:black;
            color:white;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-weight:500;
        }

        .nodeStyle{
            padding-top:140px;
            font-size:18pt;
        }
    </style>
    
    <asp:TreeView ID="homeTV" runat="server" CssClass="homeTV" ImageSet="Arrows" >
        <HoverNodeStyle Font-Underline="True" ForeColor="Red" />
        <Nodes>
            <asp:TreeNode Expanded="True" NavigateUrl="~/homepage.aspx" Text="Homepage" Value="Homepage">
                <asp:TreeNode NavigateUrl="~/aboutUs.aspx" Text="About us" Value="About us"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/servicePage.aspx" Text="Service" Value="Service"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/login.aspx" Text="Login" Value="Login"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/register.aspx" Text="Register" Value="Register">
                    <asp:TreeNode NavigateUrl="~/customerRegister.aspx" Text="Customer " Value="Customer "></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/artistRegister.aspx" Text="Artist" Value="Artist"></asp:TreeNode>
                </asp:TreeNode>
            </asp:TreeNode>
        </Nodes>
        <NodeStyle Font-Names="Tahoma" Font-Size="18pt" ForeColor="White" HorizontalPadding="5px" NodeSpacing="13px" VerticalPadding="0px" />
        <RootNodeStyle Font-Bold="true" ForeColor="White" CssClass="nodeStyle"/>
        <ParentNodeStyle Font-Bold="TRUE" ForeColor="White"/>
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="10px" />
    </asp:TreeView>

    <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/Background.jpg" Height="600px" Width="1350px" />

</asp:Content>
