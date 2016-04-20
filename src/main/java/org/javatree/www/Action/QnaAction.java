package org.javatree.www.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.javatree.www.DAO.QnaDAO;
import org.javatree.www.Util.PageNavigator;
import org.javatree.www.VO.Question;
import org.javatree.www.VO.Reply;
import org.javatree.www.VO.Rereply;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class QnaAction extends ActionSupport {
	@Autowired
	private SqlSession sqlsession;

	private Question question;
	private int questionno;
	private Reply reply;
	private int replyno;
	private Rereply rereply;
	private List<Question> questionList;
	private List<Question> bestRecentQuestionList;
	private List<Question> bestAllQuestionList;
	private List<Question> gunggumAllQuestionList;
	private List<Question> gunggumRecentQuestionList;
	private List<Integer> typenoList;
	private String stringForTokenizer;
	private List<Reply> replyList;
	private PageNavigator pagenavi;
	private String typeno;
	private int currentPage = 1;
	private String type;
	private String keyword;
	private int start;
	private int end;

	public String insertQuestion() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		question.setId("1");
		question.setUsername("1");
		question.setTypeno(Integer.parseInt(typeno));
		question.setCodingno(1);
		System.out.println("question: " + question);
		dao.insertQuestion(question);
		makeQnaDefaultMain();
		return SUCCESS;
	}

	public String insertReplyReady() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		question = dao.selectOneQuestion(questionno);
		return SUCCESS;
	}

	public String insertReply() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		reply.setId("1");
		reply.setUsername("1");
		System.out.println("reply: "+reply);
		dao.insertReply(reply);
		question = dao.selectOneQuestion(reply.getQuestionno());
		replyList = dao.selectAllReply(reply.getQuestionno());
		return SUCCESS;
	}

	public void makeQnaDefaultMain(){
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		map.put("typeno", typenoList);
		questionList = dao.selectAllQuestion(map);
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
	}
	public String qnaDefaultMain() throws Exception {
		
		makeQnaDefaultMain();
		/*
		 * int totalCount = dao.getTotal(); System.out.println("totalCount: "
		 * +totalCount); int countPerPage = 4; int pagePerGroup = 3;
		 * System.out.println("currentPage: "+currentPage); pagenavi=new
		 * PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
		 * RowBounds rowbound = new RowBounds(pagenavi.getStartRecord(),
		 * pagenavi.getCountPerPage()); questionList = sqlsession.selectList(
		 * "org.javatree.www.DAO.QnaDAO.selectAllQuestion", rowbound);
		 * questionList = dao.selectAllQuestion(pagenavi.getStartRecord(),
		 * pagenavi.getCountPerPage()); System.out.println("questionList: "
		 * +questionList); System.out.println("start: "
		 * +pagenavi.getStartPageGroup()); System.out.println("end: "
		 * +pagenavi.getEndPageGroup());
		 */
		return SUCCESS;
	}

	public String searchListByInterest() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		StringTokenizer st = new StringTokenizer(stringForTokenizer, ",");
		typenoList = new ArrayList<>();
		while (st.hasMoreTokens()) {
			String temp = st.nextToken();
			typenoList.add(Integer.parseInt(temp));
		}
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		map.put("typenoList", typenoList);
		questionList = dao.selectAllQuestion(map);
		return SUCCESS;
	}

	public String plusQnaDefaultMain() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Map map = new HashMap();
		System.out.println("stringForTokenizer.length(): " + stringForTokenizer.length());
		if (stringForTokenizer.length() >= 2) {
			StringTokenizer st = new StringTokenizer(stringForTokenizer, ",");
			typenoList = new ArrayList<>();
			while (st.hasMoreTokens()) {
				String temp = st.nextToken();
				typenoList.add(Integer.parseInt(temp));
			}
			map.put("typenoList", typenoList);
		}
		map.put("start", start);
		map.put("end", end);
		System.out.println("typenoList plus: " + typenoList);
		questionList = dao.selectAllQuestion(map);
		return SUCCESS;
	}

	public String qnaDetail() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		question = dao.selectOneQuestion(questionno);
		replyList = dao.selectAllReply(questionno);
		return SUCCESS;
	}

	public String insertRereply() throws Exception {
		System.out.println("rereply: " + rereply);

		return SUCCESS;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Rereply getRereply() {
		return rereply;
	}

	public void setRereply(Rereply rereply) {
		this.rereply = rereply;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
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

	public PageNavigator getPagenavi() {
		return pagenavi;
	}

	public void setPagenavi(PageNavigator pagenavi) {
		this.pagenavi = pagenavi;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public List<Question> getBestRecentQuestionList() {
		return bestRecentQuestionList;
	}

	public void setBestRecentQuestionList(List<Question> bestRecentQuestionList) {
		this.bestRecentQuestionList = bestRecentQuestionList;
	}

	public List<Question> getBestAllQuestionList() {
		return bestAllQuestionList;
	}

	public void setBestAllQuestionList(List<Question> bestAllQuestionList) {
		this.bestAllQuestionList = bestAllQuestionList;
	}

	public List<Question> getGunggumAllQuestionList() {
		return gunggumAllQuestionList;
	}

	public void setGunggumAllQuestionList(List<Question> gunggumAllQuestionList) {
		this.gunggumAllQuestionList = gunggumAllQuestionList;
	}

	public List<Question> getGunggumRecentQuestionList() {
		return gunggumRecentQuestionList;
	}

	public void setGunggumRecentQuestionList(List<Question> gunggumRecentQuestionList) {
		this.gunggumRecentQuestionList = gunggumRecentQuestionList;
	}

	public List<Integer> getTypenoList() {
		return typenoList;
	}

	public void setTypenoList(List<Integer> typenoList) {
		this.typenoList = typenoList;
	}

	public String getStringForTokenizer() {
		return stringForTokenizer;
	}

	public void setStringForTokenizer(String stringForTokenizer) {
		this.stringForTokenizer = stringForTokenizer;
	}

	public String getTypeno() {
		return typeno;
	}

	public void setTypeno(String typeno) {
		this.typeno = typeno;
	}

}
