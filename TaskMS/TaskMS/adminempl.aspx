<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="adminempl.aspx.cs" Inherits="TaskMS.adminempl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link href="CSS/table.css" rel="stylesheet" />
<link href="CSS/empdata.css" rel="stylesheet" />
    <style>
        #mytable_wrapper {
    margin-top: 30px;
    margin-right: 20px;
    margin-left: 175px;
}
    </style>
  <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script>
    $(document).ready(function () {
        $('#mytable').DataTable({
            "lengthChange": false
        });
       
            });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>   
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
       <table id="mytable" class="table">
           <thead style="background-color:antiquewhite" >
               <tr>
                   <th>Empid</th>
                   <th>Name</th>
                   <th>Contact</th>
                   <th>Email</th>
                   <th>Department</th>   
                  <%-- <th>Image</th>--%>
                   <th>Action</th>
                   <th><asp:Button ID="Button1" runat="server" class="btn btn-danger" Text="Delete" OnClick="Button1_Click" />
                     </th>
               </tr>
           </thead>
    
        </HeaderTemplate>
        <ItemTemplate>
              <tr>
                  <td>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Empid") %>'></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                      <asp:TextBox ID="empname" CssClass="form-control" Text='<%# Eval("name") %>' Visible="false" runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                      <asp:TextBox ID="empcon" CssClass="form-control" Text='<%# Eval("contact") %>' Visible="false" runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label4" runat="server"  Text='<%# Eval("email") %>'></asp:Label>
                      <asp:TextBox ID="empemail" CssClass="form-control" Text='<%# Eval("email") %>' Visible="false" runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label5" runat="server" Text='<%# Eval("department") %>'></asp:Label>
                      <asp:DropDownList ID="depatList1" CssClass="form-control" SelectedValue='<%# Eval("department") %>' Visible="false" runat="server" AppendDataBoundItems="True" DataTextField="department" DataValueField="department" AutoPostBack="True" DataSourceID="SqlDataSource1">
                          <asp:ListItem Value=""></asp:ListItem>
                      </asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:task %>' SelectCommand="SELECT DISTINCT [department] FROM [regitser]"></asp:SqlDataSource>
                  </td> 
                 <%-- <td>
                      <asp:Image ID="Image2" ImageUrl='<%# Eval("image") %>' Height="40px" Width="40px" runat="server" />
                      <asp:Image ID="Image1" CssClass="form-control" ImageUrl='<%# Eval("image") %>' height="150px" Width="150px" Visible="false" runat="server" />
                      <asp:FileUpload ID="FileUpload1" Visible="false" runat="server" />
                  </td>--%>
                  <td>
                      <asp:LinkButton ID="Linkedit" CommandArgument='<%# Eval("Empid") %>' CommandName="edit" Class="btn btn-outline-info" runat="server"><img src="images/EDITBTN.png" height="20" width="25" /></asp:LinkButton>
                      <asp:LinkButton ID="Linkupdate" CommandArgument='<%# Eval("Empid") %>' CommandName="update" Class="btn btn-outline-info" Visible="false" runat="server">Update</asp:LinkButton>
                      <asp:LinkButton ID="Linkcencel" CommandArgument='<%# Eval("Empid") %>' CommandName="cancel" Class="btn btn-danger" Visible="false" runat="server">Cancel</asp:LinkButton>
                  </td>
                  <td>
                      <asp:CheckBox ID="deletebox"  runat="server" />
                  </td>
              </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater> 
         </div>
</asp:Content>

