<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="TaskMS.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link href="CSS/table.css" rel="stylesheet" />
    <style>
        .report{
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
    <div class="report">
        <div class="card mb-4">
            <div class="card-header">Between Dates Task Reports</div>
            <div class="card-body">
                <div class="container1">
                    <div class=" d-flex ">
                        <div class="me-5 d-flex flex-column " style="width: 225px; margin-left: 140px">
                            <asp:Label runat="server" ID="fromdatelbl" Text="From Date"></asp:Label>
                            <asp:TextBox ID="fromdate" runat="server" TextMode="Date" CssClass="form-control  " ></asp:TextBox>
                        </div>
                        <div class="me-2 d-flex flex-column " style="width: 225px;">
                            <asp:Label ID="todatelbl" runat="server" Text="To Date"></asp:Label>
                            <asp:TextBox ID="todate" runat="server" TextMode="Date" CssClass="form-control " ></asp:TextBox>
                        </div>
                        <div>
                            <asp:Button ID="datefilter" runat="server" class="btn btn-primary mt-4 me-5 " Text="Show" OnClick="datefilter_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                <table id="mytable" class="table">
                    <thead style="background-color:antiquewhite">
                        <tr>
                        <th>S.NO</th>
                        <th>Task Tittle</th>
                        <th>Department</th>
                        <th>Assign To</th>
                        <th>Assign Date</th>
                        <th>End Date</th>    
                        <th>Action</th>
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
                    <asp:Button ID="Button1" CommandName="viewstatus" Class="btn btn-outline-info" runat="server" Text="View" />
                </td>
            </tr>
        </ItemTemplate>
            <FooterTemplate>
                   </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

