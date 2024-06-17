<%@ Page Language="C#" MasterPageFile="~/Site2.Master"  AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebApplication2.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    .imgbtn {
        width:60px;
        height:60px;
    }

    .item {
        width:150px;
        height:210px;
        
        transition: all 0.3s ease-in-out;
        float:left;
        margin:30px 0 20px 28px;
        padding:5px;
    }

    .item:hover {
        border-radius: 10px;
        box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
        transform:translate(-10px,-10px);
        transition:all .5s;
    }
</style>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Book Management</title>
</head>
<body>

        <h1>图书管理</h1>
    <asp:Button ID="ButtonAddBook" runat="server" Text="添加图书" OnClick="ButtonAddBook_Click" />
<!-- Add a new row to the GridView for adding a book directly -->
<asp:Panel ID="PanelAddBook" runat="server" Visible="false">
    <table>
        <tr>
            <td><asp:TextBox ID="TextBoxImg" runat="server" Width="302px"></asp:TextBox></td>
            <td><asp:TextBox ID="TextBoxBookName" runat="server" Width="164px"></asp:TextBox></td>
            <td><asp:TextBox ID="TextBoxAuthor" runat="server" Width="148px"></asp:TextBox></td>
            <td><asp:TextBox ID="TextBoxPrice" runat="server" Width="35px"></asp:TextBox></td>
            <td><asp:Button ID="ButtonConfirmAdd" runat="server" Text="确定" OnClick="ButtonConfirmAdd_Click" />
                <asp:Button ID="ButtonCancelAdd" runat="server" Text="取消" OnClick="ButtonCancelAdd_Click" />
            </td>
            
        </tr>
    </table>
</asp:Panel>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            OnRowEditing="GridView1_RowEditing" 
            OnRowDeleting="GridView1_RowDeleting" 
            OnRowUpdating="GridView1_RowUpdating" 
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            DataKeyNames="bookname">
            <Columns>
                <asp:BoundField DataField="img" HeaderText="img" SortExpression="img" />
                <asp:BoundField DataField="bookname" HeaderText="bookname" SortExpression="bookname" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mybookshopConnectionString %>" 
    SelectCommand="SELECT * FROM  [bookinfo] UNION ALL SELECT * FROM [artbook] UNION ALL SELECT * FROM [childbook] 
    UNION ALL SELECT * FROM [docbook] UNION ALL SELECT * FROM [ecobook] UNION ALL SELECT * FROM [historybook] UNION ALL SELECT * FROM [novelbook] UNION ALL SELECT * FROM [psybook]"
    UpdateCommand="IF EXISTS (SELECT * FROM bookinfo WHERE bookname = @bookname)
                   BEGIN
                       UPDATE bookinfo SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                   END
                   ELSE IF EXISTS (SELECT * FROM artbook WHERE bookname = @bookname)
                   BEGIN
                       UPDATE artbook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                   END
                    ELSE IF EXISTS(SELECT * FROM childbook WHERE bookname = @bookname)
                    BEGIN
                        UPDATE childbook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                    END
                    ELSE IF EXISTS(SELECT * FROM docbook WHERE bookname = @bookname)
                    BEGIN
                        UPDATE docbook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                    END
                    ELSE IF EXISTS(SELECT * FROM ecobook WHERE bookname = @bookname)
                    BEGIN
                        UPDATE ecobook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                    END
                    ELSE IF EXISTS(SELECT * FROM historybook WHERE bookname = @bookname)
                    BEGIN
                        UPDATE historybook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                    END
                    ELSE IF EXISTS(SELECT * FROM novelbook WHERE bookname = @bookname)
                    BEGIN
                        UPDATE novelbook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                    END
                    ELSE IF EXISTS(SELECT * FROM psybook WHERE bookname = @bookname)
                    BEGIN
                        UPDATE psybook SET img = @img, bookname = @bookname, author = @author, price = @price WHERE bookname = @bookname
                    END"
       DeleteCommand="DELETE FROM bookinfo WHERE bookname = @bookname
                   DELETE FROM artbook WHERE bookname = @bookname
                   DELETE FROM childbook WHERE bookname = @bookname
                   DELETE FROM docbook WHERE bookname = @bookname
                   DELETE FROM ecobook WHERE bookname = @bookname
                   DELETE FROM historybook WHERE bookname = @bookname
                   DELETE FROM novelbook WHERE bookname = @bookname
                   DELETE FROM psybook WHERE bookname = @bookname" >
          <DeleteParameters>
        <asp:Parameter Name="bookname" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="img" Type="String" />
        <asp:Parameter Name="bookname" Type="String" />
        <asp:Parameter Name="author" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
         
    


</body>
</html>

</asp:Content>