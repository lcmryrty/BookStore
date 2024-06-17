<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplication2.Cart" %>
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
    <h1>我的购物车</h1>
    <h2> <asp:Label ID="lblTotalPrice" runat="server" CssClass="total-price"/></h2>
    <h3><asp:Button ID="ClearCart" runat="server"  OnClick="ClearCart_Click" Height="36px" Text="ClearCart" Width="237px"/> </h3>
    <h3><asp:Button ID="BuyForCart" runat="server"  OnClick="BuyForCart_Click" Height="36px" Text="BuyForCart" Width="237px"/> </h3>
    <div>

<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
      <div class="item">
    <p><asp:Label ID="LabelBookName" runat="server" Text='<%# Eval("bookname") %>'></asp:Label></p>
    <p><asp:Label ID="LabelAuthor" runat="server" Text='<%# Eval("author") %>'></asp:Label></p>
    <p><asp:Label ID="LabelPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label></p>
</div>
       

    </ItemTemplate>
</asp:Repeater>

        
    </div>
</asp:Content>