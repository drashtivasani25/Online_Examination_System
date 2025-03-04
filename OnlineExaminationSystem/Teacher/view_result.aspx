<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/teachermaster.Master" AutoEventWireup="true" CodeBehind="view_result.aspx.cs" Inherits="OnlineExaminationSystem.Teacher.view_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<title>Online Examination System</title>
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
    <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ResultId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="ResultId" HeaderText="ResultId" ReadOnly="True" SortExpression="ResultId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="subid" HeaderText="subid" SortExpression="subid" />
            <asp:BoundField DataField="totalque" HeaderText="totalque" SortExpression="totalque" />
            <asp:BoundField DataField="score" HeaderText="score" SortExpression="score" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExaminationConnectionString1 %>" DeleteCommand="DELETE FROM [result] WHERE [ResultId] = @ResultId" InsertCommand="INSERT INTO [result] ([UserId], [subid], [totalque], [score]) VALUES (@UserId, @subid, @totalque, @score)" ProviderName="<%$ ConnectionStrings:OnlineExaminationConnectionString1.ProviderName %>" SelectCommand="SELECT [ResultId], [UserId], [subid], [totalque], [score] FROM [result]" UpdateCommand="UPDATE [result] SET [UserId] = @UserId, [subid] = @subid, [totalque] = @totalque, [score] = @score WHERE [ResultId] = @ResultId">
    </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
