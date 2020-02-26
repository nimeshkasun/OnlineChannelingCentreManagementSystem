<%@ Page Title="Nurse Dashboard" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="User_Admin_Dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
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
            width: 80%;
            height: 75%;
        }

        .lbl {
            font-size: 16px;
            font-style: italic;
            font-weight: bold;
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

                <td style="width: 100%; text-align: center">&nbsp;&nbsp;</td>

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
        <asp:Button ID="Button1" CssClass="login100-form-btn" runat="server" Text="Appointments" BackColor="Blue" ForeColor="White" Height="35px" Width="200px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" CssClass="login100-form-btn" runat="server" Text="H-Card" BackColor="Red" ForeColor="White" Height="35px" Width="200px" OnClick="Button2_Click" />
        <br />
        <br />
    </div>
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
    <asp:HiddenField ID="H1" runat="server" />
    <br />

    <%--Lab Reports ===================================================================================================================--%>

    <div style="background-color: #0000FF">
        &nbsp;
        <asp:Label ID="Label1" runat="server" Text="Lab Reports" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
    </div>
    <br />
    <div>
        <asp:Button ID="Button3" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New Blood Report" Width="240px" />
        <asp:Button ID="Button4" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New Cholestrol Report" Width="240px" />
        <asp:Button ID="Button5" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New Urine Report" Width="240px" />
    </div>
    <div style="border: 5px solid #FFFFFF">

        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="Lab_report_ID" DataSourceID="LabReport" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Lab_report_ID" HeaderText="Lab Report ID" ReadOnly="True" SortExpression="Lab_report_ID"  ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Patient_ID" HeaderText="Patient ID" SortExpression="Patient_ID"  ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Issue_date" HeaderText="Issue Date" SortExpression="Issue_date"  ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Issue_month" HeaderText="Issue Month" SortExpression="Issue_month"  ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Issue_year" HeaderText="Issue Year" SortExpression="Issue_year" ItemStyle-HorizontalAlign="Center"  />
                <asp:BoundField DataField="Report_type" HeaderText="Report Type" SortExpression="Report_type" ItemStyle-HorizontalAlign="Center"  />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="login100-form-btn" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="LabReport" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Labreport] WHERE ([Patient_ID] = @Patient_ID)">
            <SelectParameters>
                <asp:SessionParameter Name="Patient_ID" SessionField="ApptPat_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <br />
    
    <div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button3" PopupControlID="Panel1" BackgroundCssClass="Background" CancelControlID="btnClose"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="Panel1" runat="server" CssClass="Popup">
            <div style="background-color: #0000FF; width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td>&nbsp;<asp:Label ID="Label22" runat="server" Text="Blood Report" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label></td>
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
                                <asp:Label ID="Label2" runat="server" Text="Patient ID"></asp:Label>
                            </td>
                            <td style="width: 25%"><div class="wrap-input100 validate-input" style="width: 50%">
                                <asp:TextBox ID="TextBox1" CssClass="input100"   placeholder="Patient ID" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox><span class="focus-input100"></span>
</div>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 10%">
                                <asp:Label ID="Label3" runat="server" Text="Doctor"></asp:Label>
                            </td>
                            <td style="width: 25%"><div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="DropDownList1" CssClass="input100" runat="server" DataSourceID="BTDoc" DataTextField="First_name" DataValueField="Doctor_ID" Height="30px" Width="100%">
                                </asp:DropDownList><span class="focus-input100"></span>
