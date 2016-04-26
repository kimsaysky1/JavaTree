package org.javatree.www.Action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.QnaDAO;
import org.javatree.www.DAO.courseDAO;
import org.javatree.www.Util.PageNavigator;
import org.javatree.www.VO.Coding;
import org.javatree.www.VO.Error;

import org.javatree.www.VO.Course;
import org.javatree.www.VO.Lecture;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Question;
import org.javatree.www.VO.Subnote;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;


public class CourseAction extends ActionSupport implements SessionAware {
	
	/**
	 * 	Value Stack 에서 사용할 멤버를 선언,
		setter getter 주고받는것들. 꼭만들어줘야한다.
	 * 
	 * **/
	private String str;
	private String message;
	private Coding coding;
	private Course course;
	private Lecture lecture;
	private ArrayList<Coding> codingList;
	private ArrayList<Course> teachCourseList;
	private ArrayList<Course> courseList;
	private ArrayList<Lecture> lectureList;
	private Member_jt member_jt;
	private Question question;
	private Error error;
	private String id;
	private String username;
	private int courseno;
	private int lectureno;
	private int codingno;
	private String content;
	private String introdution;
	private String coursename;
	private String teacherid;
	private boolean check;
	
	private PageNavigator navi;
	private int currentPage;
	private int page;
	private int total;
	
	private String order;
	private ArrayList<Course> recentRank;
	private ArrayList<Course> allRank;
	private String interestString;
	
	private String purejava;
	private String web;
	private String mobile;
	private String iot;
	private String swing;
	private String jdbc;
	private String api;
	private String spring;
	private String struts;
	private String etcframework;
	private String ect;
	private ArrayList<String> courseTypeList;
	private String lecturename;
	private String regdate;
	private String uploadedfilename, originalfilename;
	private Subnote subnote;
	
	private static final String UploadPath="C:/coding/";
	
/*	private List<File> upload = new ArrayList<File>();
	private List<String> uploadContentType= new ArrayList<String>();
	private List<String> uploadFileName=new ArrayList<String>();*/
	
	private File saveFile;
	
	private List<File> upload = new ArrayList<File>();
	private List<String> uploadFileName = new ArrayList<String>();
	private List<String> uploadContentType = new ArrayList<String>();
	private ArrayList<Lecture> recentlyCompletedLectureList;
	private ArrayList<Lecture> latelyPurchasedLectureList;

	Map<String, Object> session;
	
	@Autowired
	SqlSession sqlSession;
	private courseDAO dao;
	private int start;
	private int end;
	private int endPageGroup;

	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
	
	private String searchText;
	private static final Logger logger = LoggerFactory.getLogger(CourseAction.class);
	/**
	 * 전체강좌리스트
	 * **/
	
