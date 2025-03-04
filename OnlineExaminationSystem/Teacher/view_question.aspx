<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teachermaster.Master" AutoEventWireup="true" CodeBehind="view_question.aspx.cs" Inherits="OnlineExaminationSystem.Teacher.view_question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .styled-grid {
            margin-top:30px;
            width: 100%;
            border-spacing: 10px; /* Adds space between columns */
        }

    .styled-grid th, .styled-grid td {
                padding: 15px; /* Adds padding inside cells */
                text-align: center;
                border: 1px solid #ddd;
            }
</style>

    <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="QuestionId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="QuestionId" HeaderText="QuestionId" ReadOnly="True" SortExpression="QuestionId" />
            <asp:BoundField DataField="subid" HeaderText="subid" SortExpression="subid" />
            <asp:BoundField DataField="questext" HeaderText="questext" SortExpression="questext" />
            <asp:BoundField DataField="op1" HeaderText="op1" SortExpression="op1" />
            <asp:BoundField DataField="op2" HeaderText="op2" SortExpression="op2" />
            <asp:BoundField DataField="op3" HeaderText="op3" SortExpression="op3" />
            <asp:BoundField DataField="op4" HeaderText="op4" SortExpression="op4" />
            <asp:BoundField DataField="correctans" HeaderText="correctans" SortExpression="correctans" />
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" BackColor="#0066FF" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="35px" Text="Update" Width="90px" CommandArgument='<%# Eval("QuestionId") %>' OnClick="btnUpdate_Click" CausesValidation="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" BackColor="Red" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="35px" Text="Delete" Width="90px" CommandArgument='<%# Eval("QuestionId") %>'  OnClick="btnDelete_Click" CausesValidation="false" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExaminationConnectionString1 %>" DeleteCommand="DELETE FROM [questions] WHERE [QuestionId] = @QuestionId" InsertCommand="INSERT INTO [questions] ([subid], [questext], [op1], [op2], [op3], [op4], [correctans]) VALUES (@subid, @questext, @op1, @op2, @op3, @op4, @correctans)" ProviderName="<%$ ConnectionStrings:OnlineExaminationConnectionString1.ProviderName %>" SelectCommand="SELECT [QuestionId], [subid], [questext], [op1], [op2], [op3], [op4], [correctans] FROM [questions]" UpdateCommand="UPDATE [questions] SET [subid] = @subid, [questext] = @questext, [op1] = @op1, [op2] = @op2, [op3] = @op3, [op4] = @op4, [correctans] = @correctans WHERE [QuestionId] = @QuestionId">
    </asp:SqlDataSource>
</asp:Content>
