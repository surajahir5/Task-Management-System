<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpass.aspx.cs" Inherits="TaskMS.forgetpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>

    <div class="container d-flex flex-column">
        <div class="row align-items-center justify-content-center g-0 min-vh-100">
            <div class="col-lg-5 col-md-8 py-8 py-xl-0">
                <div class="card shadow">
                    <div class="card-body p-6">
                        <div class="mb-4">
                            <a href="../index.html">
                                <img src="../assets/images/brand/logo/logo-icon.svg" class="mb-4" alt="" /></a>
                            <h1 style="text-align:center"> 🔒 </h1>
                            <h1 class="mb-1 fw-bold">Forgot Password? </h1>
                            <p>Enter your email and we'll send you instructions to reset your password</p>
                        </div>
                        <form id="form1" runat="server">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <asp:TextBox ID="email" class="form-control" placeholder="Enter Your Email " runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3 d-grid">
                                <asp:Button ID="forget" class="btn btn-primary" runat="server" Text="Send Resest Link" OnClick="forget_Click" />
                            </div>
                            <div class="text-center">
                                 <span>Return to <a href="login.aspx">Log in</a></span>   
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
