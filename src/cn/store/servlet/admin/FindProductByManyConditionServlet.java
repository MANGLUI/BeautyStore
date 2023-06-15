package cn.store.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.domain.Product;
import cn.store.service.ProductService;


public class FindProductByManyConditionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.��ȡ������
				String id = request.getParameter("id"); // ��Ʒid
				String name = request.getParameter("name"); // ��Ʒ����
				String category = request.getParameter("category"); // ��Ʒ���
				String minprice = request.getParameter("minprice"); // ��С�۸�
				String maxprice = request.getParameter("maxprice"); // ���۸�
				// 2.����ProductService����
				ProductService service = new ProductService();
				// 3.����service������������ѯ�ķ���
				List<Product> ps = service.findProductByManyCondition(id, name,
						category, minprice, maxprice);
				// 4.��������ѯ�Ľ���Ž�request����
				request.setAttribute("ps", ps);
				// 5.�����ض�����Ʒ������ҳlist.jspҳ��
				request.getRequestDispatcher("/admin/products/storelist.jsp").forward(
						request, response);
	}

}
