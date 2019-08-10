<%@ Page Title="Nurse Search" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="NurseDefault.aspx.cs" Inherits="User_Nurse_NurseDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtSearchNurse"  CssClass="input100" placeholder="PHN or NIC"  runat="server" Height="40px" OnTextChanged="txtSearchNurse_TextChanged"></asp:TextBox><span class="focus-input100"></span>
</div>
            </td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSearchNurse" CssClass="login100-form-btn" runat="server" Text="Search" OnClick="btnSearchNurse_Click" Height="40px" BorderStyle="None" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

