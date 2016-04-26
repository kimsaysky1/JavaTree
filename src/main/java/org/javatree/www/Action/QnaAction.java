package org.javatree.www.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.QnaDAO;
import org.javatree.www.Util.PageNavigator;
import org.javatree.www.VO.Ability;
import org.javatree.www.VO.Interest;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Question;
import org.javatree.www.VO.Reply;
import org.javatree.www.VO.Rereply;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class QnaAction extends ActionSupport implements SessionAware{
	@Autowired
	private SqlSession sqlsession;

	private Question question;
	private int questionno;
	private Reply reply;
	private int replyno;
	private Rereply rereply;
	private List<Question> questionList;
	private List<Reply> bestRecentQuestionList;
	private List<Reply> bestAllQuestionList;
	private List<Question> gunggumAllQuestionList;
	private List<Question> gunggumRecentQuestionList;
	private List<Rereply> rereplyList;
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
	private Map<String, Object> session; 
	
	public String insertQuestion() throws Exception {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		question.setId("1");
		question.setUsername("1");
		question.setTypeno(Integer.parseInt(typeno));
		question.setCodingno(1);
		dao.insertQuestion(question);
		String loginId = (String) session.get("loginId");
		if(loginId == null){
			return ERROR;
		}
		makeQnaDefaultMain(loginId);
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
		dao.insertReply(reply);
		question = dao.selectOneQuestion(reply.getQuestionno());
		replyList = dao.selectAllReply(reply.getQuestionno());
		System.out.println("replyList: " + replyList);
		return SUCCESS;
	}

	public void makeQnaDefaultMain(String loginId) {
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		Member_jt member = dao.selectOneMember(loginId);
		System.out.println("member: "+member);
		typenoList = new ArrayList<>();
		
		int questionnum = member.getCountquestion();
		int responsenum = member.getCountresponse();
		int recommendnum = member.getCountrecommend();
		ArrayList<Interest> interestList = member.getInterestList();
		ArrayList<Ability> abilityList = member.getAbilityList();
		for(int i = 0; i < abilityList.size(); i++){
			if(abilityList.get(i).getValue() == 3){
				if(!(typenoList.contains(abilityList.get(i).getTypeno()))){
					typenoList.add(abilityList.get(i).getTypeno());
				}
			}
		}
		for(int i = 0; i < interestList.size(); i++){
			if(interestList.get(i).getValue() == 3){
				if(!(typenoList.contains(interestList.get(i).getTypeno()))){
					typenoList.add(interestList.get(i).getTypeno());
				}
			}
		}
		if(questionnum >= responsenum){
			for(int i = 0; i < abilityList.size(); i++){
				if(abilityList.get(i).getValue() == 2){
					if(!(typenoList.contains(abilityList.get(i).getTypeno()))){
						typenoList.add(abilityList.get(i).getTypeno());
					}
				}
			}
		}else if(questionnum < responsenum){
			for(int i = 0; i < interestList.size(); i++){
				if(interestList.get(i).getValue() == 2){
					if(!(typenoList.contains(interestList.get(i).getTypeno()))){
						typenoList.add(interestList.get(i).getTypeno());
					}
				}
			}
		}
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 5);
		map.put("typenoList", typenoList);
		questionList = dao.selectAllQuestion(map);
		gunggumAllQuestionList = dao.gunggumAllQuestionList();
		gunggumRecentQuestionList = dao.gunggumRecentQuestionList();
		bestAllQuestionList = dao.bestAllQuestionList();
		bestRecentQuestionList = dao.bestRecentQuestionList();
	}

	public String qnaDefaultMain() throws Exception {
		String loginId = (String) session.get("loginId");
		System.out.println("loginId: "+loginId);
		if(loginId == null){
			return ERROR;
		}
		makeQnaDefaultMain(loginId);
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
		QnaDAO dao = sqlsession.getMapper(QnaDAO.class);
		rereply.setId("1");
		rereply.setUsername("1");
		rereply.setRegdate("2016-04-19");
		System.out.println("rereply: " + rereply);
		dao.insertRereply(rereply);
		rereplyList = dao.selectAllRereply(replyno);
		System.out.println("rereplyList: "+rereplyList);
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

	public List<Reply> getBestRecentQuestionList() {
		return bestRecentQuestionList;
	}

	public void setBestRecentQuestionList(List<Reply> bestRecentQuestionList) {
		this.bestRecentQuestionList = bestRecentQuestionList;
	}

	public List<Reply> getBestAllQuestionList() {
		return bestAllQuestionList;
	}

	public void setBestAllQuestionList(List<Reply> bestAllQuestionList) {
		this.bestAllQuestionList = bestAllQuestionList;
	}

	public List<Rereply> getRereplyList() {
		return rereplyList;
	}

	public void setRereplyList(List<Rereply> rereplyList) {
		this.rereplyList = rereplyList;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
