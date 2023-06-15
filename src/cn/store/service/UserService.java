package cn.store.service;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import cn.store.dao.UserDao;
import cn.store.domain.User;
import cn.store.exception.RegisterException;

public class UserService {
	private UserDao dao = new UserDao();
	// ע�����
	public void register(User user) throws RegisterException {
		// ����dao���ע�����
		try {
			dao.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RegisterException("ע��ʧ��");
		}
	}

	// ��¼����
	public User login(String username, String password) throws LoginException {
		try {
			//���ݵ�¼ʱ��������û��������룬�����û�
			User user = dao.findUserByUsernameAndPassword(username, password);
			//����ҵ�������Ҫȷ���û��Ƿ�Ϊ�����û�
			if (user != null) {
				return user;
			}
			throw new LoginException("�û������������");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("��¼ʧ��");
		}
	}
}

