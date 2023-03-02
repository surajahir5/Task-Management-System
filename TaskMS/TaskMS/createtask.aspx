<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="createtask.aspx.cs" Inherits="TaskMS.createtask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .task{
            margin-left:163px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class=" bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp'); background-size:cover">
  <div class="mask d-flex align-items-center  gradient-custom-3">
    <div class="container task ">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2> ADD TASK</h2>
                <div class="form-outline mb-4">
                    <asp:Label ID="Label1" runat="server" Text="Select Department"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" class="form-control form-control-lg" runat="server" >
                        <asp:ListItem disabled="disabled" Selected="True">-Select-</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-outline mb-4">
                    <asp:Label ID="Label2" runat="server" Text="Employee"></asp:Label>
                    <asp:DropDownList ID="emplist" class="form-control form-control-lg"  placeholder="Employee List" runat="server"></asp:DropDownList>     
                </div>
                <div class="form-outline mb-4">
                    <asp:Label ID="Label3" runat="server" Text="Task Priority"></asp:Label>
                    <asp:DropDownList ID="taskprioty" class="form-control form-control-lg" runat="server">
                        <asp:ListItem disabled="disabled" Selected="True">-Select Priority-</asp:ListItem>
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>Median</asp:ListItem>
                        <asp:ListItem>Urgent</asp:ListItem>
                        <asp:ListItem>Most Urgent</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-outline mb-4">
                    <asp:Label ID="Label4" runat="server" Text="Task Tittle"></asp:Label>
                    <asp:TextBox ID="tasktitle" class="form-control form-control-lg" runat="server"></asp:TextBox>
                </div>
                <div class="form-outline mb-4">
                    <asp:Label ID="Label5" runat="server" Text="Task description"></asp:Label>
                    <asp:TextBox ID="describ" class="form-control form-control-lg" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                  <div class="form-outline mb-4">
                    <asp:Label ID="Label6" runat="server" Text="Task Start Date"></asp:Label>
                    <asp:TextBox ID="std" class="form-control form-control-lg" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-outline mb-4">
                    <asp:Label ID="Label7" runat="server" Text="Task End Date"></asp:Label>
                    <asp:TextBox ID="tdate" class="form-control form-control-lg" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="d-flex justify-content-center">
                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" runat="server" Text="SUBMIT" OnClick="Button1_Click"  />
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>