</div>
                                <asp:SqlDataSource ID="BTDoc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Doctor_ID], [First_name] FROM [Doctor]"></asp:SqlDataSource>
                            </td>
                            <td>
                                <div style="text-align: right;">
                                    <br />
                                    <asp:Button ID="Button9" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New" Width="100px" OnClick="Button9_Click" />
                                    <br />
                                </div>

                            </td>
                        </tr>
                    </caption>
                    </tr>
                </table>
            </div>
            <div>6
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 10%">
                            <asp:Label ID="Label4" runat="server" Text="Test Date"></asp:Label>
                        </td>
                        <td style="width: 8%"><div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="DropDownList3" CssClass="input100"  runat="server" Height="30px" Width="100%">
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
                        <td style="width: 11%"><div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="DropDownList4"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                        <td style="width: 7%"><div class="wrap-input100 validate-input" style="width: 150%">
                            <asp:DropDownList ID="DropDownList6"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                                <asp:ListItem>2000</asp:ListItem>
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
                                <asp:ListItem Selected="True">2018</asp:ListItem>
                            </asp:DropDownList><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </div>
            <hr style="border-style: none; height: 5px; width: 100%; background-color: #FFFFFF;" />
            <br />
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label5" runat="server" Text="Red Blood Cells"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox2" CssClass="input100"   placeholder="Red Blood Cells" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label6" runat="server" Text="White Blood Cells"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox3"  CssClass="input100" placeholder="White Blood Cells"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label7" runat="server" Text="Glucose"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox5"  CssClass="input100"  placeholder="Glucose" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label8" runat="server" Text="Blood Type"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox24"  CssClass="input100" runat="server"  placeholder="Blood Type" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label9" runat="server" Text="Himoglobin"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox6"  CssClass="input100" placeholder="Himoglobin"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label10" runat="server" Text="Platelets"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox8" CssClass="input100"  placeholder="Platelets"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label11" runat="server" Text="Other"></asp:Label>
                        </td>
                        <td style="width: 20%" rowspan="2"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox7"  CssClass="input100" placeholder="Other Notes"  runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>
                            <div style="text-align: right;">
                                <br />
                                <asp:Button ID="btnBloodInsert" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Insert" Width="100px" OnClick="Button10_Click" Visible="False" />
                                <asp:Button ID="Button6" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="100px" OnClick="Button6_Click" />
                                <br />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Button4" PopupControlID="Panel2" BackgroundCssClass="Background" CancelControlID="btnClose2"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="Panel2" runat="server" CssClass="Popup">
            <div style="background-color: #0000FF; width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td>&nbsp;<asp:Label ID="Label12" runat="server" Text="Cholestrol Report" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label></td>
                        <td style="text-align: right;">
                            <asp:Button ID="btnClose2" runat="server" BorderStyle="None" Text="✖" BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Size="Large" /></td>
                    </tr>
                </table>
            </div>
            <div>
                <table style="width: 100%;">
                    <caption>
                        <br />
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label13" runat="server" Text="Patient ID"></asp:Label>
                            </td>
                            <td style="width: 25%"><div class="wrap-input100 validate-input" style="width: 50%">
                                <asp:TextBox ID="TextBox4"  CssClass="input100"  placeholder="Patient ID" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox><span class="focus-input100"></span>
</div>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 10%">
                                <asp:Label ID="Label14" runat="server" Text="Doctor"></asp:Label>
                            </td>
                            <td style="width: 25%"><div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="DropDownList7"  CssClass="input100" runat="server" DataSourceID="BTDoc" DataTextField="First_name" DataValueField="Doctor_ID" Height="30px" Width="100%">
                                </asp:DropDownList><span class="focus-input100"></span>
