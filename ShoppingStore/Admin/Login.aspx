<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingStore.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: 200px;">
        <table align="center" class="style1" style="border: 1px ridge #999999; width: 450px;">

            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="ShoppingHeart- AdminPanel" Style="font-weight:700; text-align: center;"></asp:Label>
               <hr />
                </td>
            </tr>

            <tr>
                <td aling="center" style="width: 50%;">
                    LoginId:
                </td>
                <td style="width: 50%;">
                    <asp:TextBox ID="txtLogId" runat="server">sa</asp:TextBox>
                </td>
            </tr>
           
             <tr>
                <td style="width: 50%;">
                    Password:
                </td>
                <td style="width: 50%;">
                    <asp:TextBox ID="txtPassword" runat="server">123456</asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td align="center" style="width: 50%">
                    &nbsp;
                </td>
                <td style="width: 50%;">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />  
                </td>
            </tr>

            <tr>
                <td align="center" colspan="2">
                    <hr />
                    <asp:Label ID="lblAlert" runat="server" Font-Names="Aharoni" ForeColor="Red"></asp:Label>
                </td>

            </tr>


    </form>
                    

