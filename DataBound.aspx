<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBound.aspx.cs" Inherits="Practical4.DataBound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="grvCustomers">
            <asp:SqlDataSource ID="sdsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" ProviderName="<%$ ConnectionStrings:NORTHWNDConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="sdsCustomer" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                    <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                    <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
                    <asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" SortExpression="ContactTitle" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="sdsOrders">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                    <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" SortExpression="RequiredDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [OrderID], [OrderDate], [RequiredDate] FROM [Orders] WHERE ([CustomerID] = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
