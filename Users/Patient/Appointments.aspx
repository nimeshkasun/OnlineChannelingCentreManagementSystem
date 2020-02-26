<%@ Page Title="Appointments" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Appointments.aspx.cs" Inherits="User_Admin_Appointments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <dev>
        <br /><br />
    </dev>
    <table style="width: 100%;">
        <tr>
            <td style="width: 15%;"><div class="wrap-input100 validate-input">
    <asp:TextBox ID="txtFilFrom"  CssClass="input100" placeholder="From" runat="server" Height="30px" Width="100%" ></asp:TextBox><span class="focus-input100"></span>
</div>
            </td>
            <td style="width: 3%;">
    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/User/Doctor/Images/Buttons/calIcon.png" BorderStyle="None" style="background-color: transparent;" />
            </td>
            <td style="width: 1%;">&nbsp;</td>
            <td style="width: 15%;"><div class="wrap-input100 validate-input">
    <asp:TextBox ID="txtFilTo" CssClass="input100" placeholder="To"  runat="server" Height="30px" Width="100%" ></asp:TextBox><span class="focus-input100"></span>
</div>
    
            </td>
            <td style="width: 3%;">
    
    <asp:ImageButton ID="ImageButton2" runat="server" Height="30px" ImageUrl="~/User/Doctor/Images/Buttons/calIcon.png" BorderStyle="None" style="background-color: transparent;"/>
            </td>
            <td style="width: 10%;">
    <asp:Button ID="Button3"  CssClass="login100-form-btn" runat="server" Text="Filter" OnClick="Button3_Click" BackColor="Blue" ForeColor="White" Height="30px" BorderStyle="None" />

            </td>
            <td>&nbsp;</td>
            <td style="width: 10%;">
                <asp:Button ID="Button4"  CssClass="login100-form-btn" runat="server" Text="Today Appointments" BackColor="Blue" ForeColor="White" Height="30px" BorderStyle="None" OnClick="Button4_Click" Width="200px"/>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="ImageButton1" TargetControlID="txtFilFrom" Format="yyyy-MM-dd" FirstDayOfWeek="Monday" />
    
    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="ImageButton2" TargetControlID="txtFilTo" Format="yyyy-MM-dd" FirstDayOfWeek="Monday" />

<%--    DataSourceID="SqlDataSource1"--%>
    
    <div><asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
        <Columns>
            
            <asp:BoundField DataField="Channel_no" HeaderText="Channel No" ReadOnly="True" SortExpression="Channel_no" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="35px" />
            <asp:BoundField DataField="First_name" HeaderText="Doctor Name" SortExpression="First_name" ItemStyle-HorizontalAlign="Center"  />
            <asp:BoundField DataField="Patient_ID" HeaderText="Patient ID" SortExpression="Patient_ID" ItemStyle-HorizontalAlign="Center"  />
            <asp:BoundField DataField="Last_name" HeaderText="Patient Name" SortExpression="Last_name" ItemStyle-HorizontalAlign="Center"  />
            <asp:BoundField DataField="chan_date" HeaderText="Channel Date" SortExpression="chan_date" ItemStyle-HorizontalAlign="Center"  />
            <%--<asp:CommandField SelectText="CheckIn" ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="login100-form-btn" ItemStyle-Width="10%"  ItemStyle-HorizontalAlign="Center" />--%>
        </Columns>
    </asp:GridView>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Channel_no, Patient_ID, Doctor_ID, chan_date FROM Channel WHERE (Patient_ID = @Patient_ID) ORDER BY chan_date DESC">
            <SelectParameters>
                <asp:SessionParameter Name="Patient_ID" SessionField="ApptPat_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        </div>
    <div>
    
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

