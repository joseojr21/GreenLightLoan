<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManagePages.aspx.cs" Inherits="Admin_ManagePages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphJavaScript" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopNav" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">

	<h3>Manage Page Content</h3><hr />
	<p>
		Add/modify/ Delete page content information blah blah blah blahablah blah blah blah blah
	</p>
	<br /><br />
	<div align="right">
		<asp:Button ID="btn_Update" class="btn btn-success" runat="server" Text="Create Page" />
	</div>
	<table class="table">
		<thead>
			  <tr>
				<th>Page Title</th>
				<th>Page Order</th>
				<th>Description</th>
				<th align="center">Action</th>
			  </tr>
			</thead>
		<tbody>
	<asp:Repeater ID="rpt_PageContent"  runat="server">
		<ItemTemplate>
			<tr>
				<td><asp:Label ID="lbl_Title" runat="server" Text=""></asp:Label></td>
				<td><asp:Label ID="lbl_Order" runat="server" Text=""></asp:Label></td>
				<td><asp:Label ID="lbl_Descr" runat="server" Text=""></asp:Label></td>
				<td><asp:Button ID="btn_Update" class="btn btn-primary" runat="server" Text="Update" />
					<asp:Button ID="btn_delete" class="btn btn-primary" runat="server" Text="Delete" />
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
	</tbody>
	</table>
</asp:Content>

