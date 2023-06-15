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
	 * ��̨ϵͳ
	 * ��ѯ������Ʒ��Ϣ��servlet
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
		// 1.����service��Ķ���
				ProductService service = new ProductService();
				try {
					// 2.����service�����ڲ�ѯ������Ʒ�ķ���
					List<Product> ps = service.listAll();
					// 3.����ѯ����������Ʒ�Ž�request����
					request.setAttribute("ps", ps);
					// 4.�ض���list.jspҳ��
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

