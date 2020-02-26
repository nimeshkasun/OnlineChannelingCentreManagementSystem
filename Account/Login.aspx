<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <link href="../css/main.css" rel="stylesheet" />
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
            width: 30%;
            height: 20px;
        }
        .auto-style6 {
            width: 30%;
        }
        .auto-style7 {
            height: 27px;
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 150px"></div>
    <table style="width:100%;" >
        <tr>
            <td style="width:20%;">&nbsp;</td>
            <td style="width:40%;">
                <div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtuname" CssClass="input100" placeholder="Username" runat="server"  Width="100%" class="input100" OnTextChanged="txtuname_TextChanged"></asp:TextBox>
                    <span class="focus-input100"></span>
				</div>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            
            <td class="auto-style7">
                                <div class="wrap-input100 validate-input">
                <asp:TextBox ID="txtpassword" CssClass="input100" placeholder="Password" runat="server" Width="100%" TextMode="Password" OnTextChanged="txtpassword_TextChanged"></asp:TextBox>
                                                        <span class="focus-input100"></span>
                                    </div>
            </td>
            <td class="auto-style2"></td>
        </tr>

        <tr>
            <td class="auto-style3" ></td>
            <td class="auto-style5">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Login" Width="100%" /><br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
            </td>
            <td class="auto-style3">
                
					 <asp:Button CssClass="login100-form-btn" ID="btnlogin" runat="server" Text="Login" Width="85px" OnClick="btnlogin_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" />
				
            </td>
        </tr>
        <tr>
            <td class="auto-style3" ></td>
            <td class="auto-style5">
                </td>
            <td class="auto-style3">
             
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnreg" runat="server" CssClass="login100-form-btn" Text="Register" Width="100px" OnClick="btnreg_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

