<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.Master" AutoEventWireup="true" CodeBehind="home_page.aspx.cs" Inherits="OnlineExaminationSystem.User.home_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>Online Examination System</title>
        <style>
            /*about section*/
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
                margin-top: 150px;
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

            /* Hero Section */
            .hero {
                position: relative;
                height: 500px;
                overflow: hidden;
            }

                .hero .background {
                    background-image: url('/images/home_page.jpg');
                    background-size: cover;
                    background-position: center center;
                    background-repeat: no-repeat;
                    height: 100%;
                    filter: blur(8px);
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    z-index: 1;
                }

                .hero .hero-content {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    color: white;
                    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
                    z-index: 2;
                }

                .hero h1 {
                    font-size: 3rem;
                    margin-bottom: 20px;
                }

                .hero p {
                    font-size: 1.2rem;
                }



            /* Exams Section */
            .exams-section {
                background-color: #fff;
                padding: 60px 20px;
            }

            .container {
                width: 80%;
                margin: 0 auto;
            }

            .section-title {
                text-align: center;
                font-size: 2.5rem;
                margin-bottom: 40px;
            }

            .exam-cards {
                display: flex;
                justify-content: flex-start;
                gap: 20px;
                flex-wrap: wrap;
            }

            .exam-card {
                background-color: #fff;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 30%;
                border-radius: 8px;
                overflow: hidden;
                transition: transform 0.3s ease-in-out;
            }

                .exam-card:hover {
                    transform: translateY(-10px);
                }

            .exam-card-inner {
                padding: 20px;
                text-align: center;
            }

                .exam-card-inner h3 {
                    font-size: 1.8rem;
                    margin-bottom: 15px;
                }

                .exam-card-inner .btn-secondary {
                    background-color: #28a745;
                    color: white;
                    padding: 10px 20px;
                    font-size: 1rem;
                    border: none;
                    border-radius: 5px;
                    text-decoration: none;
                    transition: background-color 0.3s;
                }

                    .exam-card-inner .btn-secondary:hover {
                        background-color: #218838;
                    }
        </style>
    </head>

    <body>
        <!-- Hero Section -->
        <section class="hero">
            <div class="background"></div>
            <div class="hero-content">
                <h1>Welcome to the Online Examination System</h1>
                <p>Prepare, Take Exams, Get Results. All at your convenience!</p>
            </div>
        </section>

        <!--about page-->
        <form>
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

        <!-- Exams Section -->

        <section class="exams-section">
            <div class="container">
                <h2 class="section-title">Available Subjects</h2>
                <div class="exam-cards">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="exam-card">
                                <div class="exam-card-inner">
                                    <h3><%# Eval("subname") %></h3>
                                    <asp:Button runat="server" Text="Start Exam" class="btn-secondary" CommandArgument='<%# Eval("subid") %>' OnClick="btnStart_Clicked" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

    </body>
</asp:Content>
