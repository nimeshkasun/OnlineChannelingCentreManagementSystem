<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="css/main.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="FeaturedContent">
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
        <div style="text-align: center">
            <div style="height: 6px">
            </div>
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="20pt" ForeColor="Blue" Text="Channel Your Doctor"></asp:Label>
            &nbsp;&nbsp;
            
        </div>
        <br />
        <div>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 30%">&nbsp;</td>
                    <td style="border: 3px solid #3333FF; padding: 30px; width: 40%; text-align: center; background-color: #FFFFFF;">

                        <div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="drpDoctor" CssClass="input100" placeholder="Doctor" runat="server" Width="100%" Height="25px" DataSourceID="SqlDataSource1" DataTextField="Last_name" DataValueField="Last_name" ToolTip="Select Doctor" OnSelectedIndexChanged="drpDoctor_SelectedIndexChanged">
                            </asp:DropDownList><span class="focus-input100"></span>
                        </div>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [Doctor_ID], [Last_name] FROM [Doctor]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                        <br />
                        <br />
                        <div style="text-align: right;">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Expand</asp:LinkButton>
                        </div>
                        <br />
                        <div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="drpSpecialization" CssClass="input100" placeholder="Specialization" runat="server" Width="100%" Height="25px" Visible="False" ToolTip="Select Specialization" DataSourceID="SpecHome" DataTextField="Specialization" DataValueField="Specialization" OnSelectedIndexChanged="drpSpecialization_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SpecHome" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [Specialization] FROM [Doc_Sup] ORDER BY [Specialization]"></asp:SqlDataSource>
                            <span class="focus-input100"></span>
                        </div>
                        <br />
                        <br />
                        <div class="wrap-input100 validate-input">
                            <asp:Button ID="btnSearch" CssClass="input100" placeholder="Username" runat="server" Text="Search" Width="100%" BorderWidth="0px" ForeColor="White" Height="30px" OnClick="btnSearch_Click" BackColor="Blue" />
                            <span class="focus-input100"></span>
                        </div>

                    </td>
                    <td style="width: 30%">&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
    </div>
    <br />
    <div style="text-align: center">
        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/Home/Home_Buttons_card.png" Width="200px" OnClick="ImageButton2_Click" />
        &nbsp; &nbsp;
        <asp:ImageButton ID="btnHR" runat="server" ImageUrl="~/Images/Home/Home_Buttons_heart.png" Width="200px" AlternateText="Health Records" BorderStyle="None" OnClick="btnHR_Click1" />&nbsp;&nbsp;
    <asp:ImageButton ID="btnLR" runat="server" ImageUrl="~/Images/Home/Home_Buttons_lab.png" Width="200px" AlternateText="Lab Reports" BorderStyle="None" OnClick="btnLR_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="btnMed" runat="server" ImageUrl="~/Images/Home/Home_Buttons_pills.png" Width="200px" AlternateText="Medicine" BorderStyle="None" OnClick="btnMed_Click" />
       
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" runat="Server">
</asp:Content>



