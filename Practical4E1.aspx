<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Practical4E1.aspx.cs" Inherits="Practical4.Practical4E1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Category:
            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="sdsCategory" DataTextField="CategoryName" DataValueField="CategoryID">
            </asp:DropDownList>
&nbsp;<asp:Button ID="btnFind" runat="server" Text="Find" OnClick="btnFind_Click" />
            <br />
            Product List [<asp:Label ID="lblResult" runat="server"></asp:Label>
            ]<br />
            <br />
            <asp:Repeater ID="RepeaterProducts" runat="server" DataSourceID="sdsProducts">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>No.</td>
                            <td>Product ID</td>
                            <td>Product Name</td>
                            <td>Unit Price</td>
                        </tr>

                    
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex+1 %></td>
                        <td><%# Eval("ProductID") %></td>
                        <td><%# Eval("ProductName")%></td>
                        <td><%# String.Format("{0:C}",Eval("UnitPrice")) %></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>

            </asp:Repeater>
            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT ProductID, ProductName, CategoryID, UnitPrice 
FROM Products 
WHERE (CategoryID = @CategoryID)" OnSelected="sdsProducts_Selected">
                <SelectParameters>
                    <asp:Parameter Name="CategoryID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
