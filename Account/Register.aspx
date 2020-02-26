<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 100px"></div>
    <table style="width:100%;">
        <tr>
            <td style="width: 20%">&nbsp;</td>
            
            <td style="width: 40%">
                <div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtuname" runat="server" Width="100%" CssClass="input100" placeholder="Username" OnTextChanged="txtuname_TextChanged"></asp:TextBox>
	                <span class="focus-input100"></span>
                </div>
                
            </td>
            <td>
                &nbsp; <asp:Label ID="lbl3" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2" style="width: 25%">
                 <div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtpassword" runat="server" Width="100%" CssClass="input100" placeholder="Password" OnTextChanged="txtpassword_TextChanged" TextMode="Password"></asp:TextBox>  <span class="focus-input100"></span>
                </div>
            </td>
            <td class="auto-style2">
                &nbsp; <asp:Label ID="lbl1" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2" style="width: 25%"> <div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtconfirmpassword" runat="server" Width="100%" CssClass="input100" placeholder="Confirm Password" OnTextChanged="txtconfirmpassword_TextChanged" TextMode="Password"></asp:TextBox>  <span class="focus-input100"></span>
                </div>
            </td>
            <td class="auto-style2">
                &nbsp; <asp:Label ID="lbl2" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2" style="width: 25%"> <div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtemail" runat="server" Width="100%" CssClass="input100" placeholder="Email" OnTextChanged="txtemail_TextChanged" TextMode="Email"></asp:TextBox>  <span class="focus-input100"></span>
                </div>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td style="height:20px;" >&nbsp;</td>
            <td style="width: 25%;">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnsubmit" CssClass="login100-form-btn" runat="server" Text="Register" Width="100px" OnClick="btnreg_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 25%">
                <asp:Button ID="btnreg" CssClass="login100-form-btn" runat="server" Text="&lt; Back to Login" OnClick="btnlogin_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" Width="180px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

