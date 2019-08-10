<%@ Page Title="Account" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="User_Admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        .auto-style2 {
            height: 50px;
        }

        .auto-style3 {
            width: 10px;
            height: 50px;
        }

        .auto-style4 {
            height: 27px;
        }

        .auto-style5 {
            width: 20%;
            height: 27px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <br />
        <table style="width: 100%;">
            <tr>

                <td style="width: 100%; text-align: center">
                    &nbsp;&nbsp;</td>

            </tr>
        </table>
    </div>
    <br />
    <div style="text-align: center">
        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="N/A"></asp:Label>
    </div>
    <div style="text-align: center">

        <asp:Label ID="lblPhn" runat="server" Text="N/A"></asp:Label>
        <br />
        <br />
    </div>

    <div style="text-align: right">
        <asp:Button ID="Button1" CssClass="login100-form-btn" runat="server" Text="Retrieve Data" BackColor="Blue" ForeColor="White" OnClick="Button1_Click" Height="35px" Width="200px" />
        <br />
    </div>
    <br />
    <div style="background-color: #0000FF">
        &nbsp;
        <asp:Label ID="Label1" runat="server" Text="Personal Profile" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
    </div>
    <br />
    <div>
        <table style="width: 100%;">
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList1"  CssClass="input100" placeholder="Title"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem Value="0">Mr.</asp:ListItem>
                        <asp:ListItem Value="1">Mrs.</asp:ListItem>
                        <asp:ListItem Value="2">Miss.</asp:ListItem>
                        <asp:ListItem Value="3">Rev.</asp:ListItem>
                        <asp:ListItem Value="4">Ms.</asp:ListItem>
                        <asp:ListItem Value="5">Baby</asp:ListItem>
                        <asp:ListItem Value="6">Mast.</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>
                    <asp:HiddenField ID="H1" runat="server" />
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="First Name"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Last name"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox1"  CssClass="input100" placeholder="First Name"  runat="server" Style="width: 100%"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td class="auto-style3"></td>
                <td class="auto-style2"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox2" Style="width: 100%"  CssClass="input100" placeholder="Last Name"  runat="server"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td class="auto-style3"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Specialized Area"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Working Hospital"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td><asp:Label ID="Label22" runat="server" Text="Salary"></asp:Label></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList12"  CssClass="input100" placeholder="Specialized Area"  runat="server" Height="30px" Width="100%" DataSourceID="Spec_data" DataTextField="Specialization" DataValueField="Specialization">

                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                    <asp:SqlDataSource ID="Spec_data" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [Specialization] FROM [Doc_Sup] ORDER BY [Specialization]"></asp:SqlDataSource>
                </td>
                <td class="auto-style3"></td>
                <td class="auto-style2"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList13"  CssClass="input100" placeholder="Working Hospital"  runat="server" DataSourceID="Hospitals_data" DataTextField="Hospitals" DataValueField="Hospitals" Height="30px" Width="100%">
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                    <asp:SqlDataSource ID="Hospitals_data" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [Hospitals] FROM [Doc_Sup] ORDER BY [Hospitals]"></asp:SqlDataSource>
                </td>
                <td class="auto-style3"></td>
                <td class="auto-style2"><div class="wrap-input100 validate-input"><asp:TextBox ID="TextBox14"  CssClass="input100" placeholder="Salary"  Style="width: 100%" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList11"  CssClass="input100" placeholder="Gender"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem Value="0">Male</asp:ListItem>
                        <asp:ListItem Value="1">Female</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Date of Birth"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList3"  CssClass="input100" placeholder="Date"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList4"  CssClass="input100" placeholder="Month"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList5"  CssClass="input100" placeholder="Year"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>1930</asp:ListItem>
                        <asp:ListItem>1931</asp:ListItem>
                        <asp:ListItem>1932</asp:ListItem>
                        <asp:ListItem>1933</asp:ListItem>
                        <asp:ListItem>1934</asp:ListItem>
                        <asp:ListItem>1935</asp:ListItem>
                        <asp:ListItem>1936</asp:ListItem>
                        <asp:ListItem>1937</asp:ListItem>
                        <asp:ListItem>1938</asp:ListItem>
                        <asp:ListItem>1939</asp:ListItem>
                        <asp:ListItem>1940</asp:ListItem>
                        <asp:ListItem>1941</asp:ListItem>
                        <asp:ListItem>1942</asp:ListItem>
                        <asp:ListItem>1943</asp:ListItem>
                        <asp:ListItem>1944</asp:ListItem>
                        <asp:ListItem>1945</asp:ListItem>
                        <asp:ListItem>1946</asp:ListItem>
                        <asp:ListItem>1947</asp:ListItem>
                        <asp:ListItem>1948</asp:ListItem>
                        <asp:ListItem>1949</asp:ListItem>
                        <asp:ListItem>1950</asp:ListItem>
                        <asp:ListItem>1951</asp:ListItem>
                        <asp:ListItem>1952</asp:ListItem>
                        <asp:ListItem>1953</asp:ListItem>
                        <asp:ListItem>1954</asp:ListItem>
                        <asp:ListItem>1955</asp:ListItem>
                        <asp:ListItem>1956</asp:ListItem>
                        <asp:ListItem>1957</asp:ListItem>
                        <asp:ListItem>1958</asp:ListItem>
                        <asp:ListItem>1959</asp:ListItem>
                        <asp:ListItem>1960</asp:ListItem>
                        <asp:ListItem>1961</asp:ListItem>
                        <asp:ListItem>1962</asp:ListItem>
                        <asp:ListItem>1963</asp:ListItem>
                        <asp:ListItem>1964</asp:ListItem>
                        <asp:ListItem>1965</asp:ListItem>
                        <asp:ListItem>1966</asp:ListItem>
                        <asp:ListItem>1967</asp:ListItem>
                        <asp:ListItem>1968</asp:ListItem>
                        <asp:ListItem>1969</asp:ListItem>
                        <asp:ListItem>1970</asp:ListItem>
                        <asp:ListItem>1971</asp:ListItem>
                        <asp:ListItem>1972</asp:ListItem>
                        <asp:ListItem>1973</asp:ListItem>
                        <asp:ListItem>1974</asp:ListItem>
                        <asp:ListItem>1975</asp:ListItem>
                        <asp:ListItem>1976</asp:ListItem>
                        <asp:ListItem>1977</asp:ListItem>
                        <asp:ListItem>1978</asp:ListItem>
                        <asp:ListItem>1979</asp:ListItem>
                        <asp:ListItem>1980</asp:ListItem>
                        <asp:ListItem>1981</asp:ListItem>
                        <asp:ListItem>1982</asp:ListItem>
                        <asp:ListItem>1983</asp:ListItem>
                        <asp:ListItem>1984</asp:ListItem>
                        <asp:ListItem>1985</asp:ListItem>
                        <asp:ListItem>1986</asp:ListItem>
                        <asp:ListItem>1987</asp:ListItem>
                        <asp:ListItem>1988</asp:ListItem>
                        <asp:ListItem>1989</asp:ListItem>
                        <asp:ListItem>1990</asp:ListItem>
                        <asp:ListItem>1991</asp:ListItem>
                        <asp:ListItem>1992</asp:ListItem>
                        <asp:ListItem>1993</asp:ListItem>
                        <asp:ListItem>1994</asp:ListItem>
                        <asp:ListItem>1995</asp:ListItem>
                        <asp:ListItem>1996</asp:ListItem>
                        <asp:ListItem>1997</asp:ListItem>
                        <asp:ListItem>1998</asp:ListItem>
                        <asp:ListItem>1999</asp:ListItem>
                        <asp:ListItem Selected="True">2000</asp:ListItem>
                        <asp:ListItem>2001</asp:ListItem>
                        <asp:ListItem>2002</asp:ListItem>
                        <asp:ListItem>2003</asp:ListItem>
                        <asp:ListItem>2004</asp:ListItem>
                        <asp:ListItem>2005</asp:ListItem>
                        <asp:ListItem>2006</asp:ListItem>
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="NIC No."></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Passport No."></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox3" Style="width: 100%;"  CssClass="input100" placeholder="NIC Number"  runat="server"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox4" runat="server"  CssClass="input100" placeholder="Passport Number"  Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            
        </table>
    </div>
    <div style="text-align: right;">
        <br />
        <asp:Button ID="btnPP" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="80px" OnClick="btnPP_Click" />
        <br />
    </div>
    <br />
    <div style="background-color: #0000FF">
        &nbsp;
        <asp:Label ID="Label12" runat="server" Text="Contact Profile" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
    </div>
    <br />
    <div>

        <table style="width: 100%;">
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label13" runat="server" Text="Contact (Mobile)"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">
                    <asp:Label ID="Label14" runat="server" Text="Contact (Home)"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">
                    <asp:Label ID="Label21" runat="server" Text="Contact (Office)"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox7" CssClass="input100" placeholder="Contact (Mobile)"   runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox8"  CssClass="input100" placeholder="Contact (Home)"  Style="width: 100%;" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox9" CssClass="input100" placeholder="Contact (Office)"   runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label15" runat="server" Text="Address"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox10" CssClass="input100" placeholder="Address"   runat="server" Style="width: 100%;" Height="50px" TextMode="MultiLine" EnableTheming="True"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label16" runat="server" Text="Country"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">
                    <asp:Label ID="Label17" runat="server" Text="Province"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList7"  CssClass="input100" placeholder="Country"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>Sri Lanka</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="DropDownList6"  CssClass="input100" placeholder="Province"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>Central</asp:ListItem>
                        <asp:ListItem>Eastern</asp:ListItem>
                        <asp:ListItem>Nothern</asp:ListItem>
                        <asp:ListItem>Southern</asp:ListItem>
                        <asp:ListItem>Western</asp:ListItem>
                        <asp:ListItem>North Western</asp:ListItem>
                        <asp:ListItem>North Central</asp:ListItem>
                        <asp:ListItem>Uva</asp:ListItem>
                        <asp:ListItem>Sabaragamuwa</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label18" runat="server" Text="ZIP/ Postal code"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox11"  CssClass="input100" placeholder="ZIP/Postal Code"  Style="width: 100%;" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label19" runat="server" Text="Emergency Contact Person (Name)"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">
                    <asp:Label ID="Label20" runat="server" Text="Emergency Contact Mobile Number"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox12"  CssClass="input100" placeholder="Emergency Contact Person (Name)"  runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="TextBox13" CssClass="input100" placeholder="Emergency Contact Mobile Number"   runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="text-align: right;">
        <br />
        <asp:Button ID="Button2" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="80px" OnClick="Button2_Click1" />
   
    </div>
    <br />
    <br />
    <div style="background-color: #0000FF">
        &nbsp;
        <asp:Label ID="Label28" runat="server" Text="Security" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
    </div>
    <br />
    <div>
    <table style="width:100%;">
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 40%"><div class="wrap-input100 validate-input">
                <asp:TextBox ID="TextBox16"  CssClass="input100" placeholder="Current Password"  runat="server" BorderStyle="None" Width="100%" TextMode="Password"></asp:TextBox><span class="focus-input100"></span>
</div>
            </td>
            <td>
                &nbsp; &nbsp; <asp:Label ID="Label33" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 40%"><div class="wrap-input100 validate-input">
                <asp:TextBox ID="TextBox17"  CssClass="input100" placeholder="New Password"  runat="server" BorderStyle="None" Width="100%" TextMode="Password"></asp:TextBox><span class="focus-input100"></span>
</div>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4" style="width: 25%"></td>
            <td class="auto-style5"><div class="wrap-input100 validate-input">
                <asp:TextBox ID="TextBox18" CssClass="input100" placeholder="Confirm New Password"   runat="server" BorderStyle="None" Width="100%" TextMode="Password"></asp:TextBox><span class="focus-input100"></span>
</div>
            </td>
            <td class="auto-style4">
                &nbsp;  &nbsp; <asp:Label ID="Label32" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 40%">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 40%">&nbsp;</td>
            <td>
        <div style="text-align: right;">
        <br />
        <asp:Button ID="Button3" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="80px" OnClick="Button3_Click2" />
        <br />
    </div>

            </td>
        </tr>
    </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" runat="Server">
</asp:Content>

