<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.Master" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="OnlineExaminationSystem.User.result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>Online Examination System</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: radial-gradient(circle, rgba(0, 0, 0, 0.08), #E0FFFF);
                margin: 0;
                padding: 0;
            }
            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                margin-top: 50px;
            }
            .score-panel {
                background: linear-gradient(to right, #38ef7d, #11998e);
                color: white;
                padding: 30px;
                border-radius: 8px;
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 20px;
                text-align: center;
                box-shadow: 0px 6px 14px rgba(0, 0, 0, 0.1);
            }
            .panel {
                width: 80%;
                max-width: 800px;
                background: rgba(255, 255, 255, 0.97);
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0px 6px 14px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }
            .panel:hover {
                transform: scale(1.03);
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            }
            .question-box {
                background: #f9f9f9;
                padding: 15px;
                border-radius: 8px;
                margin: 10px 0;
                box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.08);
            }
            .question {
                font-size: 18px;
                font-weight: bold;
                color: #34495e;
            }
            .answer {
                font-size: 16px;
                font-weight: bold;
                margin-top: 5px;
            }
            .correct {
                color: green;
            }
            .wrong {
                color: red;
            }

            .btn-back {
            margin-top:20px;
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            margin-right:770px;
        }

            .btn-back:hover {
                background-color: #45a049;
            }

        </style>
    </head>
    <body>
         <div class="container">
            <div class="score-panel">
                <asp:Label ID="lblTotalQuestions" runat="server"></asp:Label><br />
                <asp:Label ID="lblCorrectAnswers" runat="server"></asp:Label><br />
                <asp:Label ID="lblPercentage" runat="server"></asp:Label><br />
                <asp:Label ID="lblScore" runat="server"></asp:Label><br />
            </div>

            <div class="panel">
                <asp:Repeater ID="rptResults" runat="server">
                    <ItemTemplate>
                        <div class="question-box">
                            <div class="question">
                                Q:<%# Container.ItemIndex+1 %>) <%# Eval("questext") %>
                            </div>
                            <div class="answer">
                                <strong>Your Answer:</strong> 
                              <span class='<%# Eval("ResultStatus").ToString() == "Correct" ? "correct" : "wrong" %>'>
                                    <%# Eval("SelectedOption") %>
                                </span>
                                <br />
                                <strong>Correct Answer:</strong> 
                                <span class="correct"><%# Eval("correctans") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
             <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn-back" OnClick="Button1_Click"/>
        </div>
    </body>
</asp:Content>
