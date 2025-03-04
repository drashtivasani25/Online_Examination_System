<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="OnlineExaminationSystem.registration" %>

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

        .input-field {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .register-button {
            width: 96%;
            padding: 10px;
            background-color: #17a589;
            color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
        }

        .register-button:hover {
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
                <label>First Name:</label>
                <asp:TextBox ID="txtfName" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Fname" ForeColor="Red" ControlToValidate="txtfName"></asp:RequiredFieldValidator>
            </div>
             <div class="form-group">
                <label>Last Name:</label>
                <asp:TextBox ID="txtlName" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Lname" ForeColor="Red" ControlToValidate="txtlName"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Email" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
            </div>
            
            <div class="form-group">
                <label>Gender:</label>
                <asp:RadioButtonList ID="rblGender" runat="server">
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select Gender" ForeColor="Red" ControlToValidate="rblGender"></asp:RequiredFieldValidator>
            </div>
        
            <div class="form-group">
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </div>  
            <div class="form-group">
                <label>Confirm Password:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Confirm Password" ForeColor="Red" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="register-button" OnClick="btnRegister_Click" />
            </div>
        <label>If you have already an Account?&nbsp;&nbsp;&nbsp;<a href="loginpage.aspx">Sign in</a></label>
    </form>
    </div>
</body>
</html>
