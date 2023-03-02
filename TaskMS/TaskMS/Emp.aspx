<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="Emp.aspx.cs" Inherits="TaskMS.Emp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="CSS/home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container" style="margin-left: 200px;">
    <div class="row mt-5">
        <div class=" col-xl-3">
            <div class="card order-card" style="background-color:#D0D0D0">
                <div class="card-block d-flex flex-column align-items-center">
                    <h5 style="color:black"><b>New Task</b></h5>
                    <a href="dashemptask.aspx"><img src="images/newemptask.png" width="80" height="80"/></a>
                    <h5 style="color:black"><br /><asp:Label ID="newtask" runat="server" Text="0"></asp:Label></h5>           
                </div>
            </div>
        </div>
      <div class="col-xl-3">
            <a style="text-decoration:none" href="dashemptask.aspx"> <div class="card  order-card" style="background-color:#A5D8DD">
                <div class="card-block d-flex flex-column align-items-center">
                    <h5 style="color:black"><b>Total Task</b></h5>
                   <img style="height:80px; width:80px" src="images/tts.png"/>
                    <h5 style="color:black"><br />
                        <asp:Label ID="totaltask" runat="server" Text=""></asp:Label></h5> 
                </div>
            </div></a>
        </div>
         <div class="col-xl-3">
               <asp:LinkButton style="text-decoration:none" OnClick="LinkButton2_Click" ID="LinkButton2" runat="server">
            <div class="card order-card" style="background-color:#7E909A">
                <div class="card-block d-flex flex-column align-items-center">
                    <h5 style="color:black"><b>Inprocess Task</b></h5>
                    <img src="images/incomp.png" style="height:80px ; width:80px"/> 
                    <h5 style="color:black">
                        <br /> <asp:Label ID="taskinprocess" runat="server" Text=""></asp:Label></h5>       
                </div>
            </div></asp:LinkButton>
        </div>   
        <div class=" col-xl-3">
          <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" style="text-decoration:none" runat="server">
            <div class="card order-card" style="background-color:#6AB187">
                <div class="card-block d-flex flex-column align-items-center"> 
                    <h5 style="color:black"><b>Complete Task</b></h5>
                    <img src="images/tt.png" style="height:80px ; width:80px"/> 
                    <h5 style="color:black">
                        <br />
                        <asp:Label ID="comptask" runat="server" Text=""></asp:Label>
                    </h5>
                </div>
            </div> </asp:LinkButton>   
        </div>  
	</div>          
</div>
</asp:Content>

