package org.javatree.www.VO;

import java.util.ArrayList;

public class Member_jt {

	private String id;
	private String password;
	private String username;
	private String email;
	private int point;
	private String countquestion;
	private String countresponse;
	private String countrecommend;
	private Interest interest;
	private Ability ability;
	private ArrayList<Course> courseList;
	private ArrayList<Lecture> lectureList;
	private ArrayList<Interest> interestList;
	private int minusPoint; //차감된 금액
	
	public Member_jt() {
	}
	
	public Member_jt(String id, String password, String username, String email, int point, String countquestion,
			String countresponse, String countrecommend, Interest interest, Ability ability,
			ArrayList<Course> courseList, ArrayList<Lecture> lectureList, ArrayList<Interest> interestList,
			int minusPoint) {
		super();
		this.id = id;
		this.password = password;
		this.username = username;
		this.email = email;
		this.point = point;
		this.countquestion = countquestion;
		this.countresponse = countresponse;
		this.countrecommend = countrecommend;
		this.interest = interest;
		this.ability = ability;
		this.courseList = courseList;
		this.lectureList = lectureList;
		this.interestList = interestList;
		this.minusPoint = minusPoint;
	}



	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public ArrayList<Interest> getInterestList() {
		return interestList;
	}


	public void setInterestList(ArrayList<Interest> interestList) {
		this.interestList = interestList;
	}


	public int getMinusPoint() {
		return minusPoint;
	}


	public void setMinusPoint(int minusPoint) {
		this.minusPoint = minusPoint;
	}


	public String getCountquestion() {
		return countquestion;
	}

	public void setCountquestion(String countquestion) {
		this.countquestion = countquestion;
	}

	public String getCountresponse() {
		return countresponse;
	}

	public void setCountresponse(String countresponse) {
		this.countresponse = countresponse;
	}

	public String getCountrecommend() {
		return countrecommend;
	}

	public void setCountrecommend(String countrecommend) {
		this.countrecommend = countrecommend;
	}

	public Interest getInterest() {
		return interest;
	}

	public void setInterest(Interest interest) {
		this.interest = interest;
	}

	public Ability getAbility() {
		return ability;
	}

	public void setAbility(Ability ability) {
		this.ability = ability;
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



	@Override
	public String toString() {
		return "Member_jt [id=" + id + ", password=" + password + ", username=" + username + ", email=" + email
				+ ", point=" + point + ", countquestion=" + countquestion + ", countresponse=" + countresponse
				+ ", countrecommend=" + countrecommend + ", interest=" + interest + ", ability=" + ability
				+ ", courseList=" + courseList + ", lectureList=" + lectureList + ", interestList=" + interestList
				+ ", minusPoint=" + minusPoint + "]";
	}

}
