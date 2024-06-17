using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Implement your logic here
            GridView1.EditIndex = e.NewEditIndex;
            // Rebind your GridView here if necessary
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // 检查索引是否有效
                if (e.RowIndex >= 0 && e.RowIndex < GridView1.DataKeys.Count)
                {
                    string bookname = GridView1.DataKeys[e.RowIndex].Value.ToString();

                    // 确保 SqlDataSource1 的 DeleteParameters 包含 "bookname"
                    SqlDataSource1.DeleteParameters["bookname"].DefaultValue = bookname;
                }
                else
                {
                    // 索引无效时的处理
                    throw new ArgumentOutOfRangeException("e.RowIndex", "索引超出范围。必须为非负值并小于集合大小。");
                }
            }
            catch (Exception ex)
            {
                // 处理异常，例如记录日志或显示错误信息
                Response.Write("Error: " + ex.Message);
            }

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Implement your logic here
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            // Rebind your GridView here if necessary
        }
        protected void ButtonAddBook_Click( object sender, EventArgs e)
        {
            // Implement your logic here
            //弹出一行输入信息
            PanelAddBook.Visible = true;



            
        }
      
            protected void ButtonCancelAdd_Click(object sender, EventArgs e)
        {
            // Implement your logic here
            //弹出一行输入信息
            PanelAddBook.Visible = false;
        }
        protected void ButtonConfirmAdd_Click(object sender, EventArgs e)
        {
            // 将TextBox中的数据添加到数据库中
            // Implement your logic here
            // 从 TextBox 控件中读取用户输入的数据
            string bookname = TextBoxBookName.Text;
            string author = TextBoxAuthor.Text;
            int price = Convert.ToInt32(TextBoxPrice.Text);
            string img =TextBoxImg.Text;
        

            // 创建一个新的商品对象
            dynamic item = new
            {
                BookName = bookname,
                Author = author,
                Price = price,
                Img = img
            };

            // 将图书数据添加到数据库中
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["mybookshopConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sql = "INSERT INTO bookinfo (bookname, author, price, img) VALUES (@BookName, @Author, @Price, @Img)";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@BookName", item.BookName);
                    command.Parameters.AddWithValue("@Author", item.Author);
                    command.Parameters.AddWithValue("@Price", item.Price);
                    command.Parameters.AddWithValue("@Img", item.Img);
                    command.ExecuteNonQuery();
                }


           
            }   











            // 隐藏 Panel 控件
            PanelAddBook.Visible = false;
            // 重新加载当前页面以刷新页面内容
            Response.Redirect(Request.RawUrl);
        }

    }
}