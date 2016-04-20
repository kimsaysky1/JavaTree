package org.javatree.www.Action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.CompilerDAO;
import org.javatree.www.VO.Coding;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class CompilerAction extends ActionSupport implements SessionAware {
	@Autowired
	private SqlSession sqlsession;

	private Coding coding;
	private String content;
	private int lectureno;
	private int codingno;
	private List<Integer> lectureList;
	private List<Coding> codingList;
	private List<String> contentList;
	private Map<String, String> classNameMap;
	private String startClass;
	private String code1;
	private String code2;
	private String code3;
	private String code4;
	private String code5;
	private String result = "";
	private String id;
	private File directoryPath;
	private String resultType;

	public String runCode() throws Exception{
		CompilerDAO dao = sqlsession.getMapper(CompilerDAO.class);
		contentList = new ArrayList<>();
		
		System.out.println("code1: "+code1);
		System.out.println("code2: "+code2);
		if ((code1!=null)&&!(code1.trim().equals(""))) {
			contentList.add(code1);
		}
		if ((code2!=null)&&!(code2.trim().equals(""))) {
			contentList.add(code2);
		}
		if ((code3!=null)&&!(code3.trim().equals(""))) {
			contentList.add(code3);
		}
		if ((code4!=null)&&!(code4.trim().equals(""))) {
			contentList.add(code4);
		}
		if ((code5!=null)&&!(code5.trim().equals(""))) {
			contentList.add(code5);
		}

		int checkNum = 0;
		classNameMap = new HashMap<>();
		StringTokenizer st = null;
		StringBuffer buf = null;
		String file_parent = null;
		String file_name = null;
		id = "kim"; // 임시 아이디
		
		for (int i = 0; i < contentList.size(); i++) {
			if (contentList.get(i).contains("page language=\"java\" contentType=\"text/html; charset=UTF-8\"")) {
				file_parent = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/test/guest/"+id;
				file_name = "a"+i+".jsp";
				makeJspFile(file_parent, file_name, contentList.get(i)); 
				resultType = "jsp";
				result = "http://203.233.196.88:8585/test/guest/"+id+"/"+file_name;
			} else {
				for (int j = 0; j < contentList.size(); j++) {
					if (contentList.get(j).contains("public static void main(String[]")) {
						checkNum++;
						if (contentList.get(j).contains("public class")) {
							st = new StringTokenizer(contentList.get(j), " ");
							buf = new StringBuffer(st.nextToken());
							while (st.hasMoreTokens()) {
								String str = st.nextToken();
								buf.append(" " + str);
								if (buf.substring(buf.length() - 12, buf.length()).equals("public class")) {
									String mainClassName = st.nextToken();
									classNameMap.put(mainClassName, contentList.get(j));
									startClass = mainClassName + ".java";
									break;
								}
							}
						} else {
							st = new StringTokenizer(contentList.get(j), " ");
							while (st.hasMoreTokens()) {
								String str = st.nextToken();
								if (str.equals("class")) {
									String subClassName = st.nextToken();
									classNameMap.put(subClassName, contentList.get(j));
									break;
								}
							}
						}
					} else {
						st = new StringTokenizer(contentList.get(j), " ");
						while (st.hasMoreTokens()) {
							String str = st.nextToken();
							if (str.equals("class")) {
								String subClassName = st.nextToken();
								classNameMap.put(subClassName, contentList.get(j));
								break;
							}
						}
					}
				}//여기다가
				if (checkNum == 1) {
					for (String s : classNameMap.keySet()) {
						file_parent = "C:/compiler/" + id;
						file_name = s + ".java";
						try {
							makeJavaFile(file_parent, file_name, classNameMap.get(s));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					makeClassFile(file_parent);
					System.out.println("startClass: " + startClass);
					String[] cmd = { "java", "-cp", file_parent, startClass.substring(0, file_name.lastIndexOf(".") - 1) };
					for (int k = 0; k < cmd.length; k++) {
						System.out.println(cmd[k] + " ");
					}
					runProcess(cmd);
					deleteFile(file_parent);
				} else {
					System.out.println("메인 메소드가 한 개가 아님");
				}
				resultType = "java";
			}

		}
		

		return SUCCESS;
	}

	private void makeJspFile(String file_parent, String file_name, String content) {
		directoryPath = new File(file_parent);
		File file = new File(file_parent, file_name);
		if (!directoryPath.exists()) {
			directoryPath.mkdirs();
		}
		FileOutputStream fos = null;
		try {
			content = content.trim();
			byte[] contentByte = content.getBytes("utf-8");
			System.out.println("file: "+file);
			fos = new FileOutputStream(file);
			fos.write(contentByte);
			fos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String file_path = file_parent + "/" + file_name;
	}

	private void makeJavaFile(String file_parent, String file_name, String content) {
		directoryPath = new File(file_parent);
		File file = new File(file_parent, file_name);
		if (!directoryPath.exists()) {
			directoryPath.mkdirs();
		}
		FileOutputStream fos = null;
		try {
			content = content.trim();
			byte[] contentByte = content.getBytes("utf-8");
			fos = new FileOutputStream(file);
			fos.write(contentByte);
			fos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String file_path = file_parent + "/" + file_name;
	}

	private void makeClassFile(String file_parent) {
		runProcess("javac " + file_parent + "/*.java" + " -encoding UTF8");
	}

	private void printLines(InputStream ins) {
		String line = null;
		BufferedReader in;
		try {
			InputStreamReader reader = new InputStreamReader(ins, "MS949");
			in = new BufferedReader(reader);
			while ((line = in.readLine()) != null) {
				result += (line + "\n");
				System.out.println("result:" + result);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private int runProcess(String command) {
		Process pro = null;
		try {
			pro = Runtime.getRuntime().exec(command);
			printLines(pro.getInputStream());
			printLines(pro.getErrorStream());
			pro.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro.exitValue();
	}

	private int runProcess(String[] cmd) {

		Process pro = null;
		try {
			pro = Runtime.getRuntime().exec(cmd);
			printLines(pro.getInputStream());
			printLines(pro.getErrorStream());
			pro.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return pro.exitValue();
	}

	public void deleteFile(String path) {
		File file = new File(path);
		if (file.isDirectory()) {
			String[] childFiles = file.list();
			if (childFiles == null) {
				file.delete();
			} else {
				for (String childFilePath : childFiles) {
					deleteFile(path + "/" + childFilePath);
				}
			}
		} else {
			file.delete();
		}
	}

	public Coding getCoding() {
		return coding;
	}

	public void setCoding(Coding coding) {
		this.coding = coding;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLectureno() {
		return lectureno;
	}

	public void setLectureno(int lectureno) {
		this.lectureno = lectureno;
	}

	public int getCodingno() {
		return codingno;
	}

	public void setCodingno(int codingno) {
		this.codingno = codingno;
	}

	public List<Integer> getLectureList() {
		return lectureList;
	}

	public void setLectureList(List<Integer> lectureList) {
		this.lectureList = lectureList;
	}

	public List<Coding> getCodingList() {
		return codingList;
	}

	public void setCodingList(List<Coding> codingList) {
		this.codingList = codingList;
	}

	public List<String> getContentList() {
		return contentList;
	}

	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}

	public Map<String, String> getclassNameMap() {
		return classNameMap;
	}

	public void setclassNameMap(Map<String, String> classNameMap) {
		this.classNameMap = classNameMap;
	}

	public String getStartClass() {
		return startClass;
	}

	public void setStartClass(String startClass) {
		this.startClass = startClass;
	}

	public String getCode1() {
		return code1;
	}

	public void setCode1(String code1) {
		this.code1 = code1;
	}

	public String getCode2() {
		return code2;
	}

	public void setCode2(String code2) {
		this.code2 = code2;
	}

	public String getCode3() {
		return code3;
	}

	public void setCode3(String code3) {
		this.code3 = code3;
	}

	public String getCode4() {
		return code4;
	}

	public void setCode4(String code4) {
		this.code4 = code4;
	}

	public String getCode5() {
		return code5;
	}

	public void setCode5(String code5) {
		this.code5 = code5;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getResultType() {
		return resultType;
	}

	public void setResultType(String resultType) {
		this.resultType = resultType;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub

	}

}
