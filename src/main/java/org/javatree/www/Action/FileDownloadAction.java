package org.javatree.www.Action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport{
	int boardno;
	String contentType;
	String contentDisposition;
	InputStream inputStream;
	long contentLength;
	
	public FileDownloadAction() {
		
	}
	
	public String execute() {
		try {
			String savedfile = null;
			String originalfile = null;
			String basePath = null;

			//Board board = new BoardDAO().getBoard(boardno);

			/*savedfile = board.getSavedfile();
			originalfile = board.getOriginalfile();
			basePath = getText("board.uploadpath");*/
			
			String serverFullPath = basePath + "/" + savedfile;
			
			File file = new File(serverFullPath);
			setContentLength(file.length());
			setContentDisposition("attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8")); 	//파일의 원래 이름
			
			inputStream = new FileInputStream(serverFullPath);	//다운로드할 스트림
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

	//getters, setters
	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	
	
}
