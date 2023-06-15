package cn.store.service;
import java.sql.SQLException;
import java.util.List;

import cn.store.dao.ProductDao;
import cn.store.domain.PageBean;
import cn.store.domain.Product;
import cn.store.exception.AddProductException;
import cn.store.exception.FindProductByIdException;
import cn.store.exception.ListProductException;

public class ProductService {
	private ProductDao dao = new ProductDao();
	 //�����Ʒ
	public void addProduct(Product p) throws AddProductException {
		try {
			dao.addProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AddProductException("�����Ʒʧ��");
		}
	}
	// ����������Ʒ��Ϣ
	public List<Product> listAll() throws ListProductException {
		try {
			return dao.listAll();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ListProductException("��ѯ��Ʒʧ��");
		}
	}
	// ��ҳ����
	public PageBean findProductByPage(int currentPage, int currentCount,
			String category) {
		PageBean bean = new PageBean();
		// ��װÿҳ��ʾ��������
		bean.setCurrentCount(currentCount);
		// ��װ��ǰҳ��
		bean.setCurrentPage(currentPage);
		// ��װ��ǰ�������
		bean.setCategory(category);
		try {
			// ��ȡ������
			int totalCount = dao.findAllCount(category);
			bean.setTotalCount(totalCount);
			// ��ȡ��ҳ��
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			// ��ȡ��ǰҳ����
			List<Product> ps = dao.findByPage(currentPage, currentCount,
					category);
			bean.setPs(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	// ����id������Ʒ
	public Product findProductById(String id) throws FindProductByIdException {
		try {
			return dao.findProductById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FindProductByIdException("����ID������Ʒʧ��");
		}
	}
	// ��������ѯ
	public List<Product> findProductByManyCondition(String id, String name,
			String category, String minprice, String maxprice) {
		List<Product> ps = null;
		try {
			ps = dao.findProductByManyCondition(id, name, category, minprice,
					maxprice);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}
	// �޸���Ʒ��Ϣ
	public void editProduct(Product p) {
		try {
			dao.editProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//ǰ̨���������������������ģ����ѯ��Ӧ��ͼ��
	public PageBean findBookByName(int currentPage, int currentCount,
			String searchfield) {
		PageBean bean = new PageBean();
		// ��װÿҳ��ʾ��������
		bean.setCurrentCount(currentCount);
		// ��װ��ǰҳ��
		bean.setCurrentPage(currentPage);
		// ��װģ����ѯ��ͼ����
		bean.setSearchfield(searchfield);
		try {
			// ��ȡ������
			int totalCount = dao.findBookByNameAllCount(searchfield);
			bean.setTotalCount(totalCount);

			// ��ȡ��ҳ��
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);

			//����������ͼ��
			List<Product> ps = dao.findBookByName(currentPage,currentCount,searchfield);
			bean.setPs(ps);
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("ǰ̨���������������ѯͼ��ʧ�ܣ�");
		}
	}
	//��̨ϵͳ������idɾ����Ʒ��Ϣ
	public void deleteProduct(String id) {
		try {
			dao.deleteProduct(id);
		} catch (SQLException e) {
			throw new RuntimeException("��̨ϵͳ����idɾ����Ʒ��Ϣʧ�ܣ�");
		}
	}
}


