<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teachermaster.Master" AutoEventWireup="true" CodeBehind="manage_questions.aspx.cs" Inherits="OnlineExaminationSystem.Teacher.manage_questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>
    <title>Online Examination System</title>
    <style>
        .main-content{
            padding-left:50px;
        }
        label { 
            display: block; 
            margin-bottom: 30px; 
            font-weight: bold; 
        }
        .select { 
            width: 50%; 
            padding: 10px; 
            margin-bottom: 30px; 
            border: 1px solid #ccc; 
            border-radius: 4px;
        }
        .btn { 
            background-color: #28a745;
            color: white; 
            padding: 10px; 
            border: none; 
            border-radius: 4px; 
            cursor: pointer;
        }
        .btn:hover {
            background-color: #218838;
        }
        .error { 
            color: red;
            font-weight: bold; 
        }
    </style>
</head>
    <body>
    <div class="main-content">
    <h2>Select Subject</h2><br />
    <label for="ddlSubjects">Choose a Subject:</label>
    <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="select"></asp:DropDownList><br />
        <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label><br /><br />
    <asp:Button ID="btnaddquestion" runat="server" CssClass="btn" Text="Add Question" OnClick="btnaddquestion_Click"/>
    <asp:Button ID="btnviewquestion" runat="server" Text="View Question" CssClass="btn" OnClick="btnviewquestion_Click"/>
    </div>
</body>
</asp:Content>