</div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Doctor_ID], [First_name] FROM [Doctor]"></asp:SqlDataSource>
                            </td>
                            <td>
                                <div style="text-align: right;">
                                    <br />
                                    <asp:Button ID="Button7" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New" Width="100px" OnClick="Button7_Click" />
                                    <br />
                                </div>

                            </td>
                        </tr>
                    </caption>
                    </tr>
                </table>
            </div>
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 10%">
                            <asp:Label ID="Label15" runat="server" Text="Test Date"></asp:Label>
                        </td>
                        <td style="width: 8%"><div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="DropDownList10"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                        <td style="width: 11%"><div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="DropDownList11" CssClass="input100"  runat="server" Height="30px" Width="100%">
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
                        <td style="width: 7%"><div class="wrap-input100 validate-input" style="width: 150%">
                            <asp:DropDownList ID="DropDownList12"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                                <asp:ListItem>2000</asp:ListItem>
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
                                <asp:ListItem Selected="True">2018</asp:ListItem>
                            </asp:DropDownList><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </div>
            <hr style="border-style: none; height: 5px; width: 100%; background-color: #FFFFFF;" />
            <br />
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label16" runat="server" Text="LDL"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox9"  CssClass="input100"  placeholder="Low-Density Lipoprotein" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label17" runat="server" Text="HDL"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox10"  CssClass="input100" placeholder="High-Density Lipoprotein"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label18" runat="server" Text="Triglicerides"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox11"  CssClass="input100"  placeholder="Triglicerides" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label19" runat="server" Text="VLDL Cholesterol"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox12" CssClass="input100"   placeholder="VLDL Cholesterol" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label20" runat="server" Text="Total Cholesterol"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox13"  CssClass="input100" placeholder="Total Cholesterol"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label23" runat="server" Text="Other"></asp:Label>
                        </td>
                        <td style="width: 20%" rowspan="2"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox19"  CssClass="input100"  placeholder="Other Notes" runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>
                            <div style="text-align: right;">
                                <br />
                                <asp:Button ID="Button10" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Insert" Width="100px" Visible="False" OnClick="Button10_Click1" />
                                <asp:Button ID="Button11" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="100px" OnClick="Button11_Click" />
                                <br />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="Button5" PopupControlID="Panel3" BackgroundCssClass="Background" CancelControlID="btnClose3"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="Panel3" runat="server" CssClass="Popup">
            <div style="background-color: #0000FF; width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td>&nbsp;<asp:Label ID="Label24" runat="server" Text="Urine Test Report" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label></td>
                        <td style="text-align: right;">
                            <asp:Button ID="btnClose3" runat="server" BorderStyle="None" Text="✖" BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Size="Large" /></td>
                    </tr>
                </table>
            </div>
            <div>
                <table style="width: 100%;">
                    <caption>
                        <br />
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label25" runat="server" Text="Patient ID"></asp:Label>
                            </td>
                            <td style="width: 25%"><div class="wrap-input100 validate-input" style="width: 50%">
                                <asp:TextBox ID="TextBox15"  CssClass="input100" placeholder="Patient ID"  runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox><span class="focus-input100"></span>
</div>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 10%">
                                <asp:Label ID="Label26" runat="server" Text="Doctor"></asp:Label>
                            </td>
                            <td style="width: 25%"><div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="DropDownList13"  CssClass="input100" runat="server" DataSourceID="BTDoc" DataTextField="First_name" DataValueField="Doctor_ID" Height="30px" Width="100%">
                                </asp:DropDownList><span class="focus-input100"></span>
</div>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Doctor_ID], [First_name] FROM [Doctor]"></asp:SqlDataSource>
                            </td>
                            <td>
                                <div style="text-align: right;">
                                    <br />
                                    <asp:Button ID="Button8" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New" Width="100px" OnClick="Button8_Click" />
                                    <br />
                                </div>

                            </td>
                        </tr>
                    </caption>
                    </tr>
                </table>
            </div>
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 10%">
                            <asp:Label ID="Label27" runat="server" Text="Test Date"></asp:Label>
                        </td>
                        <td style="width: 8%"><div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="DropDownList14"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                        <td style="width: 11%"><div class="wrap-input100 validate-input">
                            <asp:DropDownList ID="DropDownList15"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                        <td style="width: 7%"><div class="wrap-input100 validate-input" style="width: 150%">
                            <asp:DropDownList ID="DropDownList16"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                                <asp:ListItem>2000</asp:ListItem>
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
                                <asp:ListItem Selected="True">2018</asp:ListItem>
                            </asp:DropDownList><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </div>
            <hr style="border-style: none; height: 5px; width: 100%; background-color: #FFFFFF;" />
            <br />
            <div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label40" runat="server" Text="Glucose"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox16"  CssClass="input100"  placeholder="Glucose" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label41" runat="server" Text="Protein"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox17" placeholder="Protine"  CssClass="input100" runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label42" runat="server" Text="Crystal"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox18" CssClass="input100"  placeholder="Crystal"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">
                            <asp:Label ID="Label43" runat="server" Text="Acidity"></asp:Label>
                        </td>
                        <td style="width: 20%"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox20" CssClass="input100"  placeholder="Acidity"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            <asp:Label ID="Label46" runat="server" Text="Other"></asp:Label>
                        </td>
                        <td style="width: 20%" rowspan="2"><div class="wrap-input100 validate-input">
                            <asp:TextBox ID="TextBox23" CssClass="input100"  placeholder="Other Notes"  runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine"></asp:TextBox><span class="focus-input100"></span>
