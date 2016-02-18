<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphJavaScript" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopNav" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContent" Runat="Server">
    <br />
    <ul class="list-group">
      <li class="list-group-item"><a href="ManageUsers.aspx"><i class="fa fa-chevron-circle-left"></i> Manage Users</a></li>
        <li class="list-group-item"><a href="UserRoles.aspx"><i class="fa fa-chevron-circle-left"></i> Manage Roles</a></li>
      <li class="list-group-item"><a href="ManagePages.aspx"><i class="fa fa-chevron-circle-left"></i> Manage Page Content</a></li>
      <li class="list-group-item"><a href="ImageUpload.aspx"><i class="fa fa-chevron-circle-left"></i> Manage Image Directory</a></li>
      <li class="list-group-item"><a href="Supoort.aspx"><i class="fa fa-chevron-circle-left"></i> Support</a></li>
    </ul>

</asp:Content>

