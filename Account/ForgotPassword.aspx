<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            height: 27px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style4 {
            width: 15%;
            height: 20px;
        }
        .auto-style5 {
            width: 25%;
            height: 20px;
        }
        .auto-style6 {
            width: 25%;
        }
        .auto-style7 {
            height: 27px;
            width: 25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 140px"></div>
    <table style="width:100%;">
        <tr>
            <td style="width:20%;">&nbsp;</td>
            <td style="width:40%;"><div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtuname" runat="server" Width="100%" CssClass="input100" placeholder="Username" OnTextChanged="txtuname_TextChanged" ></asp:TextBox>	<span class="focus-input100"></span>
</div>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style7"><div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtemail" runat="server" Width="100%" TextMode="Email" CssClass="input100" placeholder="Email" OnTextChanged="txtemail_TextChanged" ></asp:TextBox>	<span class="focus-input100"></span>
</div>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style7"><div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtnic" runat="server" Width="100%"  CssClass="input100" placeholder="NIC Number" OnTextChanged="txtnic_TextChanged" ></asp:TextBox>	<span class="focus-input100"></span>
</div>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style3" ></td>
            <td class="auto-style5">
                </td>
            <td class="auto-style3">
                <asp:Button ID="btnRetrieve" CssClass="login100-form-btn" runat="server" Text="Retrieve" Width="100px" OnClick="btnlogin_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnBackLogin" CssClass="login100-form-btn" runat="server" Text="&lt; Back to Login" Width="180px" OnClick="btnreg_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

