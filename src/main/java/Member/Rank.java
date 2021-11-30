package Member;

// Rank 데이터에 대한 모델 클래스
// id, name, score를 인스턴스 변수로 가짐
public class Rank {
	String id;
	String name;
	int score;
	
	// 생성자
	public Rank() {}
	public Rank(String id, String name, int score) {
		super();
		this.id = id;
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
