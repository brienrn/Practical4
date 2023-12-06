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
        .auto-style5 {
            width: 246px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 355px;
        }
        .auto-style8 {
            width: 77%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style2">
            <tr>
                <td class="auto-style5">Please select staff name:</td>
                <td class="auto-style6">Please select year:</td>
               
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlName" runat="server" DataSourceID="sdsName" DataTextField="Name" DataValueField="EmployeeID">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="rblYear" runat="server" DataSourceID="sdsYear" DataTextField="Years" DataValueField="Years" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </td>
                
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="sdsName" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Name FROM Employees"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT DISTINCT (YEAR(OrderDate)) AS Years
FROM Orders
ORDER BY Years ASC

"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT OrderID, OrderDate
FROM Orders
WHERE EmployeeID = @EmployeeID AND YEAR(OrderDate) =@Years">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlName" Name="EmployeeID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="rblYear" Name="Years" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT Orders.OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Products.ProductName, ([Order Details].UnitPrice * [Order Details].Quantity) * (1 - [Order Details].Discount) AS Sales FROM Orders INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN Products ON [Order Details].ProductID = Products.ProductID WHERE (Orders.OrderID = @OrderID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="grvOrder" Name="OrderID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblTitleGridView" runat="server"></asp:Label>
        <br />
        <table class="auto-style8">
            <tr>
                <td class="auto-style7">
        <asp:GridView ID="grvOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="sdsOrder" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
            </Columns>
        </asp:GridView>

                </td>
                <td>
                    <asp:Repeater ID="rptOrderDetails" runat="server" DataSourceID="sdsOrderDetails">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                          <table>
                            <tr>
                                <td>Product Name:</td>
                                <td><%# Eval("ProductName") %></td>
                                
                            </tr>
                              <tr>
                                  <td>Unit Price:</td>
                                  <td><%# Eval("UnitPrice") %></td>
                              </tr>
                              <tr>
                                  <td>Quantity:</td>
                                  <td><%# Eval("Quantity") %></td>
                              </tr>
                              <tr>
                                  <td>Discount:</td>
                                  <td><%# Eval("Discount") %></td>
                              </tr>
                              <tr>
                                  <td>Sales:</td>
                                  <td><%# Eval("Sales") %></td>
                              </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>

                    </asp:Repeater>
                </td>
                
            </tr>

        </table>
        <br />

        <br />
        <br />
    </form>
</body>
</html>
