package Quiz;

public class QuizDTO {
	private int id;
	private String title;
	private String content;
	private String[] choice;
	private int answer;
	
	public QuizDTO() {}
	public QuizDTO(int id, String title, String content, String[] choice, int answer) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.choice = choice;
		this.answer = answer;
	}
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
