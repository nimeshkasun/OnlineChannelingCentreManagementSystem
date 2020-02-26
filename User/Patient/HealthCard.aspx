<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HealthCard.aspx.cs" Inherits="User_Admin_HealthCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Health Card</title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br /><br /><br /><br /><br />
    <div>
        <center>
            <div style="border: 1px solid #FF0000; width: 30%;">
                <div style="color: #FFFFFF; background-color: #FF0000; text-transform: uppercase; font-weight: bold;">
                    <br />
                    <asp:Label ID="lblfname" runat="server" Text="N/A" Font-Bold="True" Font-Size="X-Large"></asp:Label> &nbsp;
                    <asp:Label ID="lbllname" runat="server" Text="N/A" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br /><br />
                </div>

                <div style="background-color: #CCFFFF">

                    <table style="width:100%; ">
                        <tr>
                            <td rowspan="2" style="width: 25%; height: 80px;">
                                <asp:Image ID="Image1" runat="server" AlternateText="QR" Height="95%" ImageAlign="Middle" Width="95%" />
                            </td>
                            <td style="width: 42px">
                                <asp:Label ID="phn" runat="server" align="center" BackColor="#0099FF" ForeColor="White" Text="PHN" Width="40px" BorderColor="#0099FF" BorderStyle="Solid" BorderWidth="2px"></asp:Label>
                            </td>
                            <td style="text-align: left;">
                                 &nbsp; <asp:Label ID="lblPHN" runat="server" Text="N/A" Width="90%" Font-Bold="True"></asp:Label>
                            </td>
                            <td rowspan="2" style="width: 20%;">
                                <asp:Label ID="bGroup" runat="server" BackColor="Red" BorderColor="Red"  style="text-align:center;" BorderStyle="Solid" BorderWidth="10px" Font-Bold="True" ForeColor="White" Text="N/A" Font-Size="X-Large" Width="50px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 42px">
                                <asp:Label ID="Label5" runat="server" align="center" BackColor="#0099FF" ForeColor="White" Text="NIC" Width="40px" BorderColor="#0099FF" BorderStyle="Solid" BorderWidth="2px"></asp:Label>
                            </td>
                            <td class="auto-style1" style="text-align: left;">
                                &nbsp;  <asp:Label ID="lblNIC" runat="server" Text="N/A" Width="90%" Font-Bold="True"></asp:Label>
                            </td>
                            
                        </tr>
                        </table>

                </div>
                <div>

                    <table style="border: 5px solid #FFFFFF; width:100%; text-align:left;">
                        <tr>
                            <td colspan="2" style="width: 52px"><br />
                                <asp:Label ID="lblAddress" runat="server" Text="N/A" Font-Bold="True"></asp:Label><br /><br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 52px">
                                <asp:Label ID="Label6" runat="server" Text="Mobile" BackColor="#CCFFFF" Width="50px"></asp:Label>
                            </td>
                            <td>
                                &nbsp;  <asp:Label ID="lblmobile" runat="server" Text="N/A" Width="90%" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 52px">
                                <asp:Label ID="Label7" runat="server" Text="Home" BackColor="#CCFFFF" Width="50px"></asp:Label>
                            </td>
                            <td>
                                &nbsp;  <asp:Label ID="lblhome" runat="server" Text="N/A" Width="90%" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
                <div style="text-align: right">

                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/logo.png" Width="50px" />

                </div>
            </div>
        </center>
    </div>
        <br />
        <div style="text-align:center;">
            <asp:Button ID="Button1" CssClass="login100-form-btn" runat="server" Text="&lt; Back to Dashboard" BackColor="Blue" ForeColor="White" Height="35px" Width="200px" OnClick="Button1_Click" /> &nbsp;
            <asp:Button ID="Button2" CssClass="login100-form-btn" runat="server" Text="Print" BackColor="Blue" ForeColor="White" Height="35px" Width="200px" />
            <br />
        </div>
    </form>
</body>
</html>
