<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="statusview.aspx.cs" Inherits="TaskMS.statusview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container py-5" style="margin-left:163px;">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
              <asp:Image ID="Image1" class="rounded-circle img-fluid" style="width: 150px;" runat="server" />
          <%--  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"--%>        
            <h5 class="my-3"> <asp:Label ID="name" runat="server" Text="name"></asp:Label></h5> 
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Department</p>
              </div>
              <div class="col-sm-9">
                  <asp:Label ID="department" class=" mb-0" runat="server" Text="label"></asp:Label>
              <%--  <p class="text-muted mb-0">Johnatan Smith</p>--%>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Task Priority</p>
              </div>
              <div class="col-sm-9">
                  <asp:Label ID="taskpriority" runat="server" Text="Label"></asp:Label>
               <%-- <p class="text-muted mb-0">example@example.com</p>--%>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Task Title</p>
              </div>
              <div class="col-sm-9">
                  <asp:Label ID="tasktitle" runat="server" Text="Label"></asp:Label>
              <%--  <p class="text-muted mb-0">(097) 234-5678</p>--%>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Task Description</p>
              </div>
              <div class="col-sm-9">
                  <asp:Label ID="descriotion" runat="server" Text="Label"></asp:Label>
               <%-- <p class="text-muted mb-0">(098) 765-4321</p>--%>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Start Date</p>
              </div>
              <div class="col-sm-9">
                  <asp:Label ID="startdate" runat="server" Text="Label"></asp:Label>
              <%--  <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>--%>
              </div>
            </div>
              <hr />
              <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">End Date</p>
              </div>
              <div class="col-sm-9">
                  <asp:Label ID="enddate" runat="server" Text="Label"></asp:Label>
               <%-- <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>--%>
              </div>
            </div>
              <hr />
             <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Status</p>
              </div>
              <div class="col-sm-9">
               <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
               <%-- <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>--%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
        <div class="d-flex justify-content-center mb-2">
            <asp:Button ID="back" class="btn btn-secondary btn-lg" runat="server" Text="Back" />
            <asp:Button ID="download" class="btn btn-outline-success ms-2" runat="server" Text="Download" OnClick="download_Click" CommandName="download" />
        </div>
  </div>
</asp:Content>
