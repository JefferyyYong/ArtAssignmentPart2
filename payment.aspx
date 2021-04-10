<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="ArtAssignment.payment" %>


<asp:Content ID="payment11" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  

    <style>
        .paymentTable {
    background: url("Properties/BlueBackground.jpg");
    margin: auto;
    width: 70%;
    padding: 50px;
}
    </style>

 <link href="Payment.css" rel="stylesheet">
    <table class="paymentTable">
        <tr><td>Type: </td><td>
        <asp:RadioButton ID="rbtnVisa" runat="server" Text="Visa" GroupName="userType"/><asp:RadioButton ID="rbtnMastercard" runat="server" Text="Mastercard" GroupName="userType"/></td></tr>

        <tr>
            <td>Full name: </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" required=""></asp:TextBox></td>
        </tr>

        <tr>
            <td>Card number: </td>
            <td>
                <asp:TextBox ID="txtNum" runat="server" required=""></asp:TextBox></td>
        </tr>

         <tr>
            <td>Expiry MM/YY: </td>
            <td>
                <asp:TextBox ID="txtExpiry" runat="server" required=""></asp:TextBox></td>
        </tr>

        <tr>
            <td>CVC Number:</td>
            <td><asp:TextBox ID="txtCVC" runat="server" required=""></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" />
                </td>
        </tr>
    </table>

</asp:Content>
