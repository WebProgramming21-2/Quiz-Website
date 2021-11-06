package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Quiz.QuizDAO;
import Quiz.QuizDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = null;
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://db4free.net:3306/webquiz";
	private static final String username = "quizer";
	private static final String password = "ehdrnrfhu057";
	private Connection con;
	private Statement state;
	private PreparedStatement prstate;
	private ResultSet result;
	
	private MemberDAO() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getInstance() {
		if (memberDAO == null) {
			memberDAO = new MemberDAO();
		}
			return memberDAO;
	}
	
	public boolean register(MemberDTO member) {
		int ret;
		String sql = "INSERT INTO MEMBER(id, password, name) values (?, ?, ?)";
		
		try {
			getConnection();
			prstate = con.prepareStatement(sql);
			prstate.setString(1, member.getId());
			prstate.setString(2, member.getPassword());
			prstate.setString(3, member.getName());
			ret = prstate.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return false;
	}
	
	public boolean login(MemberDTO member) {
		String sql = "SELECT password FROM MEMBER where id = ?";
		
		try {
			getConnection();
			prstate = con.prepareStatement(sql);
			prstate.setString(1, member.getId());
			result = prstate.executeQuery();
			
			if (result.next() && result.getString(1).contentEquals(member.getPassword())) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return false;
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
