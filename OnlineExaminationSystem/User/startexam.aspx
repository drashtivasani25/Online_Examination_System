<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.Master" AutoEventWireup="true" CodeBehind="startexam.aspx.cs" Inherits="OnlineExaminationSystem.User.startexam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .question-box {
            margin-top: 20px;
            border: 2px solid #4CAF50;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

            .question-box h4 {
                color: #333;
                font-weight: bold;
            }

        .rbl-options {
            margin: 10px;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

            .btn-submit:hover {
                background-color: #218838;
            }

        .timer-container {
            font-size: 18px;
            font-weight: bold;
            color: red;
            margin-bottom: 15px;
        }
    </style>

    <script type="text/javascript">
        var totalTime = 300; // 5 minutes (300 seconds)

        function startTimer() {
            var timerInterval = setInterval(function () {
                var minutes = Math.floor(totalTime / 60);
                var seconds = totalTime % 60;
                document.getElementById("timer").innerHTML = minutes + "m " + seconds + "s ";

                if (totalTime <= 0) {
                    clearInterval(timerInterval);
                    alert("Time's up! Your answers are being submitted.");
                    document.getElementById('<%= btnSubmit.ClientID %>').click(); // Auto-submit exam
                }
                totalTime--;
            }, 1000);
        }

        window.onload = function () {
            startTimer();
        };
    </script>

    <body>
        <div class="timer-container">
            Time Remaining: <span id="timer">5m 0s</span>
        </div>
        <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
            <ItemTemplate>
                <div class="question-box">
                    <h4>Q:<%# Container.ItemIndex+1 %>) <%# Eval("questext") %></h4>

                    <asp:HiddenField ID="hdnQid" runat="server" Value='<%# Eval("QuestionId") %>' />
                    <asp:RadioButtonList ID="rblOptions" runat="server" CssClass="rbl-options"></asp:RadioButtonList>

                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn-submit" Text="Submit Answers" OnClick="btnSubmit_Click" />
    </body>
</asp:Content>
