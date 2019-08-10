<%@ Page Title="Search by Specialty" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SpecSearch.aspx.cs" Inherits="SpecSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="css/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <div style="text-align: center">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Available Doctors"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <br />
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="First_name" HeaderText="First_name" SortExpression="First_name" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Working_hospital" HeaderText="Working_hospital" SortExpression="Working_hospital" ItemStyle-HorizontalAlign="Center" />
            <asp:ButtonField CommandName="Select" Text="Check Available Times" ButtonType="Button" ControlStyle-CssClass="login100-form-btn" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [First_name], [Working_hospital] FROM [Doctor] WHERE ([Specialized_area] = @Specialized_area)">
            <SelectParameters>
                <asp:SessionParameter Name="Specialized_area" SessionField="specarea" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" Runat="Server">
</asp:Content>

