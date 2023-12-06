<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Practical4E2.aspx.cs" Inherits="Practical4.Practical4E2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 246px;
        }
        .auto-style2 {
            width: 47%;
        }
        .auto-style3 {
            width: 246px;
            height: 32px;
        }
        .auto-style4 {
            height: 32px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style2">
            <tr>
                <td class="auto-style1">Please select staff name:</td>
                <td>Please select year:</td>
               
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    </asp:RadioButtonList>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </td>
                
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="sdsEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT CONCAT(FirstName, CONCAT(' ', LastName)) AS Name
FROM Employees"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT DISTINCT (YEAR(OrderDate)) AS Years
FROM Orders"></asp:SqlDataSource>
        <asp:Label ID="lblTitleGridView" runat="server"></asp:Label>
        <br />
        <br />
    </form>
</body>
</html>
