﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingStore.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 900px;
        }
        .style2
        {
            width: 633px;
            text-align: left;
        }
        .style3
        {
            width: 257px;
            text-align: center;
        }
        .style4
        {
            width: 185px;
            text-align: center
        }
        .style6
        {
            width: 260px;
            text-align: left;
        }
        .style7
        {
            width: 427px;
            text-align: center;
        }
        .style8
        {
            width: 100px;
            text-align: center;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table align="center" class="style1">
                    <tr>
                        <td>
                            <table align="center" class="style1" style="border-bottom-style: ridge; border-width: medium; border-color: #9933FF" >
                                <tr>
                                    <td class="style8" aling="center">
                                        <asp:Image ID="Image1" runat="server" Height="53px" ImageUrl="~/Images/ShoppingCartProject.png" Width="72px"/>
                                        &nbsp;
                                    </td>
                                    <td class="style6">
                                        <asp:LinkButton ID="lbLogo" Text="ShoppingHeart" runat="server" Font-Names="Eras Demi ITC" Font-Size="20pt" ForeColor="#6600CC" OnClick="lbLogo_Click"></asp:LinkButton>
                                        <br />
                                        For those Who Love Shopping!
                                    </td>
                                    <td class="style7">
                                        <asp:Image ID="Image3" runat="server" Height="67px" ImageUrl="~/Images/ShoppingCart.jpg" Width="282px"/>
                                    </td>
                                    <td align="right">
                                        <asp:Image ID="Image2" runat="server" Height="53px" ImageUrl="~/Images/shopping-cart-icon.png" Width="70px"/>
                                    </td>
                                    <td align="left">
                                        <asp:LinkButton ID="btnShoppingHeart" runat="server" Font-Underline="false" Font-Size="20pt" ForeColor="Red">0</asp:LinkButton>
                                    </td>
                                </tr>
                                <caption>
                                    &nbsp;
                                </caption>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    <td>
                        <table aling="center" class="style1" style="border: thin ridge #9933FF">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600cc"></asp:Label>
                                </td>
                                <td class="style3">&nbsp;
                                    <asp:Label ID="lblProducts" runat="server" Font-Size="15pt" ForeColor="#6600cc" Text="Products"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                    <tr>
                        <td>
                            <table align="center" class="style1">
                                <tr>
                                    <td class="style2" valign="top">
                                        <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                            BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="600px">



                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table cellspancing="1" class="style4" style="border: 1px ridge #9900FF">
                                                            <tr>
                                                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <img id="imgProductPhoto" runat="server" src="<%# Bind('ImageUrl') %>" height="160" width="173"  /> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Price<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                 
                                                                    <asp:Button ID="Button1" runat="server" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" 
                                                                    Text="Add to Cart" Width="100%" CommandArgument="<%# Bind('ProductId') %>"/>
                                                                 
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px" Visible="false"> 
                                            <table align="center" cellspacing="1">
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td class="style3" valign="top" align="center">
                                        <asp:Panel ID="plnCategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                         BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlCategories" runat="server" BackColor="White" BorderColor="#CCCCCC"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                            Width="252px" Height="138px">
                                            <FooterStyle BackColor="#CCCC99" ForeColor="Black"/>
                                            <HeaderStyle BackColor="#333333" Font-Bold="true" ForeColor="White"/>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbntCategory" runat="server"  Text="<%# Bind('CategoryName') %>" 
                                                  CommandArgument="<%# Bind('CategoryID') %>" OnClick="lbntCategory_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="true" ForeColor="White"/>
                                            </asp:DataList>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlCheckOut" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px" Visible="false">
                                            <table style="width: 258px;">
                                                <tr>
                                                    <td align="left">
                                                        Name:
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>

                        </td>
                        <td>
                         
                        </td>
                    </tr>
                </table>


                </table>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
