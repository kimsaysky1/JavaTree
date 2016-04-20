package org.javatree.www.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

//���ε��� ���� ���� & ����� ���� ����
public class FileService {
	/**
	 * File��ü, ������ ���, ���ϸ��� ���޹޾� ������ ���� ����
	 * @param file	������ �ӽ÷� ���ε�� ���� ��ü
	 * @param basePath	������ ���
	 * @param filename	������ �ӽ÷� ���ε�� ������ �̸�
	 * @return	���� ����� ������ �̸�
	 * @throws IOException
	 */
	public String saveFile(File file, String basePath, String filename) throws IOException {
		//������ ���ų� ũ�Ⱑ 0�̸� �������� �ʰ� null�� ����
		if (file == null || file.length() <= 0) {
			return null; 
		}
		
		//���� ���丮�� ���� ��� ����
		File dir = new File(basePath);
		if (!dir.isDirectory()) dir.mkdirs();
		
		//������ ���ϸ��� ����Ϸ� ����
		String savedFilename;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		savedFilename = sdf.format(new Date());
		
		//���� ������ Ȯ����
		String ext;
		int lastIndex = filename.lastIndexOf('.');
		if (lastIndex == -1)
			ext = "";
		else 
			ext = "." + filename.substring(lastIndex + 1);

		//������ ��ü ���
		String serverFullPath = null;
		File serverFile = null;
		
		//���� �̸��� ������ �ִ� ����� ó�� (�ڿ� �ð����� ����)
		while (true) {
			//serverFilename = strDate + ext;
			serverFullPath = basePath + "/" + savedFilename + ext;
			serverFile = new File(serverFullPath);
			if ( !serverFile.isFile()) break;	//���� �̸��� ������ ������ ����.
			savedFilename = savedFilename + new Date().getTime();
		}
		
		//���� ����
		FileInputStream in = new FileInputStream(file);
		FileOutputStream out = new FileOutputStream(serverFile);
		
		int bytesRead = 0;
		byte[] buffer = new byte[1024];
		while ((bytesRead = in.read(buffer, 0, 1024)) != -1) {
			out.write(buffer, 0, bytesRead);
		}
		
		out.close();
		in.close();
		
		//���� ����� ������ �̸��� ���� 
		return savedFilename + ext;
	}
	
	
	/**
	 * ������ ����� ������ ����
	 * @param fullpath ����� ������ ��ü ���
	 * @return ���� ���� ����
	 */
	public boolean fileDelete(String fullpath) {
		boolean check = false;
		
		try {
			File file = new File(fullpath);
			if (file.isFile()) {
				file.delete();
				check = true;
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return check;
	}
}
