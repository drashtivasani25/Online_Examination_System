<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminmaster.Master" AutoEventWireup="true" CodeBehind="addsubject.aspx.cs" Inherits="OnlineExaminationSystem.Admin.addsubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>Online Examination System</title>
        <style>
            /* Main content area */
            .main-content {
                margin-left: 250px;
                padding: 20px;
                transition: margin-left 0.3s ease-in-out;
            }

            /* General Body Styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f4f8;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            /* Container Styles */
            .container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
                transition: transform 0.3s ease;
            }

                .container:hover {
                    transform: translateY(-5px);
                }

            /* Heading Style */
            h2 {
                color: #333333;
                margin-bottom: 20px;
                font-size: 26px;
                letter-spacing: 1px;
            }

            /* Label for Messages */
            #lblMessage {
                font-weight: bold;
                margin-bottom: 10px;
                display: block;
            }

            /* Textbox Style */
            .input {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                outline: none;
                transition: border 0.3s ease, box-shadow 0.3s ease;
                font-size: 14px;
            }

            /* Button Style */
            .btn {
                background-color: #28a745;
                color: #ffffff;
                border: none;
                padding: 12px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease, transform 0.2s ease;
                display: inline-block;
                width: 50%;
                margin-top: 10px;
            }

                .btn:hover {
                    background-color: #218838;
                    transform: scale(1.03);
                }

            /* Error Message Style */
            .error {
                font-weight: bold;
                margin: 10px 0;
            }

            /* Gridview Style*/

            .styled-grid {
                width: 150%;
                border-spacing: 10px; /* Add space between columns */
            }

                .styled-grid th, .styled-grid td {
                    padding: 15px; /* Adds padding inside cells */
                    text-align: center;
                    border: 1px solid #ddd;
                }
        </style>
    </head>
    <body>
        <div class="main-content">
            <div class="container">
                <h2>Add New Subject</h2>
                <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtSubjectName" runat="server" Placeholder="Enter Subject Name" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter subject name" ForeColor="Red" ControlToValidate="txtSubjectName"></asp:RequiredFieldValidator><br />
                <asp:Button ID="btnAddSubject" runat="server" Text="Add Subject" CssClass="btn" OnClick="btnAddSubject_Click" />
            </div>
        </div>

        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="subid" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="subid" HeaderText="subid" ReadOnly="True" SortExpression="subid" />
                    <asp:BoundField DataField="subname" HeaderText="subname" SortExpression="subname" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BackColor="Red" CommandArgument='<%# Eval("subid") %>' ForeColor="White" Height="40px" OnClick="Button1_Click" Text="Delete" Width="92px" CausesValidation="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExaminationConnectionString1 %>" DeleteCommand="DELETE FROM [subject] WHERE [subid] = @subid" InsertCommand="INSERT INTO [subject] ([subname]) VALUES (@subname)" ProviderName="<%$ ConnectionStrings:OnlineExaminationConnectionString1.ProviderName %>" SelectCommand="SELECT [subid], [subname] FROM [subject]" UpdateCommand="UPDATE [subject] SET [subname] = @subname WHERE [subid] = @subid">
            </asp:SqlDataSource>
        </div>
    </body>
</asp:Content>
