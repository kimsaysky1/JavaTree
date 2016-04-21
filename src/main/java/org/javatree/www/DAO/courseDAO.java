package org.javatree.www.DAO;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.javatree.www.VO.Course;
import org.javatree.www.VO.Lecture;

public interface courseDAO {

	public ArrayList<Lecture> getAllLectureListForTeach(String id);
	public ArrayList<Course> getAllCourseList();
	public ArrayList<Course> selectListbyField(Map<String, Object> kong);
	public ArrayList<Course> selectAllCourseList(Map<String, Object> kong);
	public ArrayList<Course> selectRecentRank();
	public ArrayList<Course> selectAllRank();
	
	public ArrayList<Course> selectAllCourseListForTeach(String id, RowBounds rowbounds);
	public int getTotal(String id);
	public void insertCourse(Course course);
	public void insertCourseType(Map<String, Object> map);
	public void insertTeachCourse(Map<String, Object> map);
	public void insertLecture(Lecture lecture);
	public ArrayList<Course> studyMainView(Map<String, Object> kong);
	public ArrayList<String> selectLatelyPurchasedLectureList1(Map<String, Object> kong);
	public ArrayList<String> selectLatelyPurchasedLectureList2(Map<String, Object> kong);
	public ArrayList<String> recentlyCompletedLectureList1(Map<String, Object> kong);
	public ArrayList<String> recentlyCompletedLectureList2(Map<String, Object> kong);
	public ArrayList<Course> pagingCourse(Map gong);
	public ArrayList<Course> pagingStudyCourse(Map<String, Object> kong);
	public int selectTotal(Map<String, Object> kong);
	
	
}
