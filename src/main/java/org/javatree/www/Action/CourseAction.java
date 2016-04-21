package org.javatree.www.Action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.struts2.interceptor.SessionAware;
import org.javatree.www.DAO.QnaDAO;
import org.javatree.www.DAO.courseDAO;
import org.javatree.www.Util.FileService;
import org.javatree.www.Util.PageNavigator;
import org.javatree.www.VO.Coding;
import org.javatree.www.VO.Error;

import org.javatree.www.VO.Course;
import org.javatree.www.VO.Lecture;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Question;
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
	String str;
	String message;
	Coding coding;
	Course course;
	Lecture lecture;
	ArrayList<Coding> codingList;
	ArrayList<Course> teachCourseList;
	private ArrayList<Course> courseList;
	ArrayList<Lecture> lectureList;
	Member_jt member_jt;
	Question question;
	Error error;
	String id;
	String username;
	int courseno;
	int lectureno;
	int codingno;
	String content;
	
	String coursename;
	String teacherid;
	boolean check;
	
	PageNavigator navi;
	int currentPage;
	int page;
	int total;
	
	ArrayList<Course> recentRank;
	ArrayList<Course> allRank;
	String interestString;
	
	String purejava;
	String web;
	String mobile;
	String iot;
	String swing;
	String jdbc;
	String api;
	String spring;
	String struts;
	String etcframework;
	String ect;
	ArrayList<String> courseTypeList;
	
	String lecturename;
	String regdate;
	File upload;
	String uploadedfilename, originalfilename;
	
	ArrayList<Lecture> recentlyCompletedLectureList;
	ArrayList<Lecture> latelyPurchasedLectureList;
	
	Map<String, Object> session;
	
	@Autowired
	SqlSession sqlSession;
	
	courseDAO dao;
	
	int start;
	int end;
	
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
		System.out.println("qna>>"+interestString);
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		ArrayList<String> interestList = new ArrayList<>();
		
		StringTokenizer st = new StringTokenizer(interestString, ",");
		while (st.hasMoreTokens()) {
			interestList.add(st.nextToken());
		}
		System.out.println(interestList.get(0));
		
		Map<String, Object> kong = new HashMap<>();
		for (int i = 0; i < interestList.size(); i++) {
			kong.put("interest"+i, interestList.get(i));
		}
		
		System.out.println("kong>>" + kong);
		
		courseList= dao.selectListbyField(kong);
		
		System.out.println("selectListbyField>> "+courseList);
		
		interestString = "Qsddf222df";
		
		return SUCCESS;
	}
	
	public String selectAllCourseList(){
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		//login시 활동들(임시)
		session.put("loginId", "1"); // 임시로 session에 아이디를 집어넣음, test완료 후 삭제 요망
		
		if(session.get("loginId") != null){
			String storedid = (String) session.get("loginId");
			System.out.println("로그인한 아이디>> " + storedid);
			
			//베스트 강좌 (역대, 최신)
			allRank = dao.selectAllRank();
			recentRank = dao.selectRecentRank();
			System.out.println("all>>" + allRank);
			System.out.println("recent>> " + recentRank);
			
			Map<String, Object> kong = new HashMap<>();
			kong.put("id", storedid);
			kong.put("searchText", null);
			
			/*courseList= dao.selectAllCourseList(kong);*/
			Map gong = new HashMap();
			gong.put("start", 1);
			gong.put("end", 2);
			
			courseList = dao.pagingCourse(gong);
		}
		
		System.out.println("selectAllCourseList>> "+courseList);
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
		gong.put("start", start);
		gong.put("end", end);
		/*System.out.println("typenoList plus: " + typenoList);*/
		courseList = dao.pagingCourse(gong);
		System.out.println(courseList);
		return SUCCESS;
	}
	
	
	public String studyMainView(){
		
		id = "2";
		
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		start = 1;
		end = 2;
		
		System.out.println("start>> " + start);
		System.out.println("end>> " + end);
		
		Map<String, Object> kong = new HashMap<>();
		kong.put("id", id);
		kong.put("start", start);
		kong.put("end", end);
		
		ArrayList<String> tempList1 = new ArrayList<>();
		tempList1 =  dao.selectLatelyPurchasedLectureList1(kong);
		System.out.println("1>>" + tempList1);
		ArrayList<String> tempList2 = new ArrayList<>();
		tempList2 =  dao.selectLatelyPurchasedLectureList2(kong);
		System.out.println("2>>"+tempList2);
		
		latelyPurchasedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList1.size(); i++) {
			Lecture l = new Lecture(tempList1.get(i), tempList2.get(i));
			latelyPurchasedLectureList.add(l);
		}
		
		
		System.out.println(latelyPurchasedLectureList);
		ArrayList<String> tempList3 = new ArrayList<>();
		tempList3 =  dao.recentlyCompletedLectureList1(kong);
		System.out.println("3>>" + tempList3);
		ArrayList<String> tempList4 = new ArrayList<>();
		tempList4 =  dao.recentlyCompletedLectureList2(kong);
		System.out.println("4>>"+tempList4);
		
		recentlyCompletedLectureList = new ArrayList<>();
		
		for (int i = 0; i < tempList3.size(); i++) {
			Lecture l = new Lecture(tempList3.get(i), tempList4.get(i));
			recentlyCompletedLectureList.add(l);
		}
		
		System.out.println(recentlyCompletedLectureList);
		
		//courseList = dao.studyMainView(kong);
		courseList = dao.pagingStudyCourse(kong);
		
		System.out.println(courseList.toString());
		
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
		
		System.out.println("studymainview-list>>" + courseList);
		//searchText = null;
		int totalCount = dao.selectTotal(kong);
		int countPerPage = Integer.parseInt(getText("2"));		//페이지당 글목록 수
		int pagePerGroup = Integer.parseInt(getText("2"));		//그룹당 페이지 수
		if(currentPage == 0){
			currentPage = 1;
		}
		navi=new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
		
		session.put("currentPage", currentPage);
		//session.put("searchText", searchText);
		session.put("getStartRecord", navi.getStartRecord());
		session.put("getCountPerPage", navi.getCountPerPage());
		
		return SUCCESS;
		
	}
	
	public String plusStudyMain() {
		Map gong = new HashMap();
		gong.put("id", "2");
		courseDAO dao = sqlSession.getMapper(courseDAO.class);
		
		if(session.get("searchText") == null) searchText = null;
		int totalCount=dao.selectTotal(gong);
		int countPerPage = Integer.parseInt(getText("2"));		//페이지당 글목록 수
		int pagePerGroup = Integer.parseInt(getText("2"));		//그룹당 페이지 수
		int nowPage = 0;
		if(session.get("currentPage") != null){
			nowPage = Integer.parseInt( session.get("currentPage").toString());
		}else {
			session.put("currentPage", 1);
			nowPage = 1;
		}		

		navi=new PageNavigator(countPerPage, pagePerGroup, nowPage, totalCount);
		start = Integer.parseInt( session.get("getStartRecord").toString());
		end = Integer.parseInt(session.get("getCountPerPage").toString());
		
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
		
		
		gong.put("start", start);
		gong.put("end", end);
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
		

		System.out.println(courseList);
		
		return SUCCESS;
	}
	
	
	
		/**
		 * 강사 -강좌리스트
		 * **/
		public String selectAllCourseListForTeach(){
			id=(String) session.get("loginId");
			System.out.println(id);
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			total= dao.getTotal(id);
			
			int countPerPage = 2;
			int pagePerGroup = 5;
			
			navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
			
			RowBounds rowbounds = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
			
			courseList= dao.selectAllCourseListForTeach(id, rowbounds);
			
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
		
		
		
		
		/**
		 * 강의등록-insertLecture
		 * @return
		 */
		public String insertLecture(){
			
			System.out.println("insertLecture>>Action");
			courseDAO dao = sqlSession.getMapper(courseDAO.class);
			
			/*insert Lecture*/
			lecture.setLecturename(lecturename);
			lecture.setRegdate(regdate);
			
			System.out.println(lecture+"insertLecture->lecture 객체");
			
			/*file upload*/
			if(upload != null && (upload.exists())) {
				lecture.setOriginalfilename(originalfilename);
				FileService fs = new FileService();
				
				String savePath = getText("board.uploadpath");
				try {
					String savedfile = fs.saveFile(upload, savePath, uploadedfilename);
					lecture.setUploadedfilename(savedfile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			dao.insertLecture(lecture);
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
	
		public courseDAO getDao() {
			return dao;
		}
	
		public void setDao(courseDAO dao) {
			this.dao = dao;
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

		public File getUpload() {
			return upload;
		}

		public void setUpload(File upload) {
			this.upload = upload;
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

		public ArrayList<Lecture> getRecentlyCompletedLectureList() {
			return recentlyCompletedLectureList;
		}

		public void setRecentlyCompletedLectureList(ArrayList<Lecture> recentlyCompletedLectureList) {
			this.recentlyCompletedLectureList = recentlyCompletedLectureList;
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

		
	
}
