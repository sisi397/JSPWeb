package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?useUnicode=true&characterEncoding=UTF-8"; //3306포트는 mysql에 접속할 수 있게 해주는 포트
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver"); //mysql에 접속할 수 있도록 해주는 매게체 역할을 해주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //데이터베이스 삽입
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery(); //실행 결과를 rs에 넣어줌.
			if(rs.next()) {
				if(rs.getString(1).contentEquals(userPassword))
					return 1; //로그인 성공
				else 
					return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserName());
			pstmt.setString(4,  user.getUserGender());
			pstmt.setString(5,  user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
