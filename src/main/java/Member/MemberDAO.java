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
	
	public boolean checkId(String id) {
		String sql = "SELECT password FROM MEMBER where id = ?";
		
		try {
			getConnection();
			prstate = con.prepareStatement(sql);
			prstate.setString(1, id);
			result = prstate.executeQuery();
			
			if (result.next()) {
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
	
	public boolean register(MemberDTO member) {
		if (!checkId(member.getId())) {
			String sql = "INSERT INTO MEMBER(id, password, name) values (?, ?, ?)";
			
			try {
				getConnection();
				prstate = con.prepareStatement(sql);
				prstate.setString(1, member.getId());
				prstate.setString(2, member.getPassword());
				prstate.setString(3, member.getName());
				prstate.executeUpdate();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
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
	
	public boolean delete(String id, String pw){
		String sql="SELECT password FROM MEMBER where id = ?";
		String dbpw="";
		try{
			getConnection();
			prstate = con.prepareStatement(sql);
			prstate.setString(1, id);
			result = prstate.executeQuery();
			if(result.next()){
				dbpw = result.getString("password");
				if(dbpw.equals(pw)){
					String delsql="DELETE FROM MEMBER where id = ?";
					prstate = con.prepareStatement(delsql);
					prstate.setString(1, id);
					prstate.executeUpdate();
					return true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return false;
	}
	
	public String getName(String id) {
		String sql = "SELECT name FROM MEMBER where id = ?";
		
		try {
			getConnection();
			prstate = con.prepareStatement(sql);
			prstate.setString(1, id);
			result = prstate.executeQuery();
			
			if (result.next()) {
				return result.getString(1);
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
	
	public float getScore(String id){
		if (checkId(id)) {
			String sql = "SELECT score FROM MEMBER where id = ?";
			
			try {
				getConnection();
				prstate = con.prepareStatement(sql);
				prstate.setString(1, id);
				result = prstate.executeQuery();
				
				if (result.next()) {
					return result.getInt(1);
				}
				return -2;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		return -2;
	}
	
	public void setScore(String id, float score) {
		if (checkId(id)) {
			String sql = "UPDATE MEMBER SET score = ? where id = ?";
			
			try {
				getConnection();
				prstate = con.prepareStatement(sql);
				prstate.setFloat(1, score);
				prstate.setString(2, id);
				prstate.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
	}
	
	public List<Rank> getRankList() {
		List<Rank> ret = new ArrayList<Rank>();
		
		try {
			getConnection();
			state = con.createStatement();
			String sql = "SELECT * FROM MEMBER ORDER BY score DESC";
			result = state.executeQuery(sql);
			while (result.next()) {
				if (result.getFloat("score") < 0) break;
				Rank rank = new Rank();
				rank.setId(result.getString("id"));
				rank.setName(result.getString("name"));
				rank.setScore(result.getFloat("score"));
				
				ret.add(rank);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
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
			if (prstate != null) {
				prstate.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
