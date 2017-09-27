package entity;

public class Score {
	private Student stu;
	private BanJi bj;
	private Subject sub;
	private int id;
	private Integer score;
	private String grade;
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public BanJi getBj() {
		return bj;
	}
	public void setBj(BanJi bj) {
		this.bj = bj;
	}
	public Subject getSub() {
		return sub;
	}
	public void setSub(Subject sub) {
		this.sub = sub;
	}			
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
