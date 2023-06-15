package cn.store.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.domain.PageBean;
import cn.store.service.ProductService;

public class MenuSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.���嵱ǰҳ�룬Ĭ��Ϊ1
				int currentPage = 1;
				String _currentPage = request.getParameter("currentPage");
				if (_currentPage != null) {
					currentPage = Integer.parseInt(_currentPage);
				}
				// 2.����ÿҳ��ʾ����,Ĭ��Ϊ4
				int currentCount = 4;	
				//��ȡǰ̨ҳ�������������ֵ
				String searchfield = request.getParameter("textfield");
				//�����������û������ֵ��������ݵ�ΪĬ��ֵ����ʱĬ�ϲ�ѯȫ����ƷĿ¼
				if("��������Ʒ��".equals(searchfield)){
					request.getRequestDispatcher("/showProductByPage").forward(request, response);
					return;
				}
				//����service��ķ�����ͨ������ģ����ѯ��������Ӧ��ͼ��
				ProductService service = new ProductService();
				PageBean bean = service.findBookByName(currentPage,currentCount,searchfield);
				// �����ݴ洢��request��Χ����ת��product_search_list.jspҳ��չʾ
				request.setAttribute("bean", bean);
				request.getRequestDispatcher("/client/product_search_list.jsp").forward(request, response);
	}

}
