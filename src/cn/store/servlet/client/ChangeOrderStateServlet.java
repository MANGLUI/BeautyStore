package cn.store.servlet.client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.service.OrderService;

public class ChangeOrderStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ö���������
		String orderid = request.getParameter("orderid");
		String paySuccess = "��ϲ��֧���ɹ���";
		if (null != orderid) {
				OrderService service = new OrderService();
				// ���ݶ������޸Ķ���״̬
				try {
					service.updateState(orderid);
					request.setAttribute("paySuccess", paySuccess);
					request.getRequestDispatcher("/FindOrderByUserServlet").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					response.getWriter().write("�޸Ķ���״̬ʧ��");
				}
			}
	}
}

