<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="usCustomerOrder.ascx.cs" Inherits="ShoppingStore.usCustomerOrder" %>
<style type="text/css">
    .styleOrderDetails
    {
        width: 600px;
        border: 1px ridge red;
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div align="center">
            <asp:Label ID="lblTranactionNo" runat="server" Style="font-weight: 700" Text="Transaction No"></asp:Label>
            <asp:TextBox ID="txtTransactionNo" runat="server" Width="90px"></asp:TextBox>
            <asp:Button ID="btnGo" runat="server" Text="Go" Style="font-weight: 700" Width="36px" OnClick="btnGo_Click" />
        &nbsp;</div>
            <table style="width: 100%;">
            <tr>
                <td align="center">
                    <hr />
                    <asp:RadioButtonList ID="rblOrderDetails" runat="server" RepeatDirection="Horizontal"
                        AutoPostBack="true" OnSelectedIndexChanged="rblOrderDetails_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">CustomerDetails</asp:ListItem>
                        <asp:ListItem Value="2">ProductDetails</asp:ListItem>
                        <asp:ListItem Value="3">DeliveryStatus</asp:ListItem>
                    </asp:RadioButtonList>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="center">
                   <asp:Panel ID="Panel1" runat="server">
                       <table align="center">
                           <tr>
                               <td align="center">
                                   <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Customer-Details.png" weight="150px" />
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                    Name:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                   Email:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="lblCustomerEmailId" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                   PhoneNo:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="lblCustomerPhoneNo" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                   TotalProducts:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="lblTotalProducts" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                   TotalPrice:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                   Address:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="Label2" runat="server"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td align="right" style="width: 50%; padding-right: 30px">
                                   PaymentMethod:
                               </td>
                               <td  align="left" style="width: 50%;">
                                   <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
                               </td>
                           </tr>
                       </table>
                   </asp:Panel>
                   <asp:Panel ID="Panel2" runat="server"></asp:Panel>
                   <asp:Panel ID="Panel3" runat="server"></asp:Panel>
                   <asp:Panel ID="Panel4" runat="server"></asp:Panel>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>




