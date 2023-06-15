package cn.store.utils;

import java.util.UUID;

public class FileUploadUtils {
	/**
	 * 截取真实文件�?
	 * 
	 * @param fileName
	 * @return
	 */
	public static String subFileName(String fileName) {
		// 查找�?���?�� \出现位置
		int index = fileName.lastIndexOf("\\");
		if (index == -1) {
			return fileName;
		}
		return fileName.substring(index + 1);
	}

	// 获得随机UUID文件�?
	public static String generateRandonFileName(String fileName) {
		// 获得扩展�?
		int index = fileName.lastIndexOf(".");
		if (index != -1) {
			String ext = fileName.substring(index);
			return UUID.randomUUID().toString() + ext;
		}
		return UUID.randomUUID().toString();
	}

	// 获得hashcode生成二级目录
	public static String generateRandomDir(String uuidFileName) {
		int hashCode = uuidFileName.hashCode();
		// �?��目录
		int d1 = hashCode & 0xf;
		// 二级目录
		int d2 = (hashCode >> 4) & 0xf;
		return "/" + d1 + "/" + d2;
	}
}
