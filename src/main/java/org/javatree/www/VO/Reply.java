package org.javatree.www.VO;

import java.util.ArrayList;

public class Reply {
	private int questionno;
	private int replyno;
	private String id;
	private String username;
	private String content;
	private String regdate;
	private int recommand;
	private ArrayList<Rereply> rereplyList;

	public Reply() {
	}

	public Reply(int questionno, int replyno, String id, String username, String content, String regdate, int recommand,
			ArrayList<Rereply> rereplyList) {
		this.questionno = questionno;
		this.replyno = replyno;
		this.id = id;
		this.username = username;
		this.content = content;
		this.regdate = regdate;
		this.recommand = recommand;
		this.rereplyList = rereplyList;
	}

	public int getQuestionno() {
		return questionno;
	}

	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getRecommand() {
		return recommand;
	}

	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}

	public ArrayList<Rereply> getRereplyList() {
		return rereplyList;
	}

	public void setRereplyList(ArrayList<Rereply> rereplyList) {
		this.rereplyList = rereplyList;
	}

	@Override
	public String toString() {
		return "Reply [questionno=" + questionno + ", replyno=" + replyno + ", id=" + id + ", username=" + username
				+ ", content=" + content + ", regdate=" + regdate + ", recommand=" + recommand + ", rereplyList="
				+ rereplyList + "]";
	}

}
