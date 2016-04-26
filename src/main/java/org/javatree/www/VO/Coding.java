package org.javatree.www.VO;

public class Coding {
	private int codingno;
	private String codingquestion;
	private String codingtemplet;
	private String codinganswer;
	private String regdate;
	private String id;
<<<<<<< HEAD
	
	
	public Coding() {
		super();
	}


	public Coding(int codingno, String codingquestion, String codingtemplet, String codinganswer, String regdate,
			String id) {
		super();
		this.codingno = codingno;
		this.codingquestion = codingquestion;
		this.codingtemplet = codingtemplet;
		this.codinganswer = codinganswer;
		this.regdate = regdate;
		this.id = id;
	}
	
	
=======
	
>>>>>>> a7afe6f4d17944dcdecf9cc0bceaa0946778f254
	public int getCodingno() {
		return codingno;
	}

	public void setCodingno(int codingno) {
		this.codingno = codingno;
	}

	public String getCodingquestion() {
		return codingquestion;
	}

	public void setCodingquestion(String codingquestion) {
		this.codingquestion = codingquestion;
	}

	public String getCodingtemplet() {
		return codingtemplet;
	}

	public void setCodingtemplet(String codingtemplet) {
		this.codingtemplet = codingtemplet;
	}

	public String getCodinganswer() {
		return codinganswer;
	}

	public void setCodinganswer(String codinganswer) {
		this.codinganswer = codinganswer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
<<<<<<< HEAD
	public String getId() {
		return id;
	}
=======

	public String getId() {
		return id;
	}

>>>>>>> a7afe6f4d17944dcdecf9cc0bceaa0946778f254
	public void setId(String id) {
		this.id = id;
	}

<<<<<<< HEAD
=======
	public Coding() {
	}

	public Coding(int codingno, String codingquestion, String codingtemplet, String codinganswer, String regdate,
			String id) {
		super();
		this.codingno = codingno;
		this.codingquestion = codingquestion;
		this.codingtemplet = codingtemplet;
		this.codinganswer = codinganswer;
		this.regdate = regdate;
		this.id = id;
	}
>>>>>>> a7afe6f4d17944dcdecf9cc0bceaa0946778f254

	@Override
	public String toString() {
		return "Coding [codingno=" + codingno + ", codingquestion=" + codingquestion + ", codingtemplet="
				+ codingtemplet + ", codinganswer=" + codinganswer + ", regdate=" + regdate + ", id=" + id + "]";
	}

<<<<<<< HEAD
	
=======
>>>>>>> a7afe6f4d17944dcdecf9cc0bceaa0946778f254
	

}