package cn.store.servlet.client;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.store.domain.Product;
import cn.store.exception.FindProductByIdException;
import cn.store.service.ProductService;


public class AddCartServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.�õ���Ʒid
		String id = request.getParameter("id");
		// 2.����service�㷽��������id������Ʒ
		ProductService service = new ProductService();
		try {
			Product p = service.findProductById(id);
			//3.����Ʒ��ӵ����ﳵ
			//3.1���session����
			HttpSession session = request.getSession();
			//3.2��session�л�ȡ���ﳵ����
			Map<Product, Integer> cart = (Map<Product, Integer>)session.getAttribute("cart");
			//3.3������ﳵΪnull,˵��û����Ʒ�洢�ڹ��ﳵ�У����������ﳵ
			if (cart == null) {
				cart = new HashMap<Product, Integer>();
			}
			//3.4���ﳵ�������Ʒ
			Integer count = cart.put(p, 1);//(p,3��count=2
			//3.5�����Ʒ������Ϊ�գ�����Ʒ����+1����������µ���Ʒ��Ϣ
			if (count != null) {
				cart.put(p, count + 1);//(p,3)
			}			
			session.setAttribute("cart", cart);
			response.sendRedirect(request.getContextPath() + "/client/cart.jsp");
			return;
		} catch (FindProductByIdException e) {
			e.printStackTrace();
		}
	}
}

