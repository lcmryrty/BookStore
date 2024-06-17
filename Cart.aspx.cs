using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cart"] != null)
                {
                    List<dynamic> cart = (List<dynamic>)Session["Cart"];
                    Repeater1.DataSource = cart;
                    Repeater1.DataBind();

                    // Calculate the total price
                    int total = 0;
                    foreach (var item in cart)
                    {
                        total += item.Price;
                    }
                    lblTotalPrice.Text = "合计为: $" + total.ToString("F2");

               

                   

                }
                else
                {
                    lblTotalPrice.Text = "合计为: $0.00";
                }
            }
        }

        protected void ClearCart_Click(object sender, EventArgs e)
        {
            // Clear the cart
            Session["Cart"] = null;
            Response.Redirect("Cart.aspx");


        }
        protected void BuyForCart_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                List<dynamic> cart = (List<dynamic>)Session["Cart"];
                string message = "购买成功！\n\n";
                foreach (var item in cart)
                {
                    message += string.Format("书名: {0}, 作者: {1}, 价格: ${2:F2}\n", item.BookName, item.Author, item.Price);
                }
                message += "\n合计: $" + cart.Sum(x => x.Price).ToString("F2");
                Session["Cart"] = null;
                //Response.Write(message);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);

                // Refresh the page to update the data
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                //如果购物车为空，提示用户购物车为空
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('购物车为空！');", true);
            }
        }
       
    }
}