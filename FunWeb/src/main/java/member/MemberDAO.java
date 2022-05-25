package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	
	public Connection getConnection() throws Exception {
		
//		Class.forName("com.mysql.jdbc.Driver");
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb3?serverTimezone=Asia/Seoul&useSSL=false";
//		String dbUser="root";
//		String dbPass="1234";
//		con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
		 
//		return con;
		
		// ConnectionPool => 서버단에서 디비연결한 후에 연결정보를 불러서 사용함
		// DBCP(DataBase ConnectionPool) 프로그램 이용 => 웹 서버에 저장
		// 1. META-INF context.xml파일 만들기(1, 2단계 디비 연결 이름으로 저장)
		// 2. DAO => 연결된 정보의 이름을 가져아서 사용
		// => 속도가 빨라짐, 디비 정보 수정을 한군데 context.xml하면 모든 DAO변경
		
		Context init=new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		
		return con;

		
	}
	
	
	
	public void dbClose() {
		if(rs!=null) {try{pstmt.close();} catch(Exception e2) {}}
		if(pstmt!=null) {try {con.close();} catch(Exception e2) {}}
		if(con!=null) {try{pstmt.close();} catch(Exception e2) {}}
	}
	
	public void insertMember(MemberDTO memberDTO) {
		try {
			con = getConnection();
			sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPass());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setTimestamp(4, memberDTO.getDate());
			pstmt.setString(5, memberDTO.getEmail());
			pstmt.setString(6, memberDTO.getAddress());
			pstmt.setString(7, memberDTO.getPhone());
			pstmt.setString(8, memberDTO.getMobile());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO memberDTO = null;
		try {
			
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setAddress(rs.getString("address"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setMobile(rs.getString("mobile"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
		return memberDTO;
	}
	
	
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null;
		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				memberDTO = new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setAddress(rs.getString("address"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setMobile(rs.getString("mobile"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return memberDTO;
	}
	
	public void updateMember(MemberDTO updateDTO) {
		try {
			con = getConnection();
			sql = "UPDATE member SET name=?, email=?, address=?, phone=?, mobile=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, updateDTO.getName());
			pstmt.setString(2, updateDTO.getEmail());
			pstmt.setString(3, updateDTO.getAddress());
			pstmt.setString(4, updateDTO.getPhone());
			pstmt.setString(5, updateDTO.getMobile());
			pstmt.setString(6, updateDTO.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
