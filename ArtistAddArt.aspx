<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ArtistAddArt.aspx.cs" Inherits="ArtAssignment.ArtistAddArt" %>

<asp:Content ID="ArtistAddArt" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<link href="ArtistAddArt.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function imagePreview1(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#<%=image1.ClientID%>').prop('src', e.target.result)
                    .width(150)
                    .height(150);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<asp:HiddenField ID="hfArtistEmail" runat="server" Value=""/>

<div id="addArtPg">

    <h1 style="font-size:30px;" >CREATE NEW ART</h1>

    <table class="addArtTable">
        <tr class="addArtRow"><td class="uploadCol1"><b> Image: </b></td>
            <td class="uploadCol2"><label class="uploadInvisible">
                <asp:Image ID="image1" runat="server" height="150px" width="150px" ImageUrl="Properties/AddImageIcon.png"/>
                <asp:FileUpload ID="fupImage1" runat="server" width="100px" required="" accept=".png,.jpg,.jpeg,.gif" onchange="imagePreview1(this);"/></label></td></tr>

        <tr class="addArtRow"><td class="addArtCol1"><b> Name: </b></td><td class="addArtCol2">
            <asp:TextBox ID="txtArtName" CssClass="createArtStyle" runat="server" required=""></asp:TextBox></td></tr>

        <tr class="addArtRow"><td class="addArtCol1"><b> Description: </b></td><td class="addArtCol2">
            <asp:TextBox ID="txtDescription" CssClass="createArtStyle" runat="server" TextMode="MultiLine" style="height:100px;width:350px" required=""></asp:TextBox></td></tr>

        <tr class="addArtRow"><td class="addArtCol1"><b> Category: </b></td><td class="addArtCol2">
            <asp:DropDownList ID="ddlCategory" CssClass="createArtStyle" runat="server" style="width:357px" required="">
                <asp:ListItem Value="Drawing"></asp:ListItem>
                <asp:ListItem Value="Painting"></asp:ListItem>
                <asp:ListItem Value="Photography"></asp:ListItem>
                <asp:ListItem Value="Others"></asp:ListItem>
            </asp:DropDownList></td></tr>

        <tr class="addArtRow"><td class="addArtCol1"><b>Price(RM): 
            </b></td><td class="addArtCol2">
            <asp:TextBox ID="txtPrice" CssClass="createArtStyle" runat="server" type="number" step="0.1" required=""></asp:TextBox> </td></tr>

        <tr class="addArtRow"><td class="addArtCol1"><b> Quantity: </b></td><td class="addArtCol2">
            <asp:TextBox ID="txtQuantity" CssClass="createArtStyle" runat="server" type="number" required=""></asp:TextBox></td></tr>

        <tr><td colspan="2">
            <asp:Button ID="btnCreateArt" CssClass="btnCreateArtStyle" runat="server" Text="Create Art" OnClick="btnCreateArt_Click" /></td></tr>
    </table>

</div>
</asp:Content>
