package cn.store.servlet.client;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.store.domain.Order;
import cn.store.domain.User;
import cn.store.service.OrderService;
public class FindOrderByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ȡ��Ϊ��user����session
		User user = (User) request.getSession().getAttribute("user");
		// ����service�еķ���,�����û���Ϣ���Ҷ���
		OrderService service = new OrderService();
		List<Order> orders = service.findOrderByUser(user);
		System.out.println(orders.size());
		request.setAttribute("orders", orders);
		System.out.println(orders);
		request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
	}
}

