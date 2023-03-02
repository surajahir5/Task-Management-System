<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="updatetask.aspx.cs" Inherits="TaskMS.updatetask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">\

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-md-6 ">

<div class="card mt-5" style="margin-left:110px">
	<div class="card-body" style="background-color:lightgray" >
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h5 class="mb-2 text-primary" style="color:black">Task Details</h5>
			</div>
				<div class="form-group">
					<label >Department Name</label>
					<asp:TextBox ID="department" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
					<label >Employee Name</label>
					<asp:TextBox ID="empname" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
					<label >Task Priority</label>
					<asp:TextBox ID="tpriority" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
					<label >Task Tittle</label>
					<asp:TextBox ID="tittle" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
					<label >Task Description</label>
					<asp:TextBox ID="description" ReadOnly="true" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
				</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group ">
						<label >Start Date </label>
					<asp:TextBox ID="sdate" class="form-control" ReadOnly="true"  runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group ">
					<label >End Date</label>
					<asp:TextBox ID="edate" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group text-primary">

				<label >Status</label>
					<asp:DropDownList ID="DropDownstatus"  class="form-control" runat="server">
                        <asp:ListItem disabled="disabled" Value="" Selected="True">Choose Status</asp:ListItem>
                        <asp:ListItem>Inprocess</asp:ListItem>
                        <asp:ListItem>Complete</asp:ListItem>
                    </asp:DropDownList>
				</div>
			</div>
		</div>
		<%--<div class="row gutters">	
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
				
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					
				</div>
			</div>
		</div>--%>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right mt-2">
					<asp:Button ID="update" class="btn btn-primary" runat="server" Text="Update" OnClick="update_Click" />
					<asp:Button ID="cencel" class="btn btn-secondary" runat="server" Text="Cencel" />			
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</asp:Content>
