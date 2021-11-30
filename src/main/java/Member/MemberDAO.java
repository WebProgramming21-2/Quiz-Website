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

// Member Table에 대한 Data Access Object 클래스
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
	
	// 생성자
	private MemberDAO() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// getInstance 메소드
	// 싱글톤 패턴으로 구현
	public static MemberDAO getInstance() {
		if (memberDAO == null) {
			memberDAO = new MemberDAO();
		}
			return memberDAO;
	}
	
	// check 메소드
	// id가 primary key 이므로 이를 통해 데이터 존재 유무를 판단
	private boolean checkId(String id) {
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
	
	// register 메소드
	// member 객체를 인자로 받아 해당 데이터로 회원가입
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
	
	// register 메소드
	// member 객체를 인자로 받아 해당 데이터로 로그인
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
	
	// delete 메소드
	// id와 pw를 인자로 받아 해당 데이터로 로그인
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
	
	// Name에 대한 get 메소드
	// id를 인자로 받아 해당 이름을 리턴
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
	
	// Score 데이터에 대한 set 메소드
	// id와 score를 인자로 받아 존재하는 아이디일 경우, 해당 점수를 업데이트
	public void setScore(String id, int score) {
		if (checkId(id)) {
			String sql = "UPDATE MEMBER SET score = ? where id = ?";
			
			try {
				getConnection();
				prstate = con.prepareStatement(sql);
				prstate.setInt(1, score);
				prstate.setString(2, id);
				prstate.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
	}
	
	// Rank 데이터에 대한 get 메소드
	// member 데이터 중 rank에 대한 정보만 따로 추출하여 리스트 형태로 리턴
	public List<Rank> getRankList() {
		List<Rank> ret = new ArrayList<Rank>();
		
		try {
			getConnection();
			state = con.createStatement();
			String sql = "SELECT * FROM MEMBER ORDER BY score DESC";
			result = state.executeQuery(sql);
			while (result.next()) {
				if (result.getInt("score") < 0) break;
				Rank rank = new Rank();
				rank.setId(result.getString("id"));
				rank.setName(result.getString("name"));
				rank.setScore(result.getInt("score"));
				
				ret.add(rank);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return ret;
	}
	
	// connect 메소드
	// db와 연결
	private Connection getConnection() throws SQLException {
		con = DriverManager.getConnection(url, username, password);
		return con;
	}
	// close 메소드
	// 사용이 종료된 객체들에 대해 close 작업 수행
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
