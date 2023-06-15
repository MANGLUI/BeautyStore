package cn.store.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.domain.Product;
import cn.store.exception.ListProductException;
import cn.store.service.ProductService;


public class ListProductServlet extends HttpServlet {

	/**
	 * 后台系统
	 * 查询所有商品信息的servlet
	 */
	public ListProductServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.创建service层的对象
				ProductService service = new ProductService();
				try {
					// 2.调用service层用于查询所有商品的方法
					List<Product> ps = service.listAll();
					// 3.将查询出的所有商品放进request域中
					request.setAttribute("ps", ps);
					// 4.重定向到list.jsp页面
					request.getRequestDispatcher("/admin/products/storelist.jsp").forward(
							request, response);
					return;
				} catch (ListProductException e) {
					e.printStackTrace();
					response.getWriter().write(e.getMessage());
					return;
				}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

