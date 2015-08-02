<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="IncomeReport.aspx.cs" Inherits="ShoppingStore.Admin.IncomeReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div align="center">
    <asp:Label ID="lblTitle" runat="server" Text="Income Report" style="font-weight: 700; text-align: center;"></asp:Label>
        <hr />
    <table style="width: 100%;" align="center">
 
        <tr>
            <td  align="center">
              
                    <hr />
                         <asp:RadioButtonList ID="rblIncomeFilter" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                         style="font-weight: 700" OnSelectedIndexChanged="rblProductStock_SelectedIndexChanged">
                             <asp:ListItem Selected="True" Value="1">Today</asp:ListItem>
                             <asp:ListItem Value="2">This Month</asp:ListItem>
                             <asp:ListItem Value="3">This Year</asp:ListItem>
                         </asp:RadioButtonList>
                    <hr />
            </td>
        </tr>

        <tr>
            <td  align="center">
                <div  align="center" id="NoRecordsDisplay" runat="server" visible="false">
                    <asp:Label ID="lblIncome" runat="server" style="font-weight:700" ForeColor="Red"></asp:Label>
                </div>

            </td>
        </tr>

        <tr>
            <td align="center">
                <asp:GridView ID="gvIncomeReport" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerName" HeaderText="Name" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerPhoneNo" HeaderText="Customer PhoneNo" >
                        <ItemStyle Width="20px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalProducts" HeaderText="Products" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalPrice" HeaderText="Price" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
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
