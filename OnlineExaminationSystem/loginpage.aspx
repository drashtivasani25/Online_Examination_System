<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="OnlineExaminationSystem.loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Examination System Management</title>
    <style>
         body {
            font-family: Arial;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .header {
            background-color: #17a589;
            padding: 25px;
            text-align: center;
            color: white;
            font-size: 25px;
            font-weight: bold;
        }
        .container {
            margin: 50px auto;
            width: 400px;
            padding: 25px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .dropdown{
            width: 380px;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
       
         .input-field{
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
         }
         .login-button{
            width: 96%;
            padding: 10px;
            background-color: #17a589;
            color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
        }
         .button:hover{
            background-color: #13856d;
        }

    </style>
</head>
<body>
    <div class="header">
        Online Examination System Management
    </div>
    <div class="container">
    <form id="form1" runat="server">
         <div class="form-group">
        <asp:DropDownList ID="ddlAccountType" runat="server" CssClass="dropdown">
            <asp:ListItem Text="--Select Account Type--" Value="0" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
            <asp:ListItem Text="Teacher" Value="Teacher"></asp:ListItem>
            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        </asp:DropDownList>
    </div>    
    <div class="form-group">
        <label>User Name:</label>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" required placeholder="Enter email"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" required placeholder="Enter password"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />
        <br /><br /><br />
        <label>Don't have an Account?&nbsp;&nbsp;&nbsp;<a href="registration.aspx">Sign Up</a></label>
    </div>
    </form>
    </div>
</body>
</html>
