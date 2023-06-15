package cn.store.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.store.domain.Order;
import cn.store.domain.OrderItem;
import cn.store.domain.Product;
import cn.store.utils.DataSourceUtils;


public class ProductDao {
	// �����Ʒ
	public void addProduct(Product p) throws SQLException {

		String sql = "insert into products values(?,?,?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, p.getId(), p.getName(), p.getPrice(),
				p.getCategory(), p.getPnum(), p.getImgurl(), p.getDescription());
	}
	// ����������Ʒ
	public List<Product> listAll() throws SQLException {
		String sql = "select * from products";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Product>(Product.class));
	}
	// ��ȡ����������
	public int findAllCount(String category) throws SQLException {
		String sql = "select count(*) from products";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		if (!"ȫ����Ʒ".equals(category)) {
			sql += " where category=?";

			Long count = (Long) runner
					.query(sql, new ScalarHandler(), category);
			return count.intValue();
		} else {
			Long count = (Long) runner.query(sql, new ScalarHandler());

			return count.intValue();
		}
	}
	// ��ȡ��ǰҳ����
	public List<Product> findByPage(int currentPage, int currentCount,
			String category) throws SQLException {
		// Ҫִ�е�sql���
		String sql = null;
		// ����
		Object[] obj = null;
		// ���category��Ϊnull,�����ǰ��������
		if (!"ȫ����Ʒ".equals(category)) {
			sql = "select * from products  where category=? limit ?,?";
			obj = new Object[] { category, (currentPage - 1) * currentCount,
					currentCount, };
		} else {
			sql = "select * from products  limit ?,?";
			obj = new Object[] { (currentPage - 1) * currentCount,
					currentCount, };
		}
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Product>(Product.class),
				obj);
	}

	// ����id������Ʒ
	public Product findProductById(String id) throws SQLException {
		String sql = "select * from products where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<Product>(Product.class), id);
	}

	// ���ɶ���ʱ������Ʒ��������
	public void changeProductNum(Order order) throws SQLException {
		String sql = "update products set pnum=pnum-? where id=?";
		QueryRunner runner = new QueryRunner();
		List<OrderItem> items = order.getOrderItems();
		Object[][] params = new Object[items.size()][2];

		for (int i = 0; i < params.length; i++) {
			params[i][0] = items.get(i).getBuynum();
			params[i][1] = items.get(i).getP().getId();
		}

		runner.batch(DataSourceUtils.getConnection(), sql, params);
	}
	// ��������ѯ
	public List<Product> findProductByManyCondition(String id, String name,
			String category, String minprice, String maxprice)
			throws SQLException {
		List<Object> list = new ArrayList<Object>();
		String sql = "select * from products where 1=1 ";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		if (id != null && id.trim().length() > 0) {
			sql += " and id=?";
			list.add(id);
		}

		if (name != null && name.trim().length() > 0) {
			sql += " and name=?";
			list.add(name);
		}
		if (category != null && category.trim().length() > 0) {
			sql += " and category=?";
			list.add(category);
		}
		if (minprice != null && maxprice != null
				&& minprice.trim().length() > 0 && maxprice.trim().length() > 0) {
			sql += " and price between ? and ?";
			list.add(minprice);
			list.add(maxprice);
		}

		Object[] params = list.toArray();

		return runner.query(sql, new BeanListHandler<Product>(Product.class),
				params);
	}
	// �޸���Ʒ��Ϣ
	public void editProduct(Product p) throws SQLException {
		//1.�������ϲ�����Ʒ��Ϣ��ӵ�������
		List<Object> obj = new ArrayList<Object>();
		obj.add(p.getName());
		obj.add(p.getPrice());
		obj.add(p.getCategory());
		obj.add(p.getPnum());
		obj.add(p.getDescription());
		//2.����sql��䣬��ƴ��sql
		String sql  = "update products " +
				      "set  name=?,price=?,category=?,pnum=?,description=? ";
		//�ж��Ƿ���ͼƬ
		if (p.getImgurl() != null && p.getImgurl().trim().length() > 0) {
			sql += " ,imgurl=?";
			obj.add(p.getImgurl());
		}
		sql += " where id=?";
		obj.add(p.getId());		
		System.out.println(sql);		
		System.out.println(obj);
		//3.����QueryRunner����
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//4.ʹ��QueryRunner�����update()������������
		runner.update(sql, obj.toArray());
	}
	//ɾ������ʱ���޸���Ʒ����
	public void updateProductNum(List<OrderItem> items) throws SQLException {
		
		String sql = "update products set pnum=pnum+? where id=?";
		QueryRunner runner = new QueryRunner();
		
		Object[][] params = new Object[items.size()][2];

		for (int i = 0; i < params.length; i++) {
			params[i][0] = items.get(i).getBuynum();
			params[i][1] = items.get(i).getP().getId();
		}

		runner.batch(DataSourceUtils.getConnection(), sql, params);
	}


	//ǰ̨���������������������ģ����ѯ��Ӧ��ͼ��
	public List<Product> findBookByName(int currentPage, int currentCount,
			String searchfield) throws SQLException {
		//��������ģ����ѯͼ��
		String sql = "SELECT * FROM products WHERE name LIKE '%"+searchfield+"%' LIMIT ?,?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	//���ڷ�ҳ��ѯ������
	Object obj = new Object[] { (currentPage - 1) * currentCount, currentCount };
		return runner.query(sql, 
				new BeanListHandler<Product>(Product.class),currentPage-1,currentCount);
	}

	//ǰ̨�����򣬸�������ģ����ѯ����ͼ��������
	public int findBookByNameAllCount(String searchfield) throws SQLException {
		String sql = "SELECT COUNT(*) FROM products WHERE name LIKE '%"+searchfield+"%'";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//��ѯ��������������������Ϊlong����
		Long count = (Long)runner.query(sql, new ScalarHandler());
		return count.intValue();
	}

	//��̨ϵͳ������idɾ����Ʒ��Ϣ
	public void deleteProduct(String id) throws SQLException {
		String sql = "DELETE FROM products WHERE id = ?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, id);
	}
}