	public String selectListbyField(){
		System.out.println("qna>> "+interestString);
		System.out.println("order>> "+order);
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		ArrayList<String> interestList = new ArrayList<>();
		
		StringTokenizer st = new StringTokenizer(interestString, ",");
		while (st.hasMoreTokens()) {
			interestList.add(st.nextToken());
		}
		
		Map<String, Object> kong = new HashMap<>();
		for (int i = 0; i < interestList.size(); i++) {
			kong.put("interest"+i, interestList.get(i));
		}
		
		kong.put("order", order);
		start = 1;
		end = 7;
		currentPage = 1;
		
		kong.put("start", start);
		kong.put("end", end);
		
		int totalRecordsCount = dao.selectFieldTotal(kong);
		
		int countPerPage = 7;		//페이지당 글목록 수
		endPageGroup = 1;
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		System.out.println("total>> "+ totalRecordsCount);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));
		
		System.out.println("kong>>" + kong);
		
		courseList= dao.selectListbyField(kong);
		
		System.out.println("selectListbyField>> "+courseList);
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		return SUCCESS;
	}
	
	public String plusSelectListbyField(){
		System.out.println("qna>>"+interestString);
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		ArrayList<String> interestList = new ArrayList<>();
		
		StringTokenizer st = new StringTokenizer(interestString, ",");
		while (st.hasMoreTokens()) {
			interestList.add(st.nextToken());
		}
		
		Map<String, Object> kong = new HashMap<>();
		for (int i = 0; i < interestList.size(); i++) {
			kong.put("interest"+i, interestList.get(i));
		}
		
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		System.out.println("get.currpage>> " + currentPage);
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		
		kong.put("start", start);
		kong.put("end", end);
		
		int totalRecordsCount = dao.selectFieldTotal(kong);
		
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		System.out.println("total>> "+ totalRecordsCount);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));
		
		System.out.println("kong>>" + kong);
		
		courseList= dao.selectListbyField(kong);
		
		System.out.println("selectListbyField>> "+courseList);
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		return SUCCESS;
	}
	
	public String selectAllCourseList(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		//login시 활동들(임시)
		 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
		session.put("loginId", "2");
			
			String storedid = (String) session.get("loginId");
			System.out.println("로그인한 아이디>> " + storedid);
			
			//베스트 강좌 (역대, 최신)
			allRank = dao.selectAllRank();
			recentRank = dao.selectRecentRank();
			System.out.println("all>>" + allRank);
			System.out.println("recent>> " + recentRank);
			
			Map<String, Object> kong = new HashMap<>();
			
			kong.put("id", storedid);
			
			start = 1;
			end = 7;
			currentPage = 1;
			
			/*courseList= dao.selectAllCourseList(kong);*/
			kong.put("start", start);
			kong.put("end", end);
			
			
			int totalRecordsCount = dao.selectDefaultTotal(kong);
			
			int countPerPage = 7;		//페이지당 글목록 수
			endPageGroup = 1;
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			System.out.println("total>> "+ totalRecordsCount);
			System.out.println("currentpage>> "+ currentPage);
			System.out.println("CountPerPage>> " + session.get("CountPerPage"));
			System.out.println("endPageGroup>> " + session.get("endPageGroup"));
			
			courseList = dao.pagingCourse(kong);
			
		System.out.println("selectAllCourseList>> "+courseList);
		return SUCCESS;
	}
	
	public String searchCourse(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		//login시 활동들(임시)
		 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
			
			Map<String, Object> kong = new HashMap<>();
			
			System.out.println("stext0>> " + searchText);
			
			if(searchText.trim().length() > 0){
				searchText = "%"+searchText+"%";
				kong.put("searchText", searchText);
				session.put("searchText", searchText);
			}
			
			start = 1;
			end = 7;
			currentPage = 1;
			
			kong.put("start", start);
			kong.put("end", end);
									
			int totalRecordsCount = dao.selectDefaultTotal(kong);
			
			int countPerPage = 7;		//페이지당 글목록 수
			endPageGroup = 1;
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			System.out.println("total>> "+ totalRecordsCount);
			System.out.println("currentpage>> "+ currentPage);
			System.out.println("CountPerPage>> " + session.get("CountPerPage"));
			System.out.println("endPageGroup>> " + session.get("endPageGroup"));
			
			courseList = dao.searchCourse(kong);
			
			System.out.println("stext>> " + searchText);
			
		System.out.println("searchCourse>> "+courseList);
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		return SUCCESS;
	}
	
	public String plusSearchCourse(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		System.out.println("currentPage"+currentPage);
		//login시 활동들(임시)
		 // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
			
			Map<String, Object> kong = new HashMap<>();
				//searchText = "%"+searchText+"%";
			if(session.get("searchText") == null) kong.put("searchText", null);
			System.out.println("session의 search값> " + session.get("searchText").toString());
			kong.put("searchText", session.get("searchText").toString());
			
			start = (currentPage-1)*7 + 1; 
			end = start+6;
			
			kong.put("start", start);
			kong.put("end", end);
			
			System.out.println("s> " + start + " / e> " + end);
			
			int totalRecordsCount = dao.selectDefaultTotal(kong);
			
			int countPerPage = 7;		//페이지당 글목록 수
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			System.out.println("total>> "+ totalRecordsCount);
			System.out.println("currentpage>> "+ currentPage);
			System.out.println("CountPerPage>> " + session.get("CountPerPage"));
			System.out.println("endPageGroup>> " + session.get("endPageGroup"));
			
			courseList = dao.searchCourse(kong);
			
			System.out.println("stext>> " + searchText);
			
		System.out.println("PlussearchCourse>> "+courseList);
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		
		return SUCCESS;
	}
	
	public String plusCourseDefaultMain() throws Exception {
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map gong = new HashMap();
		/*System.out.println("stringForTokenizer.length(): " + stringForTokenizer.length());*/
		/*if (stringForTokenizer.length() >= 2) {
			StringTokenizer st = new StringTokenizer(stringForTokenizer, ",");
			typenoList = new ArrayList<>();
			while (st.hasMoreTokens()) {
				String temp = st.nextToken();
				typenoList.add(Integer.parseInt(temp));
			}
			map.put("typenoList", typenoList);
		}*/
		
		gong.put("id", "2");
		
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		System.out.println("get.currpage>> " + currentPage);
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		gong.put("start", start);
		gong.put("end", end);
		/*gong.put("searchText", "%"+searchText+"%");*/
		System.out.println("start>> " + start);
		System.out.println("end>> " + end);
		
		session.put("currentPage", currentPage);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));

		/*System.out.println("typenoList plus: " + typenoList);*/
		
		courseList = dao.pagingCourse(gong);
		System.out.println("plusCourseDefaultMain>>"+ courseList.size() + " / " + courseList);
		
		//베스트 강좌 (역대, 최신)
		allRank = dao.selectAllRank();
		recentRank = dao.selectRecentRank();
		return SUCCESS;
	}
	
	
	public String studyMainView(){
		
		id = "2";
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		//페이지 시작 값, 마지막 값, 현재 페이지 = 1
		start = 1;
		end = 7;
		currentPage = 1;
		
		Map<String, Object> kong = new HashMap<>();
		kong.put("id", id);
		kong.put("start", start);
		kong.put("end", end);
		
		ArrayList<String> tempList1 = new ArrayList<>();
		tempList1 =  dao.selectLatelyPurchasedLectureList1(kong);
		ArrayList<String> tempList2 = new ArrayList<>();
		tempList2 =  dao.selectLatelyPurchasedLectureList2(kong);
		
		latelyPurchasedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList1.size(); i++) {
			Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
			latelyPurchasedLectureList.add(l);
		}
		
		ArrayList<String> tempList3 = new ArrayList<>();
		tempList3 =  dao.recentlyCompletedLectureList1(kong);
		ArrayList<String> tempList4 = new ArrayList<>();
		tempList4 =  dao.recentlyCompletedLectureList2(kong);
		
		recentlyCompletedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList3.size(); i++) {
			Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
			recentlyCompletedLectureList.add(l);
		}
		
		System.out.println(recentlyCompletedLectureList);
		courseList = dao.pagingStudyCourse(kong);
		
		for (int i = 0; i < courseList.size(); i++) {
			
			for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
				
				String key = courseList.get(i).getCourseTypeList().get(j);
				
				switch (key) {
				case "1":
					courseList.get(i).getCourseTypeList().set(j, "Purejava");
					break;
				case "2":
					courseList.get(i).getCourseTypeList().set(j, "Web");
					break;
				case "3":
					courseList.get(i).getCourseTypeList().set(j, "Mobile");
					break;
				case "4":
					courseList.get(i).getCourseTypeList().set(j, "IOT");
					break;
				case "5":
					courseList.get(i).getCourseTypeList().set(j, "Swing");
					break;
				case "6":
					courseList.get(i).getCourseTypeList().set(j, "JDBC");
					break;
				case "7":
					courseList.get(i).getCourseTypeList().set(j, "API");
					break;
				case "8":
					courseList.get(i).getCourseTypeList().set(j, "Spring");
					break;
				case "9":
					courseList.get(i).getCourseTypeList().set(j, "Struts");
					break;
				case "10":
					courseList.get(i).getCourseTypeList().set(j, "etcFramework");
					break;
				case "11":
					courseList.get(i).getCourseTypeList().set(j, "etc");
					break;
				default:
					break;
				}
				
			}
			
		}
		
		if(session.get("searchText") == null) searchText = null;
		int totalRecordsCount = dao.selectTotal(kong);
		
		int countPerPage = 7;		//페이지당 글목록 수
		endPageGroup = 1;
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		//session.put("searchText", searchText);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		System.out.println("total>> "+ totalRecordsCount);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));
		return SUCCESS;
		
	}
	
	public String plusStudyMain() {
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		System.out.println("------------plus");
		System.out.println("currentpage>> " + currentPage);
		
		session.put("currentPage", currentPage);
		if(currentPage == 0){
			currentPage = 1;
		}
		
		Map gong = new HashMap();
		gong.put("id", "2");
		
		if(session.get("searchText") == null) searchText = null;
		int countPerPage = (int) session.get("CountPerPage");		//페이지당 글목록 수
		
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		gong.put("start", start);
		gong.put("end", end);
		
		session.put("currentPage", currentPage);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));
		/*System.out.println("stringForTokenizer.length(): " + stringForTokenizer.length());*/
		/*if (stringForTokenizer.length() >= 2) {
			StringTokenizer st = new StringTokenizer(stringForTokenizer, ",");
			typenoList = new ArrayList<>();
			while (st.hasMoreTokens()) {
				String temp = st.nextToken();
				typenoList.add(Integer.parseInt(temp));
			}
			map.put("typenoList", typenoList);
		}*/
		
		//session에서 loginId 받아와야 합니다.
		
		/*System.out.println("typenoList plus: " + typenoList);*/
		courseList = dao.pagingStudyCourse(gong);
		
		for (int i = 0; i < courseList.size(); i++) {
			
			for (int j = 0; j < courseList.get(i).getCourseTypeList().size(); j++) {
				
				String key = courseList.get(i).getCourseTypeList().get(j);
				
				switch (key) {
				case "1":
					courseList.get(i).getCourseTypeList().set(j, "Purejava");
					break;
				case "2":
					courseList.get(i).getCourseTypeList().set(j, "Web");
					break;
				case "3":
					courseList.get(i).getCourseTypeList().set(j, "Mobile");
					break;
				case "4":
					courseList.get(i).getCourseTypeList().set(j, "IOT");
					break;
				case "5":
					courseList.get(i).getCourseTypeList().set(j, "Swing");
					break;
				case "6":
					courseList.get(i).getCourseTypeList().set(j, "JDBC");
					break;
				case "7":
					courseList.get(i).getCourseTypeList().set(j, "API");
					break;
				case "8":
					courseList.get(i).getCourseTypeList().set(j, "Spring");
					break;
				case "9":
					courseList.get(i).getCourseTypeList().set(j, "Struts");
					break;
				case "10":
					courseList.get(i).getCourseTypeList().set(j, "etcFramework");
					break;
				case "11":
					courseList.get(i).getCourseTypeList().set(j, "etc");
					break;
				default:
					break;
				}
				
			}
			
		}
		
		ArrayList<String> tempList1 = new ArrayList<>();
		tempList1 =  dao.selectLatelyPurchasedLectureList1(gong);
		ArrayList<String> tempList2 = new ArrayList<>();
		tempList2 =  dao.selectLatelyPurchasedLectureList2(gong);
		
		latelyPurchasedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList1.size(); i++) {
			Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
			latelyPurchasedLectureList.add(l);
		}
		
		
		System.out.println(latelyPurchasedLectureList);
		ArrayList<String> tempList3 = new ArrayList<>();
		tempList3 =  dao.recentlyCompletedLectureList1(gong);
		ArrayList<String> tempList4 = new ArrayList<>();
		tempList4 =  dao.recentlyCompletedLectureList2(gong);
		
		recentlyCompletedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList3.size(); i++) {
			Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
			recentlyCompletedLectureList.add(l);
		}
		
		return SUCCESS;
	}
	
	public String selectCourseDefaultDetail() {
		
		start = 1;
		end = 10;
		currentPage = 1;
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		kong.put("id", (String)session.get("loginId"));
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		
		int countPerPage = 10;		//페이지당 글목록 수
		endPageGroup = 1;
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		System.out.println("total>> "+ totalRecordsCount);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));
		
		ArrayList<Lecture> tempList = new ArrayList<>();
		tempList = dao.selectCourseDefaultDetail(kong);
		lectureList = new ArrayList<>();
		
		if(end > tempList.size()){
			end = tempList.size();			
		}
		
		for (int i = start; i < end; i++) {
			lectureList.add(tempList.get(i-1));
		}
		
		coursename = lectureList.get(0).getCoursename();
		introdution = lectureList.get(0).getIntrodution();
		return SUCCESS;
	}
	
	public String plusCourseDefaultDetail() {
				
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("courseno", courseno);
		kong.put("id", (String)session.get("loginId"));
		
		int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong);
		int countPerPage = 10;		//페이지당 글목록 수
		start = countPerPage*currentPage-(countPerPage-1);
		end = countPerPage*currentPage;
		
		endPageGroup = 1;
		if(totalRecordsCount % countPerPage == 0 ){
			endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
		}else{
			endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
		}
		
		if(currentPage == 0){
			currentPage = 1;
		}
				
		session.put("currentPage", currentPage);
		session.put("CountPerPage", countPerPage);
		session.put("endPageGroup", endPageGroup);
		
		System.out.println("total>> "+ totalRecordsCount);
		System.out.println("currentpage>> "+ currentPage);
		System.out.println("CountPerPage>> " + session.get("CountPerPage"));
		System.out.println("endPageGroup>> " + session.get("endPageGroup"));
		
		ArrayList<Lecture> tempList = new ArrayList<>();
		tempList = dao.selectCourseDefaultDetail(kong);
		lectureList = new ArrayList<>();
		
		if(end > tempList.size()){
			end = tempList.size();			
		}
		
		for (int i = start; i < end+1; i++) {
			lectureList.add(tempList.get(i-1));
		}
		
		coursename = lectureList.get(0).getCoursename();
		introdution = lectureList.get(0).getIntrodution();
		return SUCCESS;
	}
	
	
	public String insertLectureForStudy() {
		
		System.out.println("lectureno>> " + lectureno);
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		Map<String, Object> kong = new HashMap<>();
		kong.put("id", (String)session.get("loginId"));
		kong.put("lectureno", lectureno);
		kong.put("courseno", courseno);
		kong.put("coursename", coursename);
		kong.put("teacherid", teacherid);
		int confirm = dao.updateMemberPoint(kong);
		System.out.println("confrim>> " + confirm);
		if(confirm == 1){
			
			try {
				int k = dao.checkStudyCourse(kong);
				if (k == 0) {
					dao.insertLectureForStudy(kong);
				}
				dao.insertLectureForStudy1(kong);
				dao.updateStudentCount(lectureno);
			} catch (Exception e) {
				return ERROR;
			}
			message = "수강 신청 완료!";
		}else {
			return ERROR;
		}
		
		System.out.println("message>> " + message);
		selectCourseDefaultDetail(kong);
		
		return SUCCESS;
	}
	
		private void selectCourseDefaultDetail(Map<String, Object> kong2) {
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			start = 1;
			end = 10;
			currentPage = 1;
			
			int totalRecordsCount = dao.selectCourseDefaultDetailTotal(kong2);
			
			int countPerPage = 10;		//페이지당 글목록 수
			endPageGroup = 1;
			if(totalRecordsCount % countPerPage == 0 ){
				endPageGroup = (int)(totalRecordsCount/countPerPage);		//총 (페이지)그룹 수
			}else{
				endPageGroup = (int)(totalRecordsCount/countPerPage)+1;		//총 (페이지)그룹 수
			}
			
			if(currentPage == 0){
				currentPage = 1;
			}
					
			session.put("currentPage", currentPage);
			session.put("CountPerPage", countPerPage);
			session.put("endPageGroup", endPageGroup);
			
			System.out.println("total>> "+ totalRecordsCount);
			System.out.println("currentpage>> "+ currentPage);
			System.out.println("CountPerPage>> " + session.get("CountPerPage"));
			System.out.println("endPageGroup>> " + session.get("endPageGroup"));
			
			ArrayList<Lecture> tempList = new ArrayList<>();
			tempList = dao.selectCourseDefaultDetail(kong2);
			lectureList = new ArrayList<>();
			
			if(end > tempList.size()){
				end = tempList.size();			
			}
			
			for (int i = start; i < end; i++) {
				lectureList.add(tempList.get(i-1));
			}
			
			coursename = lectureList.get(0).getCoursename();
			introdution = lectureList.get(0).getIntrodution();
			
	}

		/**
		 * 강사 -강좌리스트
		 * **/
		public String selectAllCourseListForTeach(){
			id=(String) session.get("loginId");
			System.out.println(id);
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			courseList= dao.selectAllCourseListForTeach(id);
			/*total= dao.getTotal(id);
			
			int countPerPage = 2;
			int pagePerGroup = 5;
			
			navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
			
			RowBounds rowbounds = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
			
			courseList= dao.selectAllCourseListForTeach(id, rowbounds);
			*/
			/*courseList= dao.getAllCourseListForTeach(id, navi.getStartRecord(), navi.getCountPerPage());*/
			System.out.println(courseList+"강좌리스트2들어옴");
			return SUCCESS;
		}
			
		public String insertCourse(){
			System.out.println("인서트옴");
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			/*insert Course*/
			id = (String) session.get("loginId");
			course.setId(id);
			course.setUsername(id);
			System.out.println(course+"insertCourse->course 객체");
			System.out.println(courseTypeList+"코어스리스트");
			dao.insertCourse(course);
			
			/*insert CourseType*/
			Map<String, Object> map = new HashMap<>();
			for(int i = 0; i < courseTypeList.size(); i++){
				//map.put("courseno", course.getCoureseno());
				map.put("typeno", courseTypeList.get(i));
				System.out.println("map: "+map);
				
				map.put("id", course.getId());
				map.put("coursename", course.getCoursename());
				System.out.println("map: "+map);
				dao.insertCourseType(map);
				/*insert TeachCourse*/
				dao.insertTeachCourse(map);
			}
			
			
			/*Map<String, Object> map2 = new HashMap<>();
			System.out.println("티치코어스맵들어옴");
			System.out.println("map: "+map2);
			map2.put("id", course.getId());
			map2.put("coursename", course.getCoursename());
			dao.insertTeachCourse(map2);
			System.out.println("map: "+map2);*/
	
			return SUCCESS;
		}
		
		/**
		 * 수강생-수강신청한 강의
		 * **/
		public String getAllLectureListForStudy(String id){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			return SUCCESS;
			
			
		}
		
		/**
		 * 강사-등록한 강의!!
		 * **/
		public String getAllLectureListForTeach(String id){
			System.out.println("강의리스트들어옴");
			id=(String) session.get("loginId");
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			lectureList=dao.getAllLectureListForTeach(id);
			return SUCCESS;
		}
		/**
		 * 수강종료된 강의!!
		 * -수강종료된 강좌는 없다.
		 * **/
		public ArrayList<Lecture> getAllExLecture(String id){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			return lectureList;
		}
		/**
		 * 수강자-수강중인 강의
		 * **/
		public ArrayList<Course> getAllIngCourseForStudy(String id){
			return courseList;
		} 
		
		public String insertLectureForm(){
			return SUCCESS;
		}
		
		
		/**
		 * 강의등록-insertLecture20160421수정
		 * @return
		 * @throws IOException 
		 */
		public String insertLecture() throws IOException{
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			/*insert Lecture*/
			lecture.setCourseno(courseno);
			lecture.setLecturename(lecture.getLecturename());
			lecture.setRegdate(lecture.getRegdate());
			
			System.out.println(uploadContentType+"컨텐트타입");
			System.out.println(uploadFileName+"파일네임");
			//System.out.println(getUpload()+"실제파일");
			
			/*강의video*/
			File video=new File(UploadPath+uploadFileName.get(0)); /*파일네임*/
			FileUtils.copyFile(upload.get(0), video); /*실제파일*/
			System.out.println(video+"video");
			/*서브노트파일*/
			File note=new File(UploadPath+uploadFileName.get(1));
			FileUtils.copyFile(upload.get(1), note);
			System.out.println(note+"subnote");
			
			
			originalfilename="lecture,"+UploadPath+video+","+System.currentTimeMillis();/*실제파일이름*/
			uploadedfilename=uploadFileName.get(0); /*실제파일경로*/
			System.out.println("경로1: "+uploadedfilename);
			lecture.setUploadedfilename(UploadPath+uploadedfilename);
			lecture.setOriginalfilename(originalfilename);
			dao.insertLecture(lecture);
			originalfilename="subnote,"+note+","+System.currentTimeMillis();
			uploadedfilename=uploadFileName.get(1);
			System.out.println("경로2: "+uploadedfilename);
			
			subnote = new Subnote();
			id=(String) session.get("loginId");
			subnote.setId(id);
			System.out.println("subnote2: "+subnote);
			subnote.setOriginalfilename(originalfilename);
			subnote.setUploadedfilename(UploadPath+uploadedfilename);
			System.out.println("subnote3: "+subnote);
			System.out.println(subnote+"서브노트객체");
			dao.insertSubnote(subnote);

			
			/*insert Teachlecture*/
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			System.out.println(courseno+"티치렉쳐");
			map.put("courseno", courseno);
			map.put("point", 0);
			map.put("studentcount", 0);
			System.out.println(map+"티치렉쳐맵");
			dao.insertTeachLecture(map);
			
			
			
			/*파일명 + System.currentTimeMillis()
			
			"subnote"+파일명+System.currentTimeMillis()*/
			
			/*file upload
			/*if(upload != null && (upload.exists())) {
				lecture.setOriginalfilename(originalfilename);
				FileService fs = new FileService();
				
				String savePath = "C://coding";
				try {
					String savedfile = fs.saveFile(upload, savePath, uploadedfilename);
					lecture.setUploadedfilename(savedfile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}*/
			/*lecture.setOriginalfilename(originalfilename);
			lecture.setUploadedfilename(uploadedfilename);*/
			
			/*dao.insertLecture(lecture);*/
			/*/////////////////////////////////////////////////////////////*/
			/*insert Subnote*/
			/*id=(String) session.get("loginId");
			subnote.setId(id);*/
			/*subnote.setUploadedfilename(uploadedfilename);*/
			
			/*file upload*/
			/*if(upload != null && (upload.exists())) {
				//lecture.setOriginalfilename(originalfilename);
				FileService fs = new FileService();
				
				String savePath = "C://coding";
				try {
					String savedfile = fs.saveFile(upload, savePath, uploadedfilename);
					lecture.setUploadedfilename(savedfile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}*/
			
/*			System.out.println(subnote+"insertLecture->subnote 객체");
			dao.insertSubnote(subnote);*/
			
			
			/*insert lectureCoding*/
				
			/*Map<String, Object> map = new HashMap<>();*/
			/*dao.insertLectureCoding(codingno);*/
				
				

			/*insert Coding-나중에 하겠다.*/
			
			/*coding.setCodingquestion(codingquestion);
			coding.setCodingtemplet(codingtemplet);
			coding.setCodinganswer(codinganswer);
			coding.setRegdate(regdate);
			dao.insertCoding(coding);*/
			
			return SUCCESS;
		}

		/**
		 * 게시글 삭제
		 * @return
		 */
		/*public String deleteBoard(){

			bdao.deleteBoard(boardno);
			
			return SUCCESS;
		}
		 */
		
		
		/*파일명 + System.currentTimeMillis()
		"subnote"+파일명+System.currentTimeMillis()
		나중에 필요하면 서브스트링*/
		
		/*public String multiFileUpload() throws IOException {
			
			File video=new File(UploadPath+uploadFileName.get(1));
			FileUtils.copyFile(getUpload().get(1), video);
			System.out.println(video+"video");
			
			File subnote=new File(UploadPath+uploadFileName.get(2));
			FileUtils.copyFile(getUpload().get(2), subnote);
			System.out.println(subnote+"subnote");
			
			return SUCCESS;
		}*/
		
		
		
		public String CourseDetailForTeachForm(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			id=(String) session.get("loginId");
			//lectureList = dao.selectAllLectureListForTeach(id);
			lectureList = dao.selectAllLectureListForTeach(courseno);
			System.out.println(courseno+"courseno");
			course=dao.selectCourse(courseno);     
			return SUCCESS;
		}
		
		public String mediaPlayerForm(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			System.out.println("미디어플레이어폼 lectureno: "+lectureno);
			lecture = dao.selectLecture(lectureno);
			
			return SUCCESS;
		}
		
		public String deleteLecture(){
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			System.out.println("deletelecture 옴, lectureno : "+lectureno);
			dao.deleteCheckLecture(lectureno);
			dao.deleteStudyLecture(lectureno);
			dao.deleteSubnote(lectureno);
			dao.deleteLectureCoding(lectureno);
			dao.deleteLecture(lectureno);
			System.out.println("courseno : "+courseno);
			//lectureList= dao.selectAllLectureListForTeach(id);
			return SUCCESS;
		}
		
		/*강의업데이트 -courseDetailForTeach-updateLecture*/
		public String updateLectureForm(){
			
			return SUCCESS;
		}
		
		public String updateSubnoteForm(){
			
			return SUCCESS;
		}
		
		public String updateLecture() throws IOException{
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			System.out.println("updatelecture 옴 , lectureno: "+lectureno);
			
			
			System.out.println(uploadContentType+"컨텐트타입");
			System.out.println(uploadFileName+"파일네임");
			//System.out.println(getUpload()+"실제파일");
			
			/*강의video*/
			File video=new File(UploadPath+uploadFileName.get(0)); /*파일네임*/
			FileUtils.copyFile(upload.get(0), video); /*실제파일저장*/
			System.out.println(video+"video");
			
			originalfilename="lecture,"+UploadPath+video+","+System.currentTimeMillis();/*실제파일이름*/
			uploadedfilename=uploadFileName.get(0); /*실제파일경로*/
			System.out.println("경로1: "+uploadedfilename);
			System.out.println("lectureno: "+lectureno);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("originalfilename", originalfilename);
			map.put("uploadedfilename", UploadPath+uploadedfilename);
			map.put("lectureno", lectureno);
			
			dao.updateLecture(map);
			
			return SUCCESS;
		}
		
		public String updateSubnote() throws IOException{
			
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			System.out.println("updateSubnote 옴 , lectureno: "+lectureno);
			
			
			System.out.println(uploadContentType+"컨텐트타입");
			System.out.println(uploadFileName+"파일네임");
			//System.out.println(getUpload()+"실제파일");
			
			/*서브노트파일*/
			File note=new File(UploadPath+uploadFileName.get(1));
			FileUtils.copyFile(upload.get(0), note);
			System.out.println(note+"subnote");
			
			originalfilename="subnote,"+note+","+System.currentTimeMillis();
			uploadedfilename=uploadFileName.get(0);
			System.out.println("경로: "+uploadedfilename);
			
			subnote = new Subnote();
			id=(String) session.get("loginId");
			subnote.setId(id);
			subnote.setOriginalfilename(originalfilename);
			subnote.setUploadedfilename(UploadPath+uploadedfilename);
			subnote.setLectureno(lectureno);
			System.out.println(subnote+"서브노트객체");
			
			dao.updateSubnote(subnote);
			
			return SUCCESS;
		}
		
		
		public String getCourseInfo(String id){
			return SUCCESS;
		}
		public ArrayList<Lecture> getAllLectureList(String id){
			
			return lectureList;
		}
		
		
		
		
		public Coding getCoding() {
			return coding;
		}
	
		public void setCoding(Coding coding) {
			this.coding = coding;
		}
	
		public Course getCourse() {
			return course;
		}
	
		public void setCourse(Course course) {
			this.course = course;
		}
	
		public Lecture getLecture() {
			return lecture;
		}
	
		public void setLecture(Lecture lecture) {
			this.lecture = lecture;
		}
	
		public ArrayList<Coding> getCodingList() {
			return codingList;
		}
	
		public void setCodingList(ArrayList<Coding> codingList) {
			this.codingList = codingList;
		}
	
		public ArrayList<Course> getCourseList() {
			return courseList;
		}
	
		public void setCourseList(ArrayList<Course> courseList) {
			this.courseList = courseList;
		}
	
		public ArrayList<Lecture> getLectureList() {
			return lectureList;
		}
	
		public void setLectureList(ArrayList<Lecture> lectureList) {
			this.lectureList = lectureList;
		}
	
		public Member_jt getMember_jt() {
			return member_jt;
		}
	
		public void setMember_jt(Member_jt member_jt) {
			this.member_jt = member_jt;
		}
	
		public Question getQuestion() {
			return question;
		}
	
		public void setQuestion(Question question) {
			this.question = question;
		}
	
		public Error getError() {
			return error;
		}
	
		public void setError(Error error) {
			this.error = error;
		}
	
		public String getId() {
			return id;
		}
	
		public void setId(String id) {
			this.id = id;
		}
	
		
	
		public int getCourseno() {
			return courseno;
		}
	
		public void setCourseno(int courseno) {
			this.courseno = courseno;
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
	
		public String getContent() {
			return content;
		}
	
		public void setContent(String content) {
			this.content = content;
		}
	
		public boolean getCheck() {
			return check;
		}
	
		public void setCheck(boolean check) {
			this.check = check;
		}
	
		public Map<String, Object> getSession() {
			return session;
		}
		public ArrayList<Course> getRecentRank() {
			return recentRank;
		}
		public void setRecentRank(ArrayList<Course> recentRank) {
			this.recentRank = recentRank;
		}
		public ArrayList<Course> getAllRank() {
			return allRank;
		}
		public void setAllRank(ArrayList<Course> allRank) {
			this.allRank = allRank;
		}
		public String getInterestString() {
			return interestString;
		}
		public void setInterestString(String interestString) {
			this.interestString = interestString;
		}
		
		
		public String getSearchText() {
			return searchText;
		}
	
		public void setSearchText(String searchText) {
			this.searchText = searchText;
		}
	
		
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getStr() {
			return str;
		}
		public void setStr(String str) {
			this.str = str;
		}
	
		public ArrayList<Course> getTeachCourseList() {
			return teachCourseList;
		}
	
		public void setTeachCourseList(ArrayList<Course> teachCourseList) {
			this.teachCourseList = teachCourseList;
		}
	
		public String getUsername() {
			return username;
		}
	
		public void setUsername(String username) {
			this.username = username;
		}
	
		public String getCoursename() {
			return coursename;
		}
	
		public void setCoursename(String coursename) {
			this.coursename = coursename;
		}
	
		public PageNavigator getNavi() {
			return navi;
		}
	
		public void setNavi(PageNavigator navi) {
			this.navi = navi;
		}
	
		public int getCurrentPage() {
			return currentPage;
		}
	
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
	
		public int getPage() {
			return page;
		}
	
		public void setPage(int page) {
			this.page = page;
		}
	
		public int getTotal() {
			return total;
		}
	
		public void setTotal(int total) {
			this.total = total;
		}
	
		public String getPurejava() {
			return purejava;
		}
	
		public void setPurejava(String purejava) {
			this.purejava = purejava;
		}
	
		public String getWeb() {
			return web;
		}
	
		public void setWeb(String web) {
			this.web = web;
		}
	
		public String getMobile() {
			return mobile;
		}
	
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
	
		public String getIot() {
			return iot;
		}
	
		public void setIot(String iot) {
			this.iot = iot;
		}
	
		public String getSwing() {
			return swing;
		}
	
		public void setSwing(String swing) {
			this.swing = swing;
		}
	
		public String getJdbc() {
			return jdbc;
		}
	
		public void setJdbc(String jdbc) {
			this.jdbc = jdbc;
		}
	
		public String getApi() {
			return api;
		}
	
		public void setApi(String api) {
			this.api = api;
		}
	
		public String getSpring() {
			return spring;
		}
	
		public void setSpring(String spring) {
			this.spring = spring;
		}
	
		public String getStruts() {
			return struts;
		}
	
		public void setStruts(String struts) {
			this.struts = struts;
		}
	
		public String getEtcframework() {
			return etcframework;
		}
	
		public void setEtcframework(String etcframework) {
			this.etcframework = etcframework;
		}
	
		public String getEct() {
			return ect;
		}
	
		public void setEct(String ect) {
			this.ect = ect;
		}
	
		public ArrayList<String> getCourseTypeList() {
			return courseTypeList;
		}
	
		public void setCourseTypeList(ArrayList<String> courseTypeList) {
			this.courseTypeList = courseTypeList;
		}
	
		public String getLecturename() {
			return lecturename;
		}

		public void setLecturename(String lecturename) {
			this.lecturename = lecturename;
		}

		public String getRegdate() {
			return regdate;
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		public String getTeacherid() {
			return teacherid;
		}

		public void setTeacherid(String teacherid) {
			this.teacherid = teacherid;
		}
		public String getUploadedfilename() {
			return uploadedfilename;
		}

		public void setUploadedfilename(String uploadedfilename) {
			this.uploadedfilename = uploadedfilename;
		}

		public String getOriginalfilename() {
			return originalfilename;
		}

		public void setOriginalfilename(String originalfilename) {
			this.originalfilename = originalfilename;
		}

		public Subnote getSubnote() {
			return subnote;
		}

		public void setSubnote(Subnote subnote) {
			this.subnote = subnote;
		}

		public File getSaveFile() {
			return saveFile;
		}

		public void setSaveFile(File saveFile) {
			this.saveFile = saveFile;
		}

		public static String getUploadpath() {
			return UploadPath;
		}

		public List<String> getUploadFileName() {
			return uploadFileName;
		}

		public void setUploadFileName(List<String> uploadFileName) {
			this.uploadFileName = uploadFileName;
		}

		public List<String> getUploadContentType() {
			return uploadContentType;
		}

		public void setUploadContentType(List<String> uploadContentType) {
			this.uploadContentType = uploadContentType;
		}

		public ArrayList<Lecture> getLatelyPurchasedLectureList() {
			return latelyPurchasedLectureList;
		}

		public void setLatelyPurchasedLectureList(ArrayList<Lecture> latelyPurchasedLectureList) {
			this.latelyPurchasedLectureList = latelyPurchasedLectureList;
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
		public int getEndPageGroup() {
			return endPageGroup;
		}

		public void setEndPageGroup(int endPageGroup) {
			this.endPageGroup = endPageGroup;
		}

		public String getIntrodution() {
			return introdution;
		}

		public void setIntrodution(String introdution) {
			this.introdution = introdution;
		}

		public List<File> getUpload() {
			return upload;
		}

		public void setUpload(List<File> upload) {
			this.upload = upload;
		}

		public ArrayList<Lecture> getRecentlyCompletedLectureList() {
			return recentlyCompletedLectureList;
		}

		public void setRecentlyCompletedLectureList(ArrayList<Lecture> recentlyCompletedLectureList) {
			this.recentlyCompletedLectureList = recentlyCompletedLectureList;
		}
		
		public String getOrder() {
			return order;
		}

		public void setOrder(String order) {
			this.order = order;
		}
		
}
