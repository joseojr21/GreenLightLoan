<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="UserRoles.aspx.cs" Inherits="Admin_UserRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphJavaScript" Runat="Server">
	<script>
		function OpenModal() {
			$('#RoleModal').modal('show');
		};
		function CloseModal() {
			$('#RoleModal').modal('hide');
		};
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopNav" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
	<h3>Manage User Roles</h3><hr />
	<p>
		Add/modify/ Delete user role information blah blah blah blahablah blah blah blah blah
	</p>
	<br /><br />
	<div align="right">
		<asp:Button ID="btn_Update" class="btn btn-success" runat="server" Text="Create New Role" />
	</div>
	<table class="table">
		<thead>
			  <tr>
				<th>Hierarchy</th>
				<th>Role Name</th>
				<th>Loan Amount</th>
				<th align="center">Action</th>
			  </tr>
			</thead>
		<tbody>
	<asp:Repeater ID="rpt_UserRoles" OnItemCommand="rpt_UserRoles_ItemCommand"  runat="server" ViewStateMode="Enabled">
		<ItemTemplate>
			<tr>
				<td><asp:Label ID="lbl_Hierarchy" runat="server" Text=""></asp:Label></td>
				<td><asp:Label ID="lbl_Name" runat="server" Text=""></asp:Label></td>
				<td><asp:Label ID="lbl_LAmount" runat="server" Text=""></asp:Label></td>
				<td><asp:Button ID="btn_Update" class="btn btn-primary" OnClick="btn_Update_Click" CommandName="SaveChanges" runat="server" Text="Update" />
					<asp:Button ID="btn_delete" class="btn btn-primary" runat="server" Text="Delete" />
					<asp:HiddenField ID="hdnFld_RoleID" runat="server" />
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
	</tbody>
	</table>
	<div id="RoleModal" class="modal fade"  role="dialog"  data-backdrop="static">
		<div class="modal-dialog modal-lg">
		  <!-- Modal content-->
		  <div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title">RoleName</h3>
			</div>
			<div class="modal-body">
				<asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
			</div> <!-- /.modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<asp:Button id="saveButton" Runat="server" CssClass="btn btn-primary pull-left" ValidationGroup="AgreeGroup" Text="Save Changes"></asp:Button>
			</div>
		  </div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
  </div> <!-- /#PolicyModal.modal fade -->
</asp:Content>

