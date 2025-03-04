<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminmaster.Master" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="OnlineExaminationSystem.Admin.admin_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>
    <title>Online_Examination_System</title>
    <style>
    /* Main content area */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }

        /* Top bar styling */
        .topbar {
            background-color: #2f3542;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Dashboard Stats Cards */
        .dashboard-stats {
            display: flex;
            justify-content: flex-start;
            margin-top: 50px;
            gap: 50px;
            
            flex-wrap: wrap;
        }

        .card {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            width: 25%;
            transition: 0.3s;
            margin-bottom: 20px;
        }

        .card h3 {
            font-size: 22px;
            color: #333;
        }

        .card p {
            font-size: 32px;
            font-weight: bold;
            color: #2f3542;
        }

        .card:hover {
            background-color: #f1f3f7;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <form>
        <div class="main-content">
            <div class="topbar">
                <span>Welcome, Admin!</span>
            </div>
            <div class="dashboard-stats">
                <div class="card">
                    <h3>Total Subjects</h3>
                    <p><asp:Label ID="lblTotalSubjects" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="card">
                    <h3>Total Students</h3>
                    <p><asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
        </div>
    </form>
</body>
</asp:Content>
