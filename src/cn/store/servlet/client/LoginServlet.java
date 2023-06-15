package cn.store.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;


import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.store.domain.User;
import cn.store.service.UserService;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.��ȡ��¼ҳ��������û���������
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				// 2.����service��ɵ�¼������
				UserService service = new UserService();
				try {
					User user = service.login(username, password);
					
					// 3.��¼�ɹ������û��洢��session��.
					request.getSession().setAttribute("user", user);
					// ��ȡ�û��Ľ�ɫ�������û��Ľ�ɫ����ͨ�û��ͳ����û�����
					String role = user.getRole();
					// ����ǳ����û����ͽ��뵽������ǵĺ�̨����ϵͳ����������ҵ��˻�ҳ��
					if ("�����û�".equals(role)) {
						response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp");
						return;
					} else {
						response.sendRedirect(request.getContextPath() + "/client/my.jsp");
						return;
					}
				} catch (LoginException e) {
					// ����������⣬��������Ϣ�洢��request��Χ������ת�ص�¼ҳ����ʾ������Ϣ
					e.printStackTrace();
					request.setAttribute("register_message", e.getMessage());
					request.getRequestDispatcher("/client/login.jsp").forward(request, response);
					return;
				}
	}

}
