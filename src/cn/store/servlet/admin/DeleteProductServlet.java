package cn.store.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.service.ProductService;

public class DeleteProductServlet extends HttpServlet {
	/**
	 * 后台系统
	 * 删除商品信息的servlet
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
		// 获取请求参数，产品id
		String id = request.getParameter("id");
		ProductService service = new ProductService();
		// 调用service完成添加商品操作
		service.deleteProduct(id);
		response.sendRedirect(request.getContextPath() + "/ListProductServlet");
		return;
	}

}
