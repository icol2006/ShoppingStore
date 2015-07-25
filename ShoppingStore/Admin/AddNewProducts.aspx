﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProducts.aspx.cs" Inherits="ShoppingStore.Admin.AddNewProducts" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div align="center">
	<h4>
		Add New Products</h4>
	<hr />
</div>
<table align="center" cellspacing="1" style="width=100%; background-color: #FFFFFF;"
	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			Product Name:
		</td>
		<td style"width: 50%; align="left">
            <asp:TextBox ID="txtProductName" runat="server" Width="212px"></asp:TextBox>
		</td>
	</tr>
	
	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;
		</td>
		<td style"width: 50%; align="left">
			&nbsp;
		</td>
	</tr>
	
	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			Product Category:
		</td>
		<td style"width: 50%; align="left">
            <asp:DropDownList ID="ddlCategory" runat="server" Width="212px"></asp:DropDownList>
		</td>
	</tr>

    <tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;
		</td>
		<td style"width: 50%; align="left">
			&nbsp;
		</td>
	</tr>
	
	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			Product Description:
		</td>
		<td style"width: 50%; align="left">
            <asp:TextBox ID="txtProductDescription" runat="server" TextMode="MultiLine" Width="212px" Height="80px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;
		</td>
		<td style"width: 50%; align="left">
			&nbsp;
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			Product Image:
		</td>
		<td style"width: 50%; align="left">
            <asp:FileUpload ID="uploadProductPhoto" runat="server" />
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;
		</td>
		<td style"width: 50%; align="left">
			&nbsp;
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			Product Price:
		</td>
		<td style"width: 50%; align="left">
            <asp:TextBox ID="txtProductPrice" runat="server"  Width="212px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;
		</td>
		<td style"width: 50%; align="left">
			&nbsp;
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			Product Quantity</td>
		<td style"width: 50%; align="left">
			<asp:TextBox ID="txtProductQuantity" runat="server" Width="208px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;</td>
		<td style"width: 50%; align="left">
			&nbsp;</td>
	</tr>

	<tr>
		<td style"width: 50%; padding-left: 100px;" align="left">
			&nbsp;
		</td>
		<td style"width: 50%; align="left">
			&nbsp;
		    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />
		</td>
	</tr>
    <//table>
</div>

</asp:Content>
