<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teachermaster.Master" AutoEventWireup="true" CodeBehind="update_question.aspx.cs" Inherits="OnlineExaminationSystem.Teacher.update_question" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

        .btn-update {
            width: 100%;
            padding: 10px;
            background-color: #2f3542;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-update:hover {
            background-color: #1e242e;
        }
    </style>
<body>
<form>
        <div class="form-container">
        <h2>Update Question<asp:Label ID="lblSubject" runat="server"></asp:Label></h2><br />

        <label>Enter Question:</label>
        <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control"></asp:TextBox><br /><br />
        <label>Options:</label>
        <div class="option">
            <label>A.</label>
            <asp:TextBox ID="txtOption1" runat="server" CssClass="form-control" ></asp:TextBox>
        </div>
        <div class="option">
            <label>B.</label>
            <asp:TextBox ID="txtOption2" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="option">
            <label>C.</label>
            <asp:TextBox ID="txtOption3" runat="server" CssClass="form-control" ></asp:TextBox>
        </div>
        <div class="option">
            <label>D.</label>
            <asp:TextBox ID="txtOption4" runat="server" CssClass="form-control" ></asp:TextBox>
        </div>

            <label class="correct-answer">Select Correct Answer:</label>
            <asp:DropDownList ID="ddlCorrectAnswer" runat="server" CssClass="form-control">
            </asp:DropDownList>

        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn-update" OnClick="btnUpdate_Click" />
    </div>
    </form>
</body>
</asp:Content>
