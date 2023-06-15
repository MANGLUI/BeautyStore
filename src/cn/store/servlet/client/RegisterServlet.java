package cn.store.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.store.domain.User;
import cn.store.exception.RegisterException;
import cn.store.service.UserService;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// �����ύ�����ݷ�װ��javaBean
				User user = new User();
				try {
					BeanUtils.populate(user, request.getParameterMap());
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				// ����service���ע�������
				UserService service = new UserService();
				try {
					service.register(user);
				} catch (RegisterException e) {
					e.printStackTrace();
					response.getWriter().write(e.getMessage());
					return;
				}
				// ע��ɹ�����ת��registersuccess.jsp
				response.sendRedirect(request.getContextPath() + "/client/login.jsp");
				return;
	}

}
