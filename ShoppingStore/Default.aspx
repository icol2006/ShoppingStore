<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingStore.Default" %>

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
                                        <asp:LinkButton ID="btnShoppingHeart" runat="server" Font-Underline="false" Font-Size="20pt" ForeColor="Red" OnClick="btnShoppingHeart_Click">0</asp:LinkButton>
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
                                <td class="style2"  style="border: thin ridge #9933FF">
                                    <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600cc"></asp:Label>
                                </td>
                                <td class="style3"  style="border: thin ridge #9933FF">&nbsp;
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
                                                                    <img id="imgProductPhoto" runat="server" src='<%# Bind("ImageUrl") %>' height="160" width="173"  /> 
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Price ₡<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                                    <img id="imgStar" runat="server" src='~/Images/green_star.png' height="10" width="10" visible="False"  /> 

                                                                    Stock: &nbsp;
                                                                    <asp:Label ID="lblAvailableStock" runat="server" Text='<%# Eval("AvailableStock") %>'
                                                                    ToolTip="Available Stock" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnAddToCart" runat="server" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" 
                                                                    Text="Add to Cart" Width="100%" CommandArgument='<%# Bind("ProductId") %>' OnClick="Button1_Click"/>
                                                                 
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px" Visible="False"> 
                                            <table align="center" cellspacing="1">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                        <asp:DataList ID="dlCartProducts" RepeatColumns="3" runat="server" Font-Bold="false"
                                                         width="551px">
                                                            <ItemTemplate>
                                                               <div align="left">
                                                                   <table cellspacing="1" style="border: 1px ridge #99FFCC; text-align:center; width: 172px">
                                                                       <tr>
                                                                           <td style="border-bottom-style:ridge; border-width: 1px; border-color: #000000">
                                                                               <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' style="font-weight: 700"></asp:Label>
                                                                           </td>
                                                                       </tr>
                                                                       <tr>
                                                                           <td>
                                                                               <img id="imgProductPhoto" runat="server" src='<%# Bind("ImageUrl") %>' style="border: ridge 1px black; width: 157px; height: 130px"/>
                                                                                </td>
                                                                       </tr>
                                                                       <tr>
                                                                           <td>
                                                                               AvailableStock:&nbsp;
                                                                               <asp:Label ID="lblAvailableStock" runat="server" Text='<%# Eval("AvailableStock") %>' 
                                                                               ToolTip="Available Stock" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                               &nbsp;&nbsp; <br>
                                                                                Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                                               <asp:TextBox ID="txtProductQuantity" runat="server" Width="10px" Height="10px" MaxLength="1"  OnTextChanged="txtProductQuantity_TextChanged" AutoPostBack="true" Text='<%# Eval("ProductQuantity") %>'></asp:TextBox>
                                                                               <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>'/>
                                                                           </td>
                                                                       </tr>
                                                                       <tr>
                                                                           <td>
                                                                               <br>
                                                                           
                                                                               <asp:Button ID="btnRemoveFromCart" runat="server" CommandArgument='<%# Eval("ProductID") %>'
                                                                               Text="Remove from Cart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"
                                                                               OnClick="btnRemoveFromCart_Click" CausesValidation="false"/>
                                                                           </td>
                                                                       </tr>

                                                                   </table>
                                                               </div>
                                                            </ItemTemplate>
                                                            <ItemStyle width="33%"/>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td class="style3" valign="top" align="center">
                                        <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                         BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlCategories" runat="server" BackColor="White" BorderColor="#CCCCCC"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                            Width="252px" Height="138px">
                                            <FooterStyle BackColor="#CCCC99" ForeColor="Black"/>
                                            <HeaderStyle BackColor="#333333" Font-Bold="true" ForeColor="White"/>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbntCategory" runat="server"  Text='<%# Bind("CategoryName") %>'
                                                  CommandArgument='<%# Bind("CategoryID") %>' OnClick="lbntCategory_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="true" ForeColor="White"/>
                                            </asp:DataList>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlCheckOut" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                        BorderStyle="Inset" BorderWidth="1px" Visible="False">
                                            <table>
                                                <tr>
                                                    <td align="left">
                                                        Name:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerName" runat="server" Width="231px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName" 
                                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        PhomeNo:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtCustomerPhoneNo" Width="231px" MaxLength="10" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerPhoneNo"
                                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Email:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtCustomerEmailID" Width="231px" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerEmailID"
                                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Address:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtCustomerAddress" Width="231px" Height="65px" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerAddress"
                                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Total Products:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtTotalProducts" Width="231px" ReadOnly="true" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalProducts"
                                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Total Price:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtTotalPrice" Width="231px" ReadOnly="true" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalPrice"
                                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Payment mode:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:RadioButtonList ID="rdlPaymentMethod" runat="server">
                                                            <asp:ListItem Value="1" Selected="True">Cash on delivery</asp:ListItem>
                                                             <asp:ListItem Value="2" Selected="True">Payement Gateway</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnPlaceOrder" runat="server"  OnClick="btnPlaceOrder_Click" style="font-weight: 700"
                                                        Text="PlaceOrder" Width="99px"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCustomerEmailID"
                                                            ErrorMessage="Please enter valid EmailID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                                            <div style="text-align: center;">
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                    <asp:Image ID="Image4" runat="server" ima Height="200px" ImageUrl="~/Images/EmtyShoppingCart.bmp" Width="500px"/>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlOrderPlacedSuccesfully" runat="server" Visible="false">
                                            <div style="text-align: center">
                                                <asp:Image ID="Image5" runat="server" Height="200px" Width="500px" ImageUrl="~/Images/happyshooping.png"/><br />
                                                    <label> 
                                                        Order placed succesfully
                                                    </label><br />
                                                Transaction Details are sent at emailed Provided by you
                                                <br />
                                                <br />
                                                <asp:Label ID="lblTransactionNo" runat="server"></asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                                <a href="TrackYourOrder.aspx" target="_blank">TrackYourTransationsHere</a>
                                            </div>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" style="border: thin ridge #9900FF">
                                        &nbsp;&copy;<a href="#">Copyright - Maykol Alvarado P</a>
                                        || <a href="Admin/Login.aspx" target="_blank">Admin Panel </a>
                                        || <a href="TrackYourOrder.aspx" target="_blank">Track your order </a>
                                    </td>
                                </tr>
                            </table>
                        </td>

               </tr>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>

