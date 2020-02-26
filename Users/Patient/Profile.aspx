<%@ Page Title="Profile" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        .auto-style2 {
            height: 50px;
        }

        .auto-style3 {
            width: 10px;
            height: 50px;
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

    <div>
        <table style="width: 100%;">
            <tr>
                <td style="text-align: center; width: 20%;" class="auto-style2">
                    <asp:Label ID="lblPatAge" runat="server" Font-Bold="True" Font-Size="30pt" Text="N/A" Width="100%"></asp:Label>
                    <br />
                    <asp:Label ID="Label28" runat="server" Text="Age (Years)"></asp:Label>

                </td>
                <td style="text-align: center;" class="auto-style2">
                    <asp:Label ID="lblPatWeight" runat="server" Font-Bold="True" Font-Size="30pt" Text="N/A" Width="100%"></asp:Label>
                    <br />
                    <asp:Label ID="Label29" runat="server" Text="Weight (Kg)"></asp:Label>
                </td>
                <td style="text-align: center;" class="auto-style2">
                    <asp:Label ID="lblPatHeight" runat="server" Font-Bold="True" Font-Size="30pt" Text="N/A" Width="100%"></asp:Label>
                    <br />
                    <asp:Label ID="Label30" runat="server" Text="Height (cm)"></asp:Label>
                </td>
                <td style="text-align: center;" class="auto-style2">
                    <asp:Label ID="lblPatBmi" runat="server" Font-Bold="True" Font-Size="30pt" Text="N/A" Width="100%"></asp:Label>
                    <br />
                    <asp:Label ID="Label31" runat="server" Text="BMI"></asp:Label>
                </td>
                <td style="text-align: center;" class="auto-style2">
                    <asp:Label ID="lblPatBloodGrp" runat="server" Font-Bold="True" Font-Size="30pt" Text="N/A" BackColor="Red" ForeColor="White" Width="100%" BorderStyle="None"></asp:Label>
                    <br />
                    <asp:Label ID="Label32" runat="server" Text="Blood Group"></asp:Label>
                </td>
            </tr>
        </table>

    </div>
    <div>
        <br />
        <br />
        <hr style="width: 75%" />
        <table style="border-style: none; width: 100%;">
            <tr>
                <td class="auto-style3"></td>
                <td style="width: 50px">
                    <img alt="" src="Images/ProInfo/Smoking.png" width="50" /></td>
                <td style="width: 120px" class="auto-style4">
                    <asp:Label ID="Label33" runat="server" Text="Smoking"></asp:Label>
                    <br />
                    <asp:Label ID="lblSmoke" runat="server" Font-Bold="True" Text="Not Specified"></asp:Label>
                </td>
                <td style="width: 50px">
                    <img alt="" src="Images/ProInfo/Alcohol.png" width="50" /></td>
                <td style="width: 120px" class="auto-style4">
                    <asp:Label ID="Label34" runat="server" Text="Alcohol"></asp:Label>
                    <br />
                    <asp:Label ID="lblAlcohol" runat="server" Font-Bold="True" Text="Not Specified"></asp:Label>
                </td>
                <td style="width: 50px">
                    <img alt="" src="Images/ProInfo/WaterIntake.png" width="50" /></td>
                <td style="width: 120px" class="auto-style4">
                    <asp:Label ID="Label35" runat="server" Text="Water Intake"></asp:Label>
                    <br />
                    <asp:Label ID="lblWatInt" runat="server" Font-Bold="True" Text="Not Specified"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
        </table>
        <hr style="width: 75%" />
    </div>
    <div>
        <br />
        <br />
        <table style="width: 100%;">
            <tr>
                <td></td>
                <td>
                    <img alt="" src="Images/ProInfo/phone.png" width="15" />&nbsp;<asp:Label ID="Label36" runat="server" Text="Contact (Mobile)"></asp:Label>
                    <br />
                    <asp:Label ID="lblPatConMob" runat="server" Font-Bold="True" Text="N/A"></asp:Label>
                </td>
                <td>
                    <img alt="" src="Images/ProInfo/home.png" width="15" />&nbsp;<asp:Label ID="Label37" runat="server" Text="Contact (Home)"></asp:Label>
                    <br />
                    <asp:Label ID="lblPatConHom" runat="server" Font-Bold="True" Text="N/A"></asp:Label>
                </td>
                <td>
                    <img alt="" src="Images/ProInfo/nic.png" width="15" />&nbsp;<asp:Label ID="Label38" runat="server" Text="NIC Number"></asp:Label>
                    <br />
                    <asp:Label ID="lblPatNic" runat="server" Font-Bold="True" Text="N/A"></asp:Label>
                </td>
                <td>
                    <img alt="" src="Images/ProInfo/phn.png" width="15" />&nbsp;<asp:Label ID="Label39" runat="server" Text="PHN"></asp:Label>
                    <br />
                    <asp:Label ID="lblPatHelNo" runat="server" Font-Bold="True" Text="N/A"></asp:Label>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <br />
    <div style="text-align: right">
        <asp:Button ID="Button6" CssClass="login100-form-btn" runat="server" OnClick="Button6_Click" Text="Retrieve Data" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Width="200px" />
        <asp:Button ID="Button1" CssClass="login100-form-btn"  runat="server" Text="Appointments" BackColor="Blue" ForeColor="White" OnClick="Button1_Click" Height="35px" Width="200px" />
        <asp:Button ID="Button2"  CssClass="login100-form-btn" runat="server" Text="H-Card" BackColor="Red" ForeColor="White" OnClick="Button2_Click" Height="35px" Width="200px" />
        <br />
        <br />
    </div>
    <div>
        <asp:DropDownList ID="DropDownList5" runat="server" Height="30px" Width="100px" Visible="False">
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
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="100px" Visible="False">
        <asp:ListItem>A+</asp:ListItem>
        <asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem>
        <asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>AB+</asp:ListItem>
        <asp:ListItem>AB-</asp:ListItem>
        <asp:ListItem>O+</asp:ListItem>
        <asp:ListItem>O-</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList8" runat="server" Height="30px" Width="100px" Visible="False">
        <asp:ListItem>None</asp:ListItem>
        <asp:ListItem>Daily</asp:ListItem>
        <asp:ListItem>Occasionally</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList9" runat="server" Height="30px" Width="100px" Visible="False">
        <asp:ListItem>None</asp:ListItem>
        <asp:ListItem>Daily</asp:ListItem>
        <asp:ListItem>Twice a week</asp:ListItem>
        <asp:ListItem>More than twice a week</asp:ListItem>
        <asp:ListItem>Occasionally</asp:ListItem>
    </asp:DropDownList>
    <asp:HiddenField ID="HiddenField1" runat="server" />
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
                    <asp:DropDownList ID="DropDownList1"  CssClass="input100" placeholder="Title" runat="server" Height="30px" Width="100%">
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
                    <asp:TextBox ID="txtfname"  CssClass="input100" placeholder="First Name" runat="server" Style="width: 100%"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td class="auto-style3"></td>
                <td class="auto-style2"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtlname" Style="width: 100%"  CssClass="input100" placeholder="Last Name" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td class="auto-style3"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
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
                    <asp:DropDownList ID="ddldate" CssClass="input100" placeholder="Date"  runat="server" Height="30px" Width="100%">
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
                    <asp:DropDownList ID="ddlmonth" CssClass="input100" placeholder="Month"  runat="server" Height="30px" Width="100%">
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
                    <asp:DropDownList ID="ddlyear" CssClass="input100" placeholder="Year"  runat="server" Height="30px" Width="100%">
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
                    <asp:TextBox ID="txtnic" Style="width: 100%;"  CssClass="input100" placeholder="NIC Number" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td style="width: 10px">&nbsp;</td>
                <td><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtpassno"  CssClass="input100" placeholder="Passport Number" runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Weight (in Kg)"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Height (in cm)"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtweight" Style="width: 100%;"  CssClass="input100" placeholder="Weight (in Kg)" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td style="width: 10px">&nbsp;</td>
                <td><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtgeight" Style="width: 100%;" CssClass="input100" placeholder="Height (in cm)"  runat="server"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Blood Group"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="ddlbloodgroup" CssClass="input100" placeholder="Blood Group"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>A+</asp:ListItem>
                        <asp:ListItem>A-</asp:ListItem>
                        <asp:ListItem>B+</asp:ListItem>
                        <asp:ListItem>B-</asp:ListItem>
                        <asp:ListItem>AB+</asp:ListItem>
                        <asp:ListItem>AB-</asp:ListItem>
                        <asp:ListItem>O+</asp:ListItem>
                        <asp:ListItem>O-</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>

                </td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td style="width: 10px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="text-align: right;">
        <br />
        <asp:Button ID="btnPP" CssClass="login100-form-btn"  runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="80px" OnClick="btnPP_Click" />
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
                    <asp:TextBox ID="txtmobile"  CssClass="input100" placeholder="Contact (Mobile)" runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txthome" Style="width: 100%;"  CssClass="input100" placeholder="Contact (Home)" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtoffice" CssClass="input100" placeholder="Contact (Office)"  runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div>
</td>
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
                    <asp:TextBox ID="txtaddress" CssClass="input100" placeholder="Address"  runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
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
                    <asp:DropDownList ID="ddlcountry" CssClass="input100" placeholder="Country"  runat="server" Height="30px" Width="100%">
                        <asp:ListItem>Sri Lanka</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="ddlprovince"  CssClass="input100" placeholder="Province" runat="server" Height="30px" Width="100%">
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
                    <asp:TextBox ID="txtzip" Style="width: 100%;"  CssClass="input100" placeholder="ZIP/Postal code" runat="server"></asp:TextBox><span class="focus-input100"></span>
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
                <td style="width: 25%">
                    <asp:Label ID="Label47" runat="server" Text="Relationship"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtemergencyname" CssClass="input100" placeholder="Emergency Contact Person (Name)"  runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtemergencycontact" CssClass="input100" placeholder="Emergency Contact Mobile Number"  runat="server" Style="width: 100%;"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">
                    <div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="drpRelation"  CssClass="input100" placeholder="Province" runat="server" Height="30px" Width="100%">
                        <asp:ListItem>Father</asp:ListItem>
                        <asp:ListItem>Mother</asp:ListItem>
                        <asp:ListItem>kin</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="text-align: right;">
        <br />
        <asp:Button ID="Button4"  CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" OnClick="Button3_Click1" Text="Update" Width="80px" />
        <br />
    </div>
    <br />
    <div style="background-color: #0000FF">
        &nbsp;
        <asp:Label ID="Label22" runat="server" Text="Habits " Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
    </div>
    <br />
    <div>
        <table style="width: 100%;">
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label23" runat="server" Text="Smoking"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="ddlsmoking"  CssClass="input100" placeholder="Smoking" runat="server" Height="30px" Width="100%">
                        <asp:ListItem>None</asp:ListItem>
                        <asp:ListItem>Daily</asp:ListItem>
                        <asp:ListItem>Occasionally</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label24" runat="server" Text="Alcohol"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">
                    <asp:Label ID="Label25" runat="server" Text="Alcohol (daily intake)"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="ddlalchol"  CssClass="input100" placeholder="Alcohol" runat="server" Height="30px" Width="100%">
                        <asp:ListItem>None</asp:ListItem>
                        <asp:ListItem>Daily</asp:ListItem>
                        <asp:ListItem>Twice a week</asp:ListItem>
                        <asp:ListItem>More than twice a week</asp:ListItem>
                        <asp:ListItem>Occasionally</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtalcholintake"  CssClass="input100" placeholder="Alcohol (daily intake)" runat="server" Style="width: 100%"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label26" runat="server" Text="Dietary Preference"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:DropDownList ID="ddldiet"  CssClass="input100" placeholder="Dietary Preference" runat="server" Height="30px" Width="100%">
                        <asp:ListItem>Vegetarian</asp:ListItem>
                        <asp:ListItem>High fiber food items</asp:ListItem>
                        <asp:ListItem>High fat diet/ High Cholesterol</asp:ListItem>
                        <asp:ListItem Value="High sugar intake">High sugar intake</asp:ListItem>
                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label27" runat="server" Text="Daily Water Intake (number of glasses)"></asp:Label>
                </td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtwaterintake"  CssClass="input100" placeholder="Daily Water Intake (number of glasses)" Style="width: 100%" runat="server"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td style="width: 10px">&nbsp;</td>
                <td style="width: 25%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
    <div style="text-align: right;">
        <br />
        <asp:Button ID="Button5" CssClass="login100-form-btn"  runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="80px" OnClick="Button5_Click" />
        <br />
    </div>
    <br />
    
    <div style="background-color: #0000FF">
        &nbsp;
        <asp:Label ID="Label40" runat="server" Text="Change Password" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
    </div>
    <br />
    <div>
        <table style="width: 100%">

            <tr>
                <td  style="width:25%">
                    &nbsp;</td>
                <td style="width:40%"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtuname"  CssClass="input100" placeholder="Username" runat="server" Width="418px"></asp:TextBox><span class="focus-input100"></span>
</div></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style6"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtpassword"  CssClass="input100" placeholder="Current Password" runat="server" Width="420px" TextMode="Password"></asp:TextBox> <span class="focus-input100"></span>
</div>
                   &nbsp; &nbsp; 
                </td>
                <td class="auto-style5"> <asp:Label ID="Label45" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style6"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtnewpassword" CssClass="input100" placeholder="New Password"  runat="server" Width="417px" TextMode="Password"></asp:TextBox><span class="focus-input100"></span>
</div>
                </td>
                <td class="auto-style5"> <asp:Label ID="Label46" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style4"><div class="wrap-input100 validate-input">
                    <asp:TextBox ID="txtconfirmpassword"  CssClass="input100" placeholder="Confirm Password" runat="server" Width="419px" TextMode="Password"></asp:TextBox><span class="focus-input100"></span>
</div>
                     &nbsp; &nbsp; 
                </td>
                <td style="text-align:right;">

                    <asp:Button ID="btnSubmit" CssClass="login100-form-btn"  runat="server" Text="SUBMIT" Width="95px" OnClick="Button4_Click" BackColor="Blue" BorderStyle="None" ForeColor="White" />

                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" runat="Server">
</asp:Content>

