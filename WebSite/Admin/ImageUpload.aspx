<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="ImageUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphJavaScript" Runat="Server">
	<style type="text/css">
	  .modal-dialog {
		max-height: 400px;
	  }
	  
	  .dropzone { background: #fff url(//cdn.closetomyheart.com/global/consultant-image-uploader/wood-surface.jpg) center top repeat; }
	  
	  #tempImage { text-align: center; overflow: hidden; }
	  #tempImage img { margin: 0 auto; }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopNav" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
	<link href="../Scripts/fancybox-2.1.5/jquery.fancybox.css" rel="stylesheet" />
	<script src="../Scripts/fancybox-2.1.5/jquery.fancybox.pack.js"></script>
	<link href="dropzone/dropzone.css" rel="stylesheet" />
	<script src="dropzone/dropzone.js"></script>
	<h3>Image Directory</h3><hr />
	<p>
		Image Directory is the one stop shop to upload, modify, and delete images and/or documents.
	</p>
	<p><br /></p>
	<div class="dropzone" id="dropzoneForm">
		<div class="dz-default dz-message">
			  <h4>Drag &amp; Drop Here or</h4>
				<span id="file" class="btn btn-success fileinput-button" runat="server">
				<i class="fa fa-plus-circle"></i>
				<span>Add Photos&hellip;</span>
			</span>
			</div>
	</div> <!-- /.dropzone -->

	<div>
		<br /><br />
	<h4>Saved Images & Documents</h4><hr />
	<i>* Images that are uploaded above may not display in list immediately! Refresh browser to see latest updates!</i>
		<br /><br />
		<table>
		<asp:Repeater ID="rpt_ImageDirectory"  runat="server">
			<ItemTemplate>
				<tr>
					<td><asp:Image ID="liImageURL" Width="120px" BorderWidth="2px" ImageUrl="../Uploads/MyPhoto_1.jpg" runat="server" /></td>
				</tr>
				<tr>
					<td align="center"><a href="" id="liImageName" runat="server"></a></td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function () {
			console.log("Hello");
			Dropzone.autoDiscover = false;
			//Simple Dropzonejs 
			$("#dropzoneForm").dropzone({
				url: "../Code/hdl_FileUpload.ashx",
				maxFiles: 5,
				maxFileSize: 50, //MB
				parallelUploads: 1,
				autoQueue: true,
				addRemoveLinks: false,
				success: function (file, response) {
					var imgName = response;
					file.previewElement.classList.add("dz-success");
					console.log("Successfully uploaded :" + imgName);
				},
				error: function (file, response) {
					file.previewElement.classList.add("dz-error");
				}
			});
		});
	</script>
</asp:Content>

