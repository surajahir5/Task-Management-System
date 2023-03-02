<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TaskMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     <script type="text/javascript">
         function userValid() {
            var email,password;   
             email = document.getElementById("uname").value;
             password = document.getElementById("pass").value;
             if ( email == '' && password == '') {
                alert("Enter All Field");
                return false;
            }
           
            if (email == '') {
                alert("Enter gmail Field")
                return false;
            }
           
            if (password == '') {
                alert("Enter Password Field")
                return false;
            } 
             
             return true;   
        }
    </script>
</head>
<body>
    <section class="vh-100" style="background-color: #9A616D;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="images/tsm.png"
                                    alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">
                                    <form runat="server">
                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <i class="fas fa-tasks fa-2x me-3" style="color: #ff6219;"></i>
                                            <span class="h1 fw-bold mb-0">Task Management System</span>
                                        </div>
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="uname" class="form-control form-control-lg" placeholder="Email" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="pass" class="form-control form-control-lg" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="pt-1 mb-4">
                                            <asp:Button ID="Button1" class="btn btn-dark btn-lg btn-block" OnClientClick="return userValid();" runat="server" Text="LOGIN" OnClick="Button1_Click" />
                                        </div>
                                        <a class="small text-muted" href="forgetpass.aspx">Forgot password?</a>
                                        <p class="mb-5 pb-lg-2" style="color: #393f81;">
                                            Don't have an account? <a href="register.aspx"
                                                style="color: #393f81;">Register here</a>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
