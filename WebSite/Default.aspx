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
	<div class="col-md-12" align="right" style="padding-top:15px;">
		<div id="pnl_Icons">
			  <asp:Label ID="lbl_Icons" runat="server" Text=""></asp:Label>
		  </div>
	</div>
	<div class="col-md-9">
		<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" visible="true">
			<asp:View ID="View1" runat="server" >
				<asp:Repeater ID="rpt_PageContent1" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>

					</ItemTemplate>
				</asp:Repeater>
				<label for="selectfamilyGroup" class="col-sm-3 control-label">
				Loan Amount:
				</label>
				<div class="col-sm-4 sm-mb">
					<asp:TextBox ID="txt_loanAmount" class="form-control" runat="server"></asp:TextBox>
				</div>
				<div class="col-sm-4 sm-mb">
				<asp:Button ID="Button17" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
				</div>
				<br /><br /><br />
				<div class="alert alert-danger" role="alert">
					<asp:Label ID="lbl_userAmountWarning" runat="server" Text=""></asp:Label>
					<a href="#request-approval" class="adv-link" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="advanced-search">Request Approval</a>
				</div>
			</asp:View>
			<asp:View ID="View2" runat="server">
				<asp:Repeater ID="rpt_PageContent2" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
				
			</asp:View>
			<asp:View ID="View3" runat="server">
				<asp:Repeater ID="rpt_PageContent3" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View4" runat="server">
				<asp:Repeater ID="rpt_PageContent4" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View5" runat="server">
				<asp:Repeater ID="rpt_PageContent5" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button Id="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button Id="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View6" runat="server">
				<asp:Repeater ID="rpt_PageContent6" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View7" runat="server">
				<asp:Repeater ID="rpt_PageContent7" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View8" runat="server">
				<asp:Repeater ID="rpt_PageContent8" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View9" runat="server">
				<asp:Repeater ID="rpt_PageContent9" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>

						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View10" runat="server">
				<asp:Repeater ID="rpt_PageContent10" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View11" runat="server">
				<asp:Repeater ID="rpt_PageContent11" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View12" runat="server">
				<asp:Repeater ID="rpt_PageContent12" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View13" runat="server">
				<asp:Repeater ID="rpt_PageContent13" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View14" runat="server">
				<asp:Repeater ID="rpt_PageContent14" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View15" runat="server">
				<asp:Repeater ID="rpt_PageContent15" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View16" runat="server">
				<asp:Repeater ID="rpt_PageContent16" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View17" runat="server">
				<asp:Repeater ID="rpt_PageContent17" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View18" runat="server">
				<asp:Repeater ID="rpt_PageContent18" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View19" runat="server">
				<asp:Repeater ID="rpt_PageContent19" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View20" runat="server">
				<asp:Repeater ID="rpt_PageContent20" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
			<asp:View ID="View21" runat="server">
				<asp:Repeater ID="rpt_PageContent21" runat="server" OnItemDataBound="rptPageContent_OnItemDataBound">
					<ItemTemplate>
						<h3><asp:Literal id="pageTitle" runat="server" />
						<h4><asp:Literal id="pageTitleSub" runat="server" /></h4></h3>
						<asp:Label ID="pageContent" runat="server" Text=""></asp:Label>
						<div class="col-sm-3">
							<img alt="" id="Image1" class="img-responsive img-rounded" width="200" runat="server" />
						</div>
						<div class="col-sm-3">
							<img alt="" id="Image2" class="img-responsive img-rounded"  width="200" runat="server" />
						</div>
						<asp:Button ID="btn_Continue" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Continue" />
						<asp:Button ID="btn_Yes" CssClass="btn btn-primary" OnClick="ButtonNext_Click" runat="server" Text="Yes" />
						<asp:Button ID="btn_No" CssClass="btn btn-primary" OnClick="ButtonPrev_Click" runat="server" Text="No" />
					</ItemTemplate>
				</asp:Repeater>
			</asp:View>
		</asp:MultiView>
		<fieldset id="request-approval" class="collapse">	
			<h3>Request Approval</h3> <!-- /.form-group -->
		
			<div class="form-group">
				<label for="ddlEventID" class="col-sm-4 control-label" data-placement="right">
					Supervisor Username
				</label>
				<div class="col-sm-4 sm-mb">
					<asp:TextBox ID="TextBox5" class="form-control" runat="server"></asp:TextBox>
				</div>
	
				<label for="ddlFulfillmentType" class="col-md-1 col-sm-4 control-label sm-mt" data-placement="right">
					Amount
				</label>
				<div class="col-md-3 col-sm-4">
					<asp:TextBox ID="TextBox6" class="form-control" runat="server"></asp:TextBox>
				</div>
			</div> <!-- /.form-group -->
		
			<div class="form-group"> <!-- needed here because this class is the form version of .row -->
				<div align="right" style="padding-right:15px;" data-placement="right">
					<input type="submit" id="Submit3" class="btn btn-primary" value="Continue" runat="server" />
				</div>
			</div> <!-- /.form-group -->
		</fieldset>
	</div>
	<div class="col-md-3">
		<br />
		<asp:HiddenField ID="hdnAmount" runat="server" Value="" />
		<asp:HiddenField ID="hdnUname" runat="server" Value="" />
		<asp:HiddenField ID="hdnFieldLoanAmount" runat="server" Value="" />
		<asp:HiddenField ID="hdnFileId" runat="server" Value="" />
		<div class="list-group">
			<a href="#" id="chlist1" class="list-group-item list-group-item-success" runat="server">Check Approval Limit</a>
			<a href="#" id="chlist2" class="list-group-item list-group-item-primary" runat="server">Member Info</a>
			<a href="#" id="chlist3" class="list-group-item list-group-item-primary" runat="server">Charge Offs</a>
			<a href="#" id="chlist4" class="list-group-item list-group-item-primary" runat="server">Negatives On Accounts</a>
			<a href="#" id="chlist5" class="list-group-item list-group-item-primary" runat="server">Linked Accounts</a>
			<a href="#" id="chlist6" class="list-group-item list-group-item-primary" runat="server">Joint Info</a>
			<a href="#" id="chlist7" class="list-group-item list-group-item-primary" runat="server">Review Info in  Loan Details/Financial Profile</a>
			<a href="#" id="chlist8" class="list-group-item list-group-item-primary" runat="server">Review Liabilities</a>
			<a href="#" id="chlist9" class="list-group-item list-group-item-primary" runat="server">Debt Consolidation</a>
			<a href="#" id="chlist10" class="list-group-item list-group-item-primary" runat="server">Account Verification</a>
			<a href="#" id="chlist11" class="list-group-item list-group-item-primary" runat="server">Proving Income</a>
			<a href="#" id="chlist12" class="list-group-item list-group-item-primary" runat="server">Approve Loan</a>
			<a href="#" id="chlist13" class="list-group-item list-group-item-primary" runat="server">Loan Rate Review</a>
			<a href="#" id="chlist14" class="list-group-item list-group-item-primary" runat="server">Summary</a>
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
