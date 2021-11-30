package Quiz;

// Quiz Table에 대한 Data Transfer Object 클래스
// id, title, content, chioce1~4, answer를 인스턴스 변수로 가짐
public class QuizDTO {
	private int id;
	private String title;
	private String content;
	private String[] choice;
	private int answer;
	
	// 생성자
	public QuizDTO() {}
	public QuizDTO(int id, String title, String content, String[] choice, int answer) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.choice = choice;
		this.answer = answer;
	}
	// 각 인스턴스 변수에 대한 getter/setter 메소드
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getChoice() {
		return choice;
	}
	public void setChoice(String[] choice) {
		this.choice = choice;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
}
