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

public class FindOrderByManyConditionServlet extends HttpServlet {

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
		//获取订单编号和收件人名称
				String id = request.getParameter("id");
				String receiverName = request.getParameter("receiverName");
				//创建Service层对象
			    OrderService service = new OrderService();
				//调用Service层OrderService类的findOrderByManyCondition()方法查询数据
				List<Order> orders = service.findOrderByManyCondition(id, receiverName);
				//将查询结果添加到request作用域中
				request.setAttribute("orders", orders);
				//请求转发到list.jsp页面，并将request请求和response响应也转发到该页面中
				request.getRequestDispatcher("/admin/orders/orderlist.jsp").forward(request,response);

	}

}
