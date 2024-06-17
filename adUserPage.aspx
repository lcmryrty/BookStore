﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="adUserPage.aspx.cs" Inherits="WebApplication2.adUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<style>
    .us {
        margin:20px 0;
        text-align:center;
    }

    .gv {
        margin:auto;
        box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
    }

    .it {
        padding:10px 18px;
    }
</style>

    <div class="us">

        <asp:GridView ID="GridView1" runat="server" CssClass="gv" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ItemStyle-CssClass="it" InsertVisible="False" ReadOnly="True" SortExpression="id" >
<ItemStyle CssClass="it"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="用户名" ItemStyle-CssClass="it" SortExpression="username" >
<ItemStyle CssClass="it"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="password" HeaderText="密码" ItemStyle-CssClass="it" SortExpression="password" >
<ItemStyle CssClass="it"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="authority" HeaderText="权限" ItemStyle-CssClass="it" SortExpression="authority" >
<ItemStyle CssClass="it"></ItemStyle>
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
            <ItemStyle CssClass="it" />
            </asp:CommandField>
        </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mybookshopConnectionString %>" SelectCommand="SELECT [id], [username], [password], [authority] FROM [userinfo]" DeleteCommand="DELETE FROM userinfo where id=@id" UpdateCommand="UPDATE  userinfo SET username =@username, password =@password, authority =@authority where id = @id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" Name="username" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="password" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="authority" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
        </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    
</asp:Content>
