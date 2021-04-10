<%@ Page Language="C#"  MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ArtistEditArt.aspx.cs" Inherits="ArtAssignment.EditArt" %>

<asp:Content ID="ArtistEditArt" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:HiddenField ID="hfArtistEmail" runat="server"/>
<asp:HiddenField ID="hfArtID" runat="server" />

<link href="ArtistEditArt.css" rel="stylesheet">

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

<div id="editArtPg">
    <h1 style="font-size:30px;" >EDIT ART</h1>


    <table class="editArtTable">
          <tr class="editArtRow"><td class="editCol1"><b> Image: </b></td>
            <td class="editCol2"><label class="uploadInvisible">
                <asp:Image ID="image1" runat="server" height="150px" width="150px" />
                <asp:FileUpload ID="fupImage1" runat="server" width="100px" accept=".png,.jpg,.jpeg,.gif" onchange="imagePreview1(this);"/></label></td></tr>

        <tr class="editArtRow"><td class="editArtCol1">Name:</td><td class="editArtCol2">
            <asp:TextBox ID="txtArtName" runat="server" CssClass="editArtStyle" required=""></asp:TextBox></td></tr>

        <tr class="editArtRow"><td class="editArtCol1">Description</td><td class="editArtCol2">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="editArtStyle" required="" TextMode="MultiLine" style="height:100px;width:350px"></asp:TextBox></td></tr>

        <tr class="editArtRow"><td class="editArtCol1">Category:</td><td class="editArtCol2">
                <asp:DropDownList ID="ddlCategory" CssClass="editArtStyle" runat="server" style="width:357px" required="">
                    <asp:ListItem Value="Drawing">Drawing</asp:ListItem>
                    <asp:ListItem Value="Painting">Painting</asp:ListItem>
                    <asp:ListItem Value="Photography">Photography</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                </asp:DropDownList></td></tr>

        <tr class="editArtRow"><td class="editArtCol1">Price:</td><td class="editArtCol2">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="editArtStyle" required="" type="number" step="0.10"></asp:TextBox></td></tr>

        <tr class="editArtRow"><td class="editArtCol1">Quantity:</td><td class="editArtCol2">
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="editArtStyle" required="" type="number"></asp:TextBox></td></tr>

    </table>

    <div id="btnStyle1">
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btnEditArtStyle" OnClientClick="Confirm to delete?;" OnClick="btnDelete_Click"/>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btnEditArtStyle"  OnClientClick="Updated successfully!" OnClick="btnUpdate_Click"/>
    </div>

    <div id="btnStyle2">
        <asp:Button ID="btnReturn" runat="server" Text="Return to Listing" CssClass="btnEditArtStyle" PostBackUrl="~/ArtistArtList.aspx"/>
    </div>

</div>

</asp:Content>


