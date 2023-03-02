<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="TaskMS.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     <script type="text/javascript">
         function userValid() {
             debugger
            var name, contact, email, depart,password, repass, emailExp;
            name = document.getElementById("name").value;
            conatct = document.getElementById("contact").value;
            var length = document.getElementById("contact").value.length;
            email = document.getElementById("email").value;
             depart = document.getElementById("dpart").value;       
            password = document.getElementById("password").value;
            repass = document.getElementById("repass").value;  
            emailExp =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id 
             var passw =;
             if (name == '' && contact == '' && email == '' && depart == '' && password == '' && repass == '') {
                alert("Enter All Field");
                return false;
            }
            if (name == '') {
                alert("Enter Name Field")
                return false;
            }
            if (contact == '') {
                alert("Enter mobile number")
                return false; 
            }
            if ((length != 10)) {
                alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
                return false;
            }
            if (email == '') {
                alert("Enter gmail Field")
                return false;
            }
            if (!email.match(emailExp)) { 
                    alert("Invalid Email Id");
                return false;
            }
            if (depart == '') {
                alert("Select Department")
                return false;
            }
            
            if (password == '') {
                alert("Enter Password Field")
                return false;
            } 
            if (!password.match(passw)) {
                alert("Invalid password")
                return false;
            }
            if (repass == '') {
                alert("Enter Password Field")
                return false;
            }
            if (password.match(repass)) {
                alert("Password not match")
                return false;
             }   
             return true;   
        }
    </script>
    <style>
        .gradient-custom-3 {
            background: #84fab0;
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
            background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
        }
        .gradient-custom-4 { 
            background: #84fab0;
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
</head>
<body>
  
  <section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
           
            <div class="card-body p-5">
                <img src="images/register logo.png" height="60" width="70" style="margin-left:174px" />
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                
            <form id="form1" runat="server">
                <div class="form-outline mb-4">
                    <asp:TextBox ID="name" class="form-control form-control-lg" Placeholder="Your Name" runat="server"></asp:TextBox>
                </div>
                <div class="form-outline mb-4">        
                    <asp:TextBox ID="contact" class="form-control form-control-lg" placeholder="Contact" runat="server"></asp:TextBox>
                 </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="email" class="form-control form-control-lg" placeholder="Email" runat="server"></asp:TextBox>
                 </div>
                 <div class="form-outline mb-4">
                   <div class="col-12">
                         <label class="form-label select-label">Choose Department</label>                   
                     <asp:DropDownList ID="dpart" class="select form-control-lg"  runat="server">
                         <asp:ListItem disabled="disabled" Selected="True">-Department-</asp:ListItem>
                         <asp:ListItem>Asp.net</asp:ListItem>
                         <asp:ListItem>Php</asp:ListItem>
                         <asp:ListItem>Designer</asp:ListItem>
                         <asp:ListItem>Java</asp:ListItem>
                         <asp:ListItem>Node.js</asp:ListItem>
                     </asp:DropDownList>
                     </div>
                </div>

                <div class="form-outline mb-4">
                    <asp:TextBox ID="password" class="form-control form-control-lg" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                 </div>

                <div class="form-outline mb-4">
                    <asp:TextBox ID="repass" class="form-control form-control-lg" placeholder="Conform password" runat="server" TextMode="Password"></asp:TextBox>
                   </div>
                <div class="d-flex justify-content-center">
                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" runat="server" Text="REGISTER" OnClientClick="return userValid();" OnClick="Button1_Click" ValidationGroup="reg" />
                </div>
                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.aspx"
                    class="fw-bold text-body"><u>Login here</u></a></p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
