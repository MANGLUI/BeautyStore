package cn.store.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.domain.Order;
import cn.store.service.OrderService;

public class FindOrdersServlet extends HttpServlet {
	/**
	 * �������ж���
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
		// ����Service�����
		OrderService service = new OrderService();
		// ����Service������findAllOrder()������ѯ�����б�
		List<Order> orders = service.findAllOrder();
		//����ѯ���Ķ�����Ϣ��ӵ�request������
		request.setAttribute("orders", orders);
		// ������ת����list.jspҳ��
		request.getRequestDispatcher("/admin/orders/orderlist.jsp").forward(request,response);

	}

}
