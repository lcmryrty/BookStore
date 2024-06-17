<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="moreinfo.aspx.cs" Inherits="WebApplication2.moreinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .pic {
            margin:20px 0 0 -180px;
            width:1190px;

            border-radius: 10px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
            overflow:hidden;
        }

        .info {
            margin:60px 0 50px 0;

            border-radius: 10px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
            overflow:hidden;
        }

        .info p {
            background-color:orange;
            padding:10px 0 10px 0;
            margin:0;
        }

        .info p span {
            font-weight:bolder;
            color:white;
            margin:0 0 0 15px;
        }
    </style>

<div class="pic" style="position: relative;">
 

  
</div>

    <div class="info">
          
        <p><span>商品详情</span></p>
        <asp:Image ID="Image1" runat="server" Width="50%" Height="50%"/>
         <asp:Button ID="Button1" runat="server" Text="加入购物车" style="color:orange;top: 80%;right:30%; width: 100px; height: 50px;" OnClick="Button1_Click" />
          
        <asp:Button ID="Button2" runat="server" Text="立即购买" style="color:orange;top: 80%;right:30%; width: 100px; height: 50px;" OnClick="Button2_Click" />
<p><span>书本名称</span></p>
<asp:Label ID="LabelBookName" runat="server" Text="Label"></asp:Label>

<p><span>作者</span></p>
<asp:Label ID="LabelAuthor" runat="server" Text="Label"></asp:Label>

<p><span>价格</span></p>
<asp:Label ID="LabelPrice" runat="server" Text="Label"></asp:Label>
    </div>

</asp:Content>
