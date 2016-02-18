<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ContentPlaceHolderID="cphJavaScript" runat="server">
	<link href="Scripts/fancybox-2.1.5/jquery.fancybox.css" rel="stylesheet" />
	<script src="Scripts/fancybox-2.1.5/jquery.fancybox.pack.js"></script>
	<script src="Scripts/jquery.mousewheel-3.1.3.pack.js"></script>
	<script>
		function OpenModal() {
		$('#LoginModal').modal('show');
		};
		function CloseModal() {
		$('#LoginModal').modal('hide');
		};
	</script>
	<script>
		$(document).ready(function () {

			$(".fancybox").fancybox({

				beforeShow: function () {
					var alt = this.element.find('img').attr('alt');
					this.inner.find('img').attr('alt', alt);
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + ' • ' + (this.title ? ' - ' + this.title : '') + alt;
				},

				openEffect: 'elastic',
				closeEffect: 'fade',

				prevEffect: 'fade',
				nextEffect: 'fade',

				helpers: {
					title: {
						type: 'inside'
					}
				}
			});
		});
  </script>

</asp:Content>
	
<asp:Content ContentPlaceHolderID="cphContent" runat="server">
	
	<div id="LoginModal" class="modal fade"  role="dialog"  data-backdrop="static">
		<div class="modal-dialog modal-lg">
		  <!-- Modal content-->
		  <div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title">Green Light Loan User Verification</h3>
			</div>
			<div class="modal-body">
				<section >
					<asp:Label ID="lbl_User" runat="server" Text=""></asp:Label> <br />
					<a href="#login" class="adv-link" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="login">Log In</a> | 
					<a href="#advanced-search" class="adv-link" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="advanced-search">Register</a>
					<br /><br />
					<fieldset id="login" class="collapse">	
						<div class="form-group">
							<label for="ddlEventID" class="col-sm-2 control-label" data-toggle="tooltip" data-placement="right" title="Search items assisgned to an Event Bundle or Logo Item by specifying Event">
								User Name
							</label>
							<div class="col-sm-4 sm-mb">
								<asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
							</div>
							
							<div class="col-sm-offset-2 col-sm-2">
								<input type="submit" id="Submit1" class="btn btn-primary" value="Continue" runat="server" />
							</div>
						</div> <!-- /.form-group -->
					</fieldset>
					<fieldset id="advanced-search" class="collapse">	
						<h4>
							Add New User
						</h4>
		
						<div class="form-group">			
							<label for="selectfamilyGroup" class="col-sm-2 control-label">
								First Name
							</label>
							<div class="col-sm-4 sm-mb">
								<asp:TextBox ID="user_FName" class="form-control" runat="server"></asp:TextBox>
							</div>
							
							<label for="ddlFulfillmentType" class="col-md-1 col-sm-2 control-label sm-mt" data-toggle="tooltip" data-placement="right" title="Fulfillment Behavior">
								Role
							</label>
							<div class="col-md-3 col-sm-4">
								<asp:DropDownList ID="dd_Role" class="form-control"  runat="server"></asp:DropDownList>
							</div>
						</div> <!-- /.form-group -->
		
						<div class="form-group">
							<label for="ddlEventID" class="col-sm-2 control-label" data-toggle="tooltip" data-placement="right" title="Search items assisgned to an Event Bundle or Logo Item by specifying Event">
								Last Name
							</label>
							<div class="col-sm-4 sm-mb">
								<asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
							</div>
							
						</div> <!-- /.form-group -->
		
						<div class="form-group"> <!-- needed here because this class is the form version of .row -->
							<div class="col-sm-offset-2 col-sm-2">
								<input type="submit" id="btnAdvancedSearch" class="btn btn-primary" value="Register" runat="server" />
							</div>
						</div> <!-- /.form-group -->
					</fieldset>
				</section>
				<section class="terms-cond">
					<p>this is where user terms and conditions can go</p>
					 <ol>
						<li>
							blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah
						</li>
					
						<li>
							 blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah
						</li>
					
						<li>
							 blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah
						</li>
					
						<li>
							blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah blah blah blah blah blah blahblah blah
						</li>
					</ol>
				</section>
			
				 <div class="checkbox">
						<label for="AgreeTerms1">
						  <input type="checkbox" runat="server" name="AgreeTerms1" id="AgreeTerms1" required autofocus ClientIDMode="Static"> <strong>I am signed in as the current user</strong>
						</label>
					   </div>
					
						<div class="checkbox">
							<label for="AgreeTerms2">
					<input type="checkbox" runat="server" name="AgreeTerms2" id="AgreeTerms2" required ClientIDMode="Static"> <strong>I understand that Im responsible for completion and accuracy of this loan blah blah blah.</strong>
				</label>
				</div>    
			</div> <!-- /.modal-body -->
		
			<div class="modal-footer">
				<asp:Button id="IAgreeButton" Runat="server" CssClass="btn btn-primary pull-left" ValidationGroup="AgreeGroup" Text="I Agree"></asp:Button>
			</div>
		  </div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
  </div> <!-- /#PolicyModal.modal fade -->
	<div class="col-md-9">
		<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" visible="true">
		<asp:View ID="View1" runat="server" >
			<h4>Green Light Loan Process</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button17" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
		</asp:View>
		<asp:View ID="View2" runat="server">
			<h4>Title Page 2</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
			<asp:Button ID="Button2" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
		</asp:View>
		<asp:View ID="View3" runat="server">
			<h4>Title Page 3</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button3" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button4" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View4" runat="server">
			<h4>Title Page 4</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button5" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button6" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View5" runat="server">
			<h4>Title Page 5</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button7" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button8" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View6" runat="server">
			<h4>Title Page 6</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button9" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button10" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View7" runat="server">
			<h4>Title Page 7</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button11" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button12" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View8" runat="server">
			<h4>Title Page 8</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button13" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button14" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View9" runat="server">
			<h4>Title Page 9</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button15" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Next" />
			<asp:Button ID="Button16" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Prev" />
		</asp:View>
		<asp:View ID="View10" runat="server">
			<h4>Green Light Loan Loan Rejected</h4>
			<p>content contentcontent contentcontent contentcontent content</p>
			<p>content contentcontent contentcontent contentcontent contentcontent contentcontent contentcontent content</p>
			<asp:Button ID="Button19" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="Start Over" />
		</asp:View>
	</asp:MultiView>
	</div>
	<div class="col-md-3">
        <br />
        <asp:HiddenField ID="hdnFileId" runat="server" Value="" />
		<div class="list-group">
			<asp:Repeater ID="rpt_Checklist" runat="server">
				<ItemTemplate>
					<a href="#" id="litChecklist" class="list-group-item list-group-item-primary" runat="server"></a>
				</ItemTemplate>
			</asp:Repeater>
		</div>
	</div>
		<asp:Repeater ID="Repeater1"  runat="server">
			<ItemTemplate>
				<tr>
					<td><a href="" id="litID" runat="server"></a></td>
					<td><a href="" id="litName" runat="server"></a></td>
					<td><a href="" id="litFName" runat="server"></a></td>
					<td><a href="" id="litLName" runat="server"></a></td>
					<td><a href="" id="litRole" runat="server"></a></td>
				</tr>
			</ItemTemplate>

		</asp:Repeater>
</asp:Content>