</div>
                        </td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width: 15%">&nbsp;</td>
                        <td style="width: 20%">&nbsp;</td>
                        <td>
                            <div style="text-align: right;">
                                <br />
                                <asp:Button ID="Button12" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Insert" Width="100px" Visible="False" OnClick="Button12_Click" />
                                <asp:Button ID="Button13" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Update" Width="100px" OnClick="Button13_Click" />
                                <br />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <br />
    <div>
        <div style="background-color: #0000FF">
            &nbsp;
        <asp:Label ID="Label47" runat="server" Text="Patient History" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label>
        </div>
        <br />
        <div>
            <div>
                <asp:Button ID="Button14" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="New Prescription" Width="240px" />
                <ajaxToolkit:ModalPopupExtender ID="Button14_ModalPopupExtender" runat="server" BehaviorID="Button14_ModalPopupExtender" CancelControlID="Button15" DynamicServicePath="" PopupControlID="Panel4" TargetControlID="Button14" BackgroundCssClass="Background" >
                </ajaxToolkit:ModalPopupExtender>
            </div>
        </div>
        <div style="border: 5px solid #FFFFFF">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="PatHistoryData" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Medical_officer" HeaderText="Medical Officer" SortExpression="Medical_officer" />
                    <asp:BoundField DataField="Issue_date" HeaderText="Issue Date" SortExpression="Issue_date" />
                    <asp:BoundField DataField="Issue_month" HeaderText="Issue Month" SortExpression="Issue_month" />
                    <asp:BoundField DataField="Issue_year" HeaderText="Issue Year" SortExpression="Issue_year" />
                    <asp:BoundField DataField="Medicine" HeaderText="Medicine" SortExpression="Medicine" />
                    <asp:BoundField DataField="Dosage" HeaderText="Dosage" SortExpression="Dosage" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="PatHistoryData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Medical_officer, Issue_date, Issue_month, Issue_year, Medicine, Dosage, Notes FROM Prescription WHERE (Patient_ID = @Patient_ID) ORDER BY date DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="Patient_ID" SessionField="ApptPat_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>
        <div>

        <div>
            <asp:Panel ID="Panel4" runat="server" CssClass="Popup">
                <div style="background-color: #0000FF; width: 100%;">
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;<asp:Label ID="Label21" runat="server" Text="New Prescription" Font-Size="20pt" ForeColor="White" Font-Bold="True"></asp:Label></td>
                            <td style="text-align: right;">
                                <asp:Button ID="Button15" runat="server" BorderStyle="None" Text="✖" BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Size="Large" /></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table style="width: 100%;">
                        <caption>
                            <br />
                            <tr>
                                <td style="width: 10%">
                                    <asp:Label ID="Label44" runat="server" Text="Patient ID"></asp:Label>
                                </td>
                                <td style="width: 25%"><div class="wrap-input100 validate-input" style="width: 50%">
                                    <asp:TextBox ID="TextBox14"  CssClass="input100" placeholder="Patient ID" runat="server" BorderStyle="None" Width="100%" Enabled="False"></asp:TextBox><span class="focus-input100"></span>
