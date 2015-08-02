<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ProductStock.aspx.cs" Inherits="ShoppingStore.Admin.ProductStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
    <asp:Label ID="Label1" runat="server" Text="Product Stock" style="font-weight: 700; text-align: center;"></asp:Label>
        <hr />
    <table style="width: 100%;" align="center">
        <tr>
            <td  align="center">
                    <asp:DropDownList ID="ddlCategory" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" Width="300px"></asp:DropDownList>
            </td>
            
        </tr>

        <tr>
            <td  align="center">
                <asp:Panel ID="pnlProductStockReport" runat="server">
                    <hr />
                         <asp:RadioButtonList ID="rblProductStock" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                         style="font-weight: 700" OnSelectedIndexChanged="rblProductStock_SelectedIndexChanged">
                             <asp:ListItem Selected="True" Value="0">OutofStock</asp:ListItem>
                             <asp:ListItem Value="1">LimitedStock</asp:ListItem>
                             <asp:ListItem Value="2">EnoughStock</asp:ListItem>
                         </asp:RadioButtonList>
                    <hr />
                </asp:Panel>

            </td>
        </tr>

        <tr>
            <td  align="center">
                <div  align="center" id="NoRecordsDisplay" runat="server" visible="false">
                    <asp:Label ID="Label2" runat="server" style="font-weight:700" ForeColor="Red" Text="Label">No Records Available</asp:Label>
                </div>
                <asp:GridView ID="gvAvailableStock" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Product Name">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AvailableStock" HeaderText="Available Stock">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="ImageUrl">
                            <ControlStyle Width="150px" />
                        </asp:ImageField>
                    </Columns>

                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />

                </asp:GridView>
            </td>
            
        </tr>
    </table>
</div>
</asp:Content>
