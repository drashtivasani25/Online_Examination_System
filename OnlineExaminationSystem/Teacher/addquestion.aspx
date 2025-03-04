<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teachermaster.Master" AutoEventWireup="true" CodeBehind="addquestion.aspx.cs" Inherits="OnlineExaminationSystem.Teacher.addquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>Online Examination System</title>
        <style>
            .form-container {
                max-width: 500px;
                margin: 100px auto;
                padding: 40px;
                border-radius: 10px;
                background-color: #f8f9fa;
                box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            }

                .form-container h2 {
                    text-align: center;
                }

            .option {
                display: flex;
                align-items: center;
                margin: 8px 0;
            }

                .option input {
                    margin-right: 10px;
                }

            .btn-submit {
                width: 100%;
                padding: 10px;
                background-color: #2f3542;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

                .btn-submit:hover {
                    background-color: #1e242e;
                }
        </style>
    </head>
    <body>
        <form>
            <div class="form-container">
                <h2>Add Question<asp:Label ID="lblSubject" runat="server"></asp:Label></h2>
                <br />

                <label>Enter Question:</label>
                <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Question!" ForeColor="Red" ControlToValidate="txtQuestion"></asp:RequiredFieldValidator>
                <label>Options:</label>
                <div class="option">
                    <label>A.</label>
                    <asp:TextBox ID="txtOption1" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtOption_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Option1" ForeColor="Red" ControlToValidate="txtOption1"></asp:RequiredFieldValidator>
                </div>
                <div class="option">
                    <label>B.</label>
                    <asp:TextBox ID="txtOption2" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtOption_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Option2" ForeColor="Red" ControlToValidate="txtOption2"></asp:RequiredFieldValidator>
                </div>
                <div class="option">
                    <label>C.</label>
                    <asp:TextBox ID="txtOption3" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtOption_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Option3" ForeColor="Red" ControlToValidate="txtOption3"></asp:RequiredFieldValidator>
                </div>
                <div class="option">
                    <label>D.</label>
                    <asp:TextBox ID="txtOption4" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtOption_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Option4" ForeColor="Red" ControlToValidate="txtOption4"></asp:RequiredFieldValidator>
                </div>

                <label class="correct-answer">Select Correct Answer:</label>
                <asp:DropDownList ID="ddlCorrectAnswer" runat="server" CssClass="form-control">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select correct answer" ForeColor="Red" ControlToValidate="ddlCorrectAnswer"></asp:RequiredFieldValidator>

                <asp:Button ID="btnSubmit" runat="server" Text="Add" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>
        </form>
    </body>
</asp:Content>
