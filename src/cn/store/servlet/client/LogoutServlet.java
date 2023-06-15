package cn.store.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ȡsession����.
				HttpSession session = request.getSession();
				// ����session
				session.invalidate();
				// flag��ʶ
				String flag = request.getParameter("flag");
				if (flag == null || flag.trim().isEmpty()) {
					// �ض�����ҳ
					response.sendRedirect(request.getContextPath() + "/index.jsp");
				}
	}

}
