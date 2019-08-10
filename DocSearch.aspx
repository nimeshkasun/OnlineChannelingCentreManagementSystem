<%@ Page Title="Doctor Availability" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DocSearch.aspx.cs" Inherits="DocSearch" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 20%;
            height: 27px;
        }
        .auto-style3 {
            height: 27px;
        }
        .Background {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .Popup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 60%;
            height: 50%;
        }

        .lbl {
            font-size: 16px;
            font-style: italic;
            font-weight: bold;
        }
    </style>
    <link href="css/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <div style="text-align: center">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Available Times"></asp:Label>
        <br /><br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <table style="width:100%;">
            <tr>
                <td rowspan="5" style="width: 10%">
                    <asp:Image ID="Image1" runat="server" Height="107px" Width="117px" BorderStyle="Double" />
                </td>
                <td rowspan="5" style="width: 5%">
                    &nbsp;</td>
                <td style="width: 20%">
                    <asp:Label ID="lbldocname" runat="server" Text="Name" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 20%">
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <asp:Label ID="lblspcializedarea" runat="server" Text="Specialist Area" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 20%">
                    <asp:Label ID="lblSpecArea" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lbldescription" runat="server" Text="Other" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblOther" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="width: 20%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div>
        <hr style="width: 100%" />
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Number of sessions:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblNoSessions" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
        </table>
    </div>
    <div><hr style="width: 100%" /></div>
    <div>
        <br />
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="margin-top: 1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderStyle="None">
            <Columns>
                <asp:BoundField DataField="No_of_patient" HeaderText="Available Slots" SortExpression="No_of_patient" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"  ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time"  ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" ItemStyle-HorizontalAlign="Center"  />
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass='login100-form-btn'  ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Availability], [No_of_patient], [Date], [time] FROM [Appointment_date] WHERE ([Doctor_ID] = @Doctor_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label6" Name="Doctor_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button2" BackgroundCssClass="Background" CancelControlID="btnClose" PopupControlID="Panel1"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="Panel1" runat="server" CssClass="Popup">
            <div style="background-color: #0000FF; width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td>&nbsp;<asp:Label ID="Label22" runat="server" Text="Book Appointment" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label></td>
                        <td style="text-align: right;">
                            <asp:Button ID="btnClose" runat="server" BorderStyle="None" Text="✖" BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Size="Large" /></td>
                    </tr>
                </table>
            </div>
            <div>
                <table style="width: 100%;">
                    <caption>
                        <br />
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label2" runat="server" Text="Patient ID" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 10%">
                                <asp:Label ID="Label3" runat="server" Text="Doctor" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label23" runat="server" Text="Patient Name" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:TextBox ID="TextBox5" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 10%">
                                <asp:Label ID="Label8" runat="server" Text="Specialization" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:TextBox ID="TextBox4" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label4" runat="server" Text="Reserving Date" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 25%">
                                <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 10%">
                                &nbsp;</td>
                            <td style="width: 25%">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </caption>
                </table>
            </div>
            
            <hr style="border-style: none; height: 5px; width: 100%; background-color: #FFFFFF;" />
            <br />
            <div style="text-align:right;">
                
                <asp:Button ID="Button1" runat="server" CssClass="login100-form-btn" Text="Make Appointment" BackColor="Blue" BorderStyle="None" Font-Bold="True" ForeColor="White" OnClick="Button1_Click" Width="200px" />
                <br /><br />
                
            </div>
        </asp:Panel><asp:Button ID="Button2" runat="server" Enabled="False" Height="0px" Width="0px" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

