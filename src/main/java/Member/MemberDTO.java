package Member;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private float score;
	
	public MemberDTO() {}
	public MemberDTO(String id, String password, String name, int score) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.score = score;
	}
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
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	
	
}
