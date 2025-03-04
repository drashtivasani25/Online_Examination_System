<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="OnlineExaminationSystem.User.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>
        <title>Online Examination System</title>
        <style>
            .feedback-container {
                display: flex;
                justify-content: center;
                padding: 40px;
                background-color: #f4f4f4;
                text-align: center;
                margin-top: 20px;
            }
             .feedback-form {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 50%;
                max-width: 700px;
                display: grid;
                flex-direction: column;
                border: 1px solid #e0e0e0;
            }
             .feedback-heading {
                font-size: 32px;
                text-align: center;
                margin-bottom: 20px;
                color: #17a589;
            }
             .feedback-input {
                padding: 10px;
                margin-bottom: 15px;
                font-family: 'Constantia', sans-serif; 
                border: 1px solid #ddd; 
                border-radius: 5px;
                font-size: 16px;
                background-color: #fafafa;
            }
              .feedback-textarea {
                height: 150px;
                padding: 10px;
                border: 1px solid #ddd; 
                font-family: 'Constantia', sans-serif; 
                border-radius: 5px;
                background-color: #fafafa; 
                resize: none;
                font-size: 16px;
                margin-bottom: 20px;
            }
               .feedback-submit-btn {
                background-color: #17a589;
                color: white;
                padding: 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
            }
               .feedback-rating-label {
                font-size: 15px;
                color: #333;
                margin-bottom: 10px;
                text-align: left;
                 font-family: 'Constantia', sans-serif;
                transition: color 0.3s ease;
            }
               .nm{
                font-size: 15px;
                color: #333;
                margin-bottom: 10px;
                text-align: left;
                 font-family: 'Constantia', sans-serif;
                transition: color 0.3s ease;
               }
               .ml{
                font-size: 15px;
                color: #333;
                margin-bottom: 10px;
                text-align: left;
                 font-family: 'Constantia', sans-serif;
                transition: color 0.3s ease;
               }
               .fd{
                font-size: 15px;
                color: #333;
                margin-bottom: 10px;
                text-align: left;
                 font-family: 'Constantia', sans-serif;
                transition: color 0.3s ease;
               }
               .feedback-rating-label:hover {
                color: #17a589; 
            }
               .feedback-rating-dropdown {
                padding: 10px;
                margin-bottom: 15px;
                border-radius: 5px;
                 font-family: 'Constantia', sans-serif; 
                border: 1px solid #ddd;
                font-size: 16px;
                background-color: #fafafa;
            }
            .feedback-submit-btn:hover {
                background-color: #1abc9c;
            }

             /* Responsive Design */
            @media (max-width: 768px) {
                .feedback-container {
                    padding: 20px;
                }

                .feedback-form {
                    width: 100%;
                    padding: 15px;
                }

                .feedback-heading {
                    font-size: 28px;
                }

                .feedback-input,
                .feedback-textarea,
                .feedback-rating-dropdown {
                    font-size: 14px;
                    padding: 8px;
                }

                .feedback-submit-btn {
                    font-size: 16px;
                    padding: 12px;
                }
            }

            @media (max-width: 480px) {
                .feedback-heading {
                    font-size: 24px;
                }

                .feedback-input,
                .feedback-textarea,
                .feedback-rating-dropdown {
                    font-size: 14px;
                    padding: 8px;
                }

                .feedback-submit-btn {
                    font-size: 14px;
                    padding: 10px;
                }
            }
         </style>
    </head>
    <body>
         <form>
            <div class="feedback-container">
               <div class="feedback-form">
                <h1 class="feedback-heading">Feedback!</h1>
                 <label class="nm">Name:</label>
                <asp:TextBox ID="txtName" CssClass="feedback-input" runat="server" Placeholder="Enter Your Name"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter name" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator> <br />
                   <label class="ml">Email:</label>
                <asp:TextBox ID="txtEmail" CssClass="feedback-input" runat="server" TextMode="Email" Placeholder="Enter Your Email"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Email" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator> <br />
                   <label class="fd">Feedback:</label>
                <asp:TextBox ID="txtFeedback" CssClass="feedback-textarea" runat="server" TextMode="MultiLine" Placeholder="Please Share Your Feedback..." MaxLength="500"></asp:TextBox>
                <label class="feedback-rating-label" for="ddlRating">Rating:</label>
                <asp:DropDownList ID="ddlRating" CssClass="feedback-rating-dropdown" runat="server">
                    <asp:ListItem Value="" Selected="True">-- Select Rating --</asp:ListItem>
                    <asp:ListItem Value="1">1 - Poor</asp:ListItem>
                    <asp:ListItem Value="2">2 - Fair</asp:ListItem>
                    <asp:ListItem Value="3">3 - Good</asp:ListItem>
                    <asp:ListItem Value="4">4 - Very Good</asp:ListItem>
                    <asp:ListItem Value="5">5 - Excellent</asp:ListItem>
                </asp:DropDownList>  
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select rating" ForeColor="Red" ControlToValidate="ddlRating"></asp:RequiredFieldValidator> <br />
                <asp:Button ID="btnSubmit" CssClass="feedback-submit-btn" runat="server" Text="Submit Feedback" OnClick="btnSubmit_Click"/>
           </div>
            </div>
        </form>
    </body>
</asp:Content>
