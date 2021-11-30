package Member;

// Member Table에 대한 Data Transfer Object 클래스
// id, password, name, score를 인스턴스 변수로 가짐
public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private int score;
	
	// 생성자
	public MemberDTO() {}
	public MemberDTO(String id, String password, String name, int score) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.score = score;
	}
	// 각 인스턴스 변수에 대한 getter/setter 메소드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
}
