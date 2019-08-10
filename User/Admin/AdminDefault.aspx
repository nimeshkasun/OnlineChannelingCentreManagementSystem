<%@ Page Title="Admin Search" Language="C#" MasterPageFile="~/User/Admin.master" AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="User_Nurse_NurseDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 35%;">&nbsp;</td>
            <td>
                <div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtSearchNurse" CssClass="input100" placeholder="PHN, NIC or Patient User ID" runat="server" Height="40px" OnTextChanged="txtSearchNurse_TextChanged"></asp:TextBox><span class="focus-input100"></span>
                </div>
            </td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSearchNurse" CssClass="login100-form-btn" runat="server" Text="Search" OnClick="btnSearchNurse_Click" Height="40px" BorderStyle="None" />
            </td>
            <td style="width: 35%;">&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <table style="width: 100%;">
        <tr>
            <td style="width: 30%;">
                <div style="text-align: center; background-color: blue; text-align: center; vertical-align: middle; width: 60%;">
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Staff Registration" Font-Size="Larger" ForeColor="White"></asp:Label><br />
                    <br />
                </div>
            </td>
            <td>&nbsp;</td>
            <td colspan="3">
                <div style="text-align: center; background-color: blue; text-align: center; vertical-align: middle;">
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Log Report" Font-Size="Larger" ForeColor="White"></asp:Label><br />
                    <br />
                </div>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top;">
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 60%">
                            <div class="wrap-input100 validate-input">
                                <asp:TextBox ID="txtuname" runat="server" Width="100%" CssClass="input100" placeholder="Username" OnTextChanged="txtuname_TextChanged"></asp:TextBox>
                                <span class="focus-input100"></span>
                            </div>

                        </td>
                        <td>
                            &nbsp; <asp:Label ID="lbl3" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="width: 25%">
                            <div class="wrap-input100 validate-input">
                                <asp:TextBox ID="txtpassword" runat="server" Width="100%" CssClass="input100" placeholder="Password" OnTextChanged="txtpassword_TextChanged" TextMode="Password"></asp:TextBox>
                                <span class="focus-input100"></span>
                            </div>
                        </td>
                        <td class="auto-style2">
                            &nbsp; <asp:Label ID="lbl1" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="width: 25%">
                            <div class="wrap-input100 validate-input">
                                <asp:TextBox ID="txtconfirmpassword" runat="server" Width="100%" CssClass="input100" placeholder="Confirm Password" OnTextChanged="txtconfirmpassword_TextChanged" TextMode="Password"></asp:TextBox>
                                <span class="focus-input100"></span>
                            </div>
                        </td>
                        <td class="auto-style2">
                            &nbsp; <asp:Label ID="lbl2" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="width: 25%">
                            <div class="wrap-input100 validate-input">
                                <asp:TextBox ID="txtemail" runat="server" Width="100%" CssClass="input100" placeholder="Email" OnTextChanged="txtemail_TextChanged" TextMode="Email"></asp:TextBox>
                                <span class="focus-input100"></span>
                            </div>
                        </td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="width: 25%">
                            <div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="drpStaffType" runat="server" Width="100%" Height="40px" CssClass="input100">
                                    <asp:ListItem Value="admin">Admin</asp:ListItem>
                                    <asp:ListItem Value="doctor">Doctor</asp:ListItem>
                                    <asp:ListItem Value="nurse">Nurse</asp:ListItem>
                                </asp:DropDownList>
                                <span class="focus-input100"></span>
                            </div>
                        </td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td style="width: 25%;">
                            <asp:Button ID="btnsubmit" CssClass="login100-form-btn" runat="server" Text="Register" Width="100%" OnClick="btnreg_Click" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
            <td colspan="3">
                <div style="height: 500px; overflow: scroll;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="LoginLog">
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                            <asp:BoundField DataField="attempt" HeaderText="Attempt" SortExpression="attempt" />
                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                            <asp:BoundField DataField="type" HeaderText="User Type" SortExpression="type" />
                            <asp:BoundField DataField="id" HeaderText="Log ID" SortExpression="id" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="LoginLog" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT TOP (100) username, attempt, date, time, type, id FROM loginlog ORDER BY id DESC"></asp:SqlDataSource>
                </div>

            </td>
        </tr>
        <tr>
            <td style="width: 30%;">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 30%;">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 30%;">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
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
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" runat="Server">
</asp:Content>

