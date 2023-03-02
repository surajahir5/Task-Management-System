<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="adpro.aspx.cs" Inherits="TaskMS.adpro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/adpro.css" rel="stylesheet" />
     <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <style>
        .task{
            margin-left:163px;
        }
    </style>

</asp:Content>  


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-xl px-4 mt-4 task">
    <!-- Account page navigation-->
    <nav class="nav nav-borders">
        <a class="nav-link active ms-0" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" target="__blank">Profile</a>
      
    </nav>
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <asp:Image ID="Image1" runat="server" Height="97px" Width="112px" />
                  <%-- <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">--%>
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <!-- Profile picture upload button-->
                   <div class="col-md-3 bg-primary">
                     <asp:FileUpload class="bg-primary" style="width:250px; color:black" ID="adprofile" onchange="ShowImagePreview(this)" runat="server" />
                   </div>
                  </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                  
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Name </label>
                            <asp:TextBox class="form-control" ID="upname" runat="server"></asp:TextBox>
                        </div> 
                  
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Contact </label>
                            <asp:TextBox class="form-control" ID="upcontact" runat="server"></asp:TextBox>
                        </div> 
                  
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Email</label>
                            <asp:TextBox class="form-control" ID="upemail" runat="server"></asp:TextBox>
                        </div> 
                   
                       <%-- <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Department</label>
                            <asp:TextBox class="form-control" ID="updpart" runat="server"></asp:TextBox>
                        </div>  --%>
                        <!-- Save changes button-->
                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Save Changes" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

