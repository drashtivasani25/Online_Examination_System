<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.Master" AutoEventWireup="true" CodeBehind="exam.aspx.cs" Inherits="OnlineExaminationSystem.User.exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
</asp:Content>