</div>
                                </td>
                                <td>&nbsp;</td>
                                <td style="width: 10%">
                                    <asp:Label ID="Label45" runat="server" Text="Doctor"></asp:Label>
                                </td>
                                <td style="width: 25%"><div class="wrap-input100 validate-input">
                                    <asp:DropDownList ID="DropDownList17"  CssClass="input100" runat="server" DataSourceID="BTDoc" DataTextField="First_name" DataValueField="Doctor_ID" Height="30px" Width="100%">
                                    </asp:DropDownList><span class="focus-input100"></span>
</div>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Doctor_ID], [First_name] FROM [Doctor]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <div style="text-align: right;">
                                        <br />
                                        <br />
                                    </div>

                                </td>
                            </tr>
                        </caption>
                        </tr>
                    </table>
                </div>
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label48" runat="server" Text="Test Date"></asp:Label>
                            </td>
                            <td style="width: 8%"><div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="DropDownList18"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                            <td style="width: 11%"><div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="DropDownList19"  CssClass="input100" runat="server" Height="30px" Width="100%">
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
                            <td style="width: 7%"><div class="wrap-input100 validate-input" style="width: 150%">
                                <asp:DropDownList ID="DropDownList20" CssClass="input100"  runat="server" Height="30px" Width="100%">
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
                                    <asp:ListItem>2000</asp:ListItem>
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
                                    <asp:ListItem Selected="True">2018</asp:ListItem>
                                </asp:DropDownList><span class="focus-input100"></span>
</div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                </div>
                <hr style="border-style: none; height: 5px; width: 100%; background-color: #FFFFFF;" />
                <br />
                <div>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 15%">
                                <asp:Label ID="Label49" runat="server" Text="Medicine"></asp:Label>
                            </td>
                            <td style="width: 20%"><div class="wrap-input100 validate-input">
                                <asp:DropDownList ID="DropDownList21"  CssClass="input100" runat="server" DataSourceID="Medi" DataTextField="Medicine" DataValueField="Medicine" Height="30px" Width="100%">
                                </asp:DropDownList><span class="focus-input100"></span>
</div>
                                <asp:SqlDataSource ID="Medi" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [Medicine] FROM [Doc_Sup] ORDER BY [Medicine]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 15%">
                                <asp:Label ID="Label50" runat="server" Text="Dosage"></asp:Label>
                            </td>
                            <td style="width: 20%"><div class="wrap-input100 validate-input">
                                <asp:TextBox ID="TextBox22" CssClass="input100" placeholder="Dosage"  runat="server" BorderStyle="None" Width="100%"></asp:TextBox><span class="focus-input100"></span>
</div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 15%">
                                <asp:Label ID="Label53" runat="server" Text="Notes"></asp:Label>
                            </td>
                            <td style="width: 20%" rowspan="2"><div class="wrap-input100 validate-input">
                                <asp:TextBox ID="TextBox27"  CssClass="input100" placeholder="Notes" runat="server" BorderStyle="None" Width="100%" TextMode="MultiLine"></asp:TextBox><span class="focus-input100"></span>
</div>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 15%">&nbsp;</td>
                            <td style="width: 20%">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 15%">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td style="width: 15%">&nbsp;</td>
                            <td style="width: 20%">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 15%">&nbsp;</td>
                            <td style="width: 20%">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td style="width: 15%">&nbsp;</td>
                            <td style="width: 20%">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 15%">&nbsp;</td>
                            <td style="width: 20%">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td style="width: 15%">&nbsp;</td>
                            <td style="width: 20%">&nbsp;</td>
                            <td>
                                <div style="text-align: right;">
                                    <br />
                                    <asp:Button ID="Button17" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Insert" Width="130px" OnClick="Button17_Click"  />
                                    <asp:Button ID="Button16" CssClass="login100-form-btn" runat="server" BackColor="Blue" BorderStyle="None" ForeColor="White" Height="35px" Text="Insert &amp; New" Width="130px" OnClick="Button16_Click"   />
                                    
                                    <br />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterMenu" runat="Server">
</asp:Content>

