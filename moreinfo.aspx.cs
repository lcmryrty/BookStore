using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class moreinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 从 Session 中读取数据
                string bookname = Session["bookname"] as string;
                string imageUrl = Session["imageUrl"] as string;
                Image1.ImageUrl = imageUrl;
                string author = Session["author"] as string;
                int? price = Session["price"] as int?;
          

                // 检查数据是否存在
                if (!string.IsNullOrEmpty(bookname) && !string.IsNullOrEmpty(author) && price.HasValue)
                {
                    // 将数据显示在 Label 控件中
                    LabelBookName.Text = "Book Name: " + bookname;
                    LabelAuthor.Text = "Author: " + author;
                    LabelPrice.Text = "Price: $" + price.Value.ToString("F2");
                }
                else
                {
                    // 如果没有数据，显示错误信息或默认信息
                    LabelBookName.Text = "Book Name: N/A";
                    LabelAuthor.Text = "Author: N/A";
                    LabelPrice.Text = "Price: N/A";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //添加到购物车

            // 从 Session 中读取购物车数据
            List<dynamic> cart = Session["Cart"] as List<dynamic>;

            // 如果购物车为空，创建一个新的购物车

            if (cart == null)
            {
                cart = new List<dynamic>();
            }

            // 创建一个新的商品对象
            dynamic item = new
            {
                BookName = Session["bookname"] as string,
                Author = Session["author"] as string,
                Price = Session["price"] as int?
            };
            cart.Add(item);

            // 将购物车数据存储到 Session 中
            Session["Cart"] = cart;

            // 重定向到购物车页面

            Response.Redirect("Cart.aspx");
          
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //弹出提示框,提示当前书本购买成功
            string bookname = Session["bookname"] as string;

            int? price = Session["price"] as int?;
            string message = "你成功购买了 " + bookname + " for $" + price + ".";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);

            

          
        }
    }
}