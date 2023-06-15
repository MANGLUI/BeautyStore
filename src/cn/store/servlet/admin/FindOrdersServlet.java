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
	 * 查找所有订单
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
		// 创建Service层对象
		OrderService service = new OrderService();
		// 调用Service层对象的findAllOrder()方法查询订单列表
		List<Order> orders = service.findAllOrder();
		//将查询到的订单信息添加到request作用域
		request.setAttribute("orders", orders);
		// 将请求转发到list.jsp页面
		request.getRequestDispatcher("/admin/orders/orderlist.jsp").forward(request,response);

	}

}
