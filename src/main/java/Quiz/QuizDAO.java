package Quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class QuizDAO {
	private static QuizDAO quizDAO = null;
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://db4free.net:3306/webquiz";
	private static final String username = "quizer";
	private static final String password = "ehdrnrfhu057";
	private Connection con;
	private Statement state;
	private ResultSet result;
	
	private QuizDAO() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static QuizDAO getInstance() {
		if (quizDAO == null) {
			quizDAO = new QuizDAO();
		}
			return quizDAO;
	}
	
	public List<QuizDTO> getQuizList() {
		List<QuizDTO> ret = new ArrayList<QuizDTO>();
		String sql = "SELECT COUNT(*) FROM QUIZ";
		
		try {
			getConnection();
			state = con.createStatement();
			result = state.executeQuery(sql);
			result.next();
			int count = result.getInt(1);
			for (int i=0;i<count;i++) {
				sql = "SELECT * FROM QUIZ where seq = " + (i+1);
				result = state.executeQuery(sql);
				result.next();
				
				QuizDTO quiz = new QuizDTO();
				quiz.setId(result.getInt("seq"));
				quiz.setTitle(result.getString("title"));
				quiz.setContent(result.getString("content"));
				String[] choice = new String[4];
				for (int j=0;j<4;j++) {
					choice[j] = result.getString("choice" + (j+1));
				}
				quiz.setChoice(choice);
				quiz.setAnswer(result.getInt("answer"));
				
				ret.add(quiz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ret;
	}
	
	private Connection getConnection() throws SQLException {
		con = DriverManager.getConnection(url, username, password);
		return con;
	}
	private void close() {
		try {
			if (con != null) {
				con.close();
			}
			if (state != null) {
				state.close();
			}
			if (result != null) {
				result.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
