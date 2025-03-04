<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="OnlineExaminationSystem.User.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>
    <title>Online Examination System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .about-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .about-heading {
            font-size: 36px;
            font-weight: bold;
            text-align: left;
            color: #2c3e50;
            margin-top:150px;
            margin-bottom: -50px;
            letter-spacing: 2px;
        }
        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
            margin-top: 40px;
        }
        .about-text {
            font-size: 18px;
            line-height: 1.6;
            color: #333;
        }
        .about-text ul {
            padding-left: 20px;
        }
        .about-text ul li {
            margin-bottom: 10px;
            list-style-type: square;
        }
        .about-image img {
            width: 110%;
            height: 500px;
            border-radius: 40px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .about-content {
                grid-template-columns: 1fr; 
            }
            .about-heading {
                font-size: 28px;
            }
            .about-text {
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            .about-heading {
                font-size: 24px;
            }
            .about-text {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form id="form1">
        <div class="about-container">
            <div class="about-heading">ABOUT US</div>
            <div class="about-content">
                <div class="about-text">
                    <p><strong>Welcome To the Online Examination System! Our platform offers a modern, efficient, and secure way for students to take exams online and track their progress.</strong></p>
                    
                    <ul>
                        <li>Our mission is to make education more accessible and provide a secure online environment for exam-taking.</li>
                        <li>The platform is designed to be user-friendly and provides various features for both students and administrators.</li>
                        <li>Whether you are a student looking for a convenient way to take exams or an educator seeking an efficient way to conduct tests.</li>
                    </ul>
                    <p>Whether you’re a student looking for a stress-free way to take exams, the <strong>Online Examination System</strong> has everything you need to succeed.</p>
                </div>
                <div class="about-image">
                    <img src="/images/about.jpg" alt="About Image">
                </div>
            </div>
        </div>
    </form>
</body>
</asp:Content>
