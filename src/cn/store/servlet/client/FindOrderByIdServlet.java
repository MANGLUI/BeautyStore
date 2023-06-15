package cn.store.servlet.client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.store.domain.Order;
import cn.store.service.OrderService;
/**
 * ͨ��id��ѯ����
 * @author admin
 *
 */
public class FindOrderByIdServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.��ȡ�û�����
		String type=request.getParameter("type");		
		//2.�õ�Ҫ��ѯ�Ķ�����id
		String id = request.getParameter("id");
		//3.����id���Ҷ���
		OrderService service = new OrderService();
		Order order = service.findOrderById(id);
        //4.����ѯ���Ķ�����Ϣ��ӵ�request��������
		request.setAttribute("order", order);
		//5.����û����Ͳ�Ϊnull��������ת����view.jspҳ�棬����ת����orderInfo.jspҳ��
		if(type!=null){
			request.getRequestDispatcher("/admin/orders/view.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/client/orderInfo.jsp").forward(request, response);
	}

}

