<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminmaster.Master" AutoEventWireup="true" CodeBehind="manage_users.aspx.cs" Inherits="OnlineExaminationSystem.Admin.manage_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Online Examination System</title>
    <style>
        /* Main content area */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }

        .styled-grid {
            width: 100%;
            border-spacing: 10px; /* Adds space between columns */
        }

            .styled-grid th, .styled-grid td {
                padding: 15px; /* Adds padding inside cells */
                text-align: center;
                border: 1px solid #ddd;
            }

    </style>

        <div class="main-content">
            <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="UserId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="cpassword" HeaderText="cpassword" SortExpression="cpassword" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BackColor="Red" CommandArgument='<%# Eval("UserId") %>' Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" Text="Delete" Width="92px" OnClick="Button1_Click" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExaminationConnectionString1 %>" DeleteCommand="DELETE FROM [registration] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [registration] ([fname], [lname], [email], [gender], [password], [cpassword]) VALUES (@fname, @lname, @email, @gender, @password, @cpassword)" ProviderName="<%$ ConnectionStrings:OnlineExaminationConnectionString1.ProviderName %>" SelectCommand="SELECT [UserId], [fname], [lname], [email], [gender], [password], [cpassword] FROM [registration]" UpdateCommand="UPDATE [registration] SET [fname] = @fname, [lname] = @lname, [email] = @email, [gender] = @gender, [password] = @password, [cpassword] = @cpassword WHERE [UserId] = @UserId">
            </asp:SqlDataSource>
        </div>
</asp:Content>
