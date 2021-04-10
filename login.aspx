<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ArtAssignment.Login" %>

<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <link href="login.css" rel="stylesheet"/>
    <asp:Image ID="LoginBackground" runat="server" ImageUrl="~/Properties/LoginBackground.png" Height="600px" Width="1350px" />

    <div class="loginbox">
        
        <div class="userSelection" >
            <label class="loginchoicebtn" style="width: 175px">
            <asp:RadioButton ID="artistUser" runat="server" value="artistUser" Checked="true" TextAlign="Left" AutoPostBack="True"  GroupName="userType" />
                Artist
            </label>
            <label class="loginchoicebtn" style="width: 165px">
            <asp:RadioButton ID="customerUser" runat="server" value="customerUser" Checked="false" AutoPostBack="True" GroupName="userType" />
            Customer 
            </label>
        </div>

        <div class="loginTitle">Login</div>

        <div class="loginInput">
            <label style="color:white;font-size:18px;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">Email</label>
            <asp:TextBox ID="userEmail" runat="server" CssClass="inputField"></asp:TextBox>
        </div>

        <div class="loginInput">
            <label style="color:white;font-size:18px;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Password</label>
            <asp:TextBox ID="userPassword" runat="server" CssClass="inputField" TextMode="Password" ></asp:TextBox>
        </div>
        
        <div class="loginBtn">
            <asp:Button ID="loginSubmitBtn" CssClass="loginSubmitBtnStyle"  runat="server" Text="Log In" OnClick="loginSubmitBtn_Click"  />
        </div>
        
        <div id="forgetPass" style="padding-top:8px">
            <a href="forgetPassword.aspx" style="color:white;text-decoration:none;color:white;font-size:14px;" >Forget Password</a>
        </div>

    </div>

</asp:Content>
