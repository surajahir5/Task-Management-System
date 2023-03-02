<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="inprocess.aspx.cs" Inherits="TaskMS.inprocess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link href="CSS/table.css" rel="stylesheet" />
    <style>
        #mytable_wrapper{
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
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
        <HeaderTemplate>
            <table id="mytable">
                <thead style="background-color:antiquewhite">
                    <tr>
                        <th>S.NO</th>
                        <th>Task Tittle</th>
                        <th>Department</th>
                        <th>Assign To</th>
                        <th>Assign Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("taskid") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("department") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("std") %>'></asp:Label>
                </td>
                <td>
                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("etd") %>'></asp:Label>
                </td>
                <td>
                     <asp:Label ID="Label6" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
             </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>

