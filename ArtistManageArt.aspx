<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ArtistManageArt.aspx.cs" Inherits="ArtAssignment.WebForm1" %>

<asp:Content ID="artistManageArtPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="ArtistManageArt.css" rel="stylesheet">
    <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
    <div id="manageArtPg">
        <a href="ArtistAddArt.aspx" class="button">
          <figure>
              <asp:Image ID="imgCreate" runat="server" ImageUrl="~/Properties/CreateIcon.png" style="width:100px; height:100px"/></figure>
          <div class="btnText">
            Create New Art
          </div>
        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="ArtistArtList.aspx" class="button">
          <figure>
              <asp:Image ID="imgView" runat="server" ImageUrl="~/Properties/ListIcon.png" style="width:100px; height:100px"/></figure>
          <div class="btnText">
            View Art Listing
          </div>
        </a>
    </div>
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
</asp:Content>
