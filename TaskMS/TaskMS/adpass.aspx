<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="adpass.aspx.cs" Inherits="TaskMS.adpass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .task{
            margin-left:163px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100 task">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Change Password</h2>
               <div class="form-outline mb-4">
                 
                <%--  <label class="form-label" for="form3Example3cg">Your Email</label>--%>
                    <asp:TextBox ID="oldpass" class="form-control form-control-lg" placeholder="Current Password" runat="server" TextMode="Password"></asp:TextBox>
                  </div>
                

                  <div class="form-outline mb-4">
              
               <%--   <label class="form-label" for="form3Example4cg">Password</label>--%>
                    <asp:TextBox ID="newpass" class="form-control form-control-lg" placeholder="New Password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="8 characters including 1 uppercase letter, 1 special character, alphanumeric characters" ForeColor="Red" ControlToValidate="newpass" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^A-Za-z0-9]).{6,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-outline mb-4">
                 
               <%--   <label class="form-label" for="form3Example4cdg">Conform password</label>--%>
                    <asp:TextBox ID="repass" class="form-control form-control-lg" placeholder="Conform password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Conform Password" ControlToCompare="oldpass" ControlToValidate="repass" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    
                </div>

                <div class="d-flex justify-content-center">
                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" runat="server" Text="CHANGE PASSWORD" OnClick="Button1_Click" />
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>

