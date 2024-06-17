using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Child : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                // 获取被点击的按钮所在的 RepeaterItem
                RepeaterItem item = (sender as ImageButton).NamingContainer as RepeaterItem;

                if (item == null)
                {
                    throw new NullReferenceException("RepeaterItem is null.");
                }

                // 获取需要传递到下一个页面的数据
                Label lblBookName = item.FindControl("LabelBookName") as Label;
                Label lblAuthor = item.FindControl("LabelAuthor") as Label;
                Label lblPrice = item.FindControl("LabelPrice") as Label;
                Image img = item.FindControl("ImageButton1") as Image;

                if (lblBookName == null || lblAuthor == null || lblPrice == null || img == null)
                {
                    throw new NullReferenceException("One or more controls are null.");
                }

                string bookname = lblBookName.Text;
                string author = lblAuthor.Text;
                string imageUrl = img.ImageUrl;

                int price;
                if (!int.TryParse(lblPrice.Text, out price))
                {
                    throw new FormatException("Price is not in a valid format.");
                }

                // 将数据存储到 Session 或其他状态管理机制中
                Session["bookname"] = bookname;
                Session["author"] = author;
                Session["price"] = price;
                Session["imageUrl"] = imageUrl;

                // 重定向到下一个页面
                Response.Redirect("moreinfo.aspx");
            }
            catch (Exception ex)
            {
                // 处理异常，可以记录日志或者显示错误信息给用户
                // 这里只是简单地将异常信息输出到控制台
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }
    }
}