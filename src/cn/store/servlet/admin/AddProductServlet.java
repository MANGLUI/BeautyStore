package cn.store.servlet.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import cn.store.domain.Product;
import cn.store.exception.AddProductException;
import cn.store.service.ProductService;
import cn.store.utils.FileUploadUtils;
import cn.store.utils.IdUtils;

public class AddProductServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ����javaBean,���ϴ����ݷ�װ.
		Product p = new Product();
		Map<String, String> map = new HashMap<String, String>();
		// ��װ��Ʒid
		map.put("id", IdUtils.getUUID());

		DiskFileItemFactory dfif = new DiskFileItemFactory();
		// ������ʱ�ļ��洢λ��
		dfif.setRepository(new File(this.getServletContext().getRealPath(
				"/temp")));
		// �����ϴ��ļ������СΪ10m
		dfif.setSizeThreshold(1024 * 1024 * 10);
		// �����ϴ����
		ServletFileUpload upload = new ServletFileUpload(dfif);
		// �����ϴ��ļ���������
		upload.setHeaderEncoding("utf-8");
		try {
			// ����request�õ����е�FileItem
			List<FileItem> items = upload.parseRequest(request);
			// ��������FileItem
			for (FileItem item : items) {
				// �жϵ�ǰ�Ƿ����ϴ����
				if (item.isFormField()) {
					// �����ϴ����
					String fieldName = item.getFieldName(); // ��ȡ�������
					String value = item.getString("utf-8"); // �����������
					map.put(fieldName, value);
				} else {
					// ���ϴ����
					// �õ��ϴ��ļ���ʵ����
					String fileName = item.getName();
					fileName = FileUploadUtils.subFileName(fileName);

					// �õ��������
					String randomName = FileUploadUtils
							.generateRandonFileName(fileName);

					// �õ����Ŀ¼
					String randomDir = FileUploadUtils
							.generateRandomDir(randomName);
					// ͼƬ�洢��Ŀ¼
					String imgurl_parent = "/productImg" + randomDir;

					File parentDir = new File(this.getServletContext()
							.getRealPath(imgurl_parent));
					// ��֤Ŀ¼�Ƿ���ڣ���������ڣ���������
					if (!parentDir.exists()) {
						parentDir.mkdirs();
					}
					String imgurl = imgurl_parent + "/" + randomName;

					map.put("imgurl", imgurl);

					IOUtils.copy(item.getInputStream(), new FileOutputStream(
							new File(parentDir, randomName)));
					item.delete();
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		try {
			// �����ݷ�װ��javaBean��
			BeanUtils.populate(p, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		ProductService service = new ProductService();
		try {
			// ����service��������Ʒ����
			service.addProduct(p);
			response.sendRedirect(request.getContextPath()
					+ "/ListProductServlet");
			return;
		} catch (AddProductException e) {
			e.printStackTrace();
			response.getWriter().write("�����Ʒʧ��");
			return;
		}

	}

}
