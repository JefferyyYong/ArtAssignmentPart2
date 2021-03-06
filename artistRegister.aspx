<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="artistRegister.aspx.cs" Inherits="ArtAssignment.ArtistRegister" %>

<asp:Content ID="homepagecontent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    
    <link href="register.css" rel="stylesheet"/>
    
    <asp:Image ID="aRegisterBackground" runat="server" Height="600px" ImageUrl="~/Properties/LoginBackground.png" Width="1350px" />

    <div class="registerBox">
        <table class="registerForm">
            <tr>
                <td class="registerTitle">
                    <span class="registerTitleTxt">
                    Artist Registration</span>
                </td>
            </tr>
            <tr>
                <td class="registerSection">
                    First Name</td>
            </tr>
            <tr>
                <td>

                    <asp:TextBox ID="aFNameTxt" CssClass="nametxt" runat="server" required="" MaxLength="30" placeholder="Eg:Alex" autofocus="autofocus"></asp:TextBox>

                </td>
            </tr>
            
            <tr><td></td></tr>
            
            <tr>
                <td class="registerSection">
                    Last Name
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:TextBox ID="aLNameTxt" CssClass="nametxt" runat="server" required="" MaxLength="30" placeholder="Eg:Yong" ></asp:TextBox>
                </td>
            </tr>

            <tr><td></td></tr>

            <tr>
                <td class="registerSection">
                    Gender
                </td>
            </tr>

            <tr>
                <td>
                    <asp:RadioButton ID="aGenderBtn1"  runat="server" Checked="True" value="M" GroupName="gender"/><span style="font-weight:900">Male</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="aGenderBtn2"  runat="server" value="F" GroupName="gender" /><span style="font-weight:900">Female</span>
                </td>
            </tr>

            <tr><td></td></tr>

            <tr>
                <td class="registerSection">
                    Phone Number
                </td>
            </tr>

            <tr>
                <td>
                    <asp:TextBox ID="aPhoneNo" CssClass="nametxt" runat="server" MaxLength="11" placeholder="Eg:0123456789" ></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Phone No cannot have alphabet inside" ControlToValidate="phoneNo" ValidationExpression="\d{11}" ForeColor="Red">*Phone Number can only contain number</asp:RegularExpressionValidator>--%>
                </td>
            </tr>

            <tr>
                <td class="registerSection">
                    Email
                </td>
            </tr>

            <tr>
                <td>
                    <asp:TextBox ID="aUserEmail" runat="server" CssClass="nametxt" placeholder="Eg: alex123@xxx.com" MaxLength="50"></asp:TextBox><span style="color:red">*</span>
                </td>
            </tr>

            <tr>
                <td>
                   <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Incorrect email format" foreColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="userEmail">*Must follow email-format</asp:RegularExpressionValidator>--%>
                </td>
            </tr>

            <tr>
                <td class="registerSection">
                    Password
                </td>
            </tr>

            <tr>
                <td>
                    <asp:TextBox ID="aPassword" runat="server" CssClass="nametxt" required="" TextMode="Password"></asp:TextBox><span style="color:red">*</span>
                </td>
            </tr>

            <tr>
                <td>
                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="The password required to consist 6 character" ForeColor="Red" ValidationExpression="\{11}">*The password need to consist 6 character</asp:RegularExpressionValidator>--%>
                </td>
            </tr>

            <tr>
                <td class="registerSection">
                    Comfirm Password
                </td>
            </tr>

            <tr>
                <td>
                    <asp:TextBox ID="aComfirmPass" CssClass="nametxt" runat="server" required="" TextMode="Password"></asp:TextBox><span style="color:red">*</span>
                </td>
            </tr>

            <tr>
                <td>
                   <%-- <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToCompare="confirmPass" ForeColor="Red">*Password does not match</asp:CompareValidator> --%>
                </td>
            </tr>

            <tr>
                <td class="submitBtnStyle">
                    <asp:Button ID="aRegisterBtn" CssClass="submitBtnStyle2" runat="server" Text="Submit" OnClick="RegisterBtn_Click" />
                </td>
            </tr>
        </table>
    </div>
    

</asp:Content>