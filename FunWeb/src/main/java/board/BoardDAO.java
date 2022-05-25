package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	
	public Connection getConnection() throws Exception {
		
//		Class.forName("com.mysql.jdbc.Driver");
//					
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb3";
//		String dbUser="root";
//		String dbPass="1234";
//		con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
		 
//		return con;
		Context init = new InitialContext();

		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		
		return con;
	}
	
	public void dbClose() {
		if(rs!=null) {try{pstmt.close();} catch(Exception e2) {}}
		if(pstmt!=null) {try {con.close();} catch(Exception e2) {}}
		if(con!=null) {try{pstmt.close();} catch(Exception e2) {}}
	}
	
	public List<BoardDTO> getBoardList(int startRow, int pageSize){
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			con = getConnection();
//			sql = "SELECT * FROM board ORDER BY num desc";

			// mysql만 사용 가능(oracle은 subquery 사용해야함)
			
//			sql = "SELECT * FROM board ORDER BY num desc limit 시작행번호 -1, 몇 개 가져올지";
			sql = "SELECT * FROM board ORDER BY num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setDate(rs.getTimestamp("date"));
				
				boardList.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return boardList;
	}
	
	public BoardDTO getBoard(int num) {
		BoardDTO boardDTO = null; // n번 글이 없을 경우 -> null 리턴
		
		try {
			con = getConnection();
			sql = "SELECT * FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				boardDTO = new BoardDTO();
				
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setDate(rs.getTimestamp("date"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				// 첨부파일
				boardDTO.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return boardDTO;
		
	}
	
	public void insertBoard(BoardDTO boardDTO) {
		try {
			con = getConnection();
			int num = 0;
			sql = "SELECT MAX(num) FROM board ORDER BY num desc";
			pstmt =  con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) { num = rs.getInt("MAX(num)") + 1; }
			
			sql = "INSERT INTO board VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getPass());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.setInt(6, boardDTO.getReadcount());
			pstmt.setTimestamp(7, boardDTO.getDate());
			// 첨부파일
			pstmt.setString(8, boardDTO.getFile());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public void updateBoard(BoardDTO boardDTO) {
		try {
			con = getConnection();
			sql = "UPDATE board SET subject=?, content=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getSubject());
			pstmt.setString(2, boardDTO.getContent());
			pstmt.setInt(3, boardDTO.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public void fupdateBoard(BoardDTO boardDTO) {
		try {
			con = getConnection();
			sql = "UPDATE board SET subject=?, content=?, file=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getSubject());
			pstmt.setString(2, boardDTO.getContent());
			pstmt.setString(3, boardDTO.getFile());
			pstmt.setInt(4, boardDTO.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	
	public void deleteBoard(int num) {
		try {
			con = getConnection();
			sql = "DELETE FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public int getBoardCount() {
		int count = 0;
		try {
			con = getConnection();
			sql = "SELECT COUNT(*) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("COUNT(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return count;
	}
	
	public void updateReadcount(int num) {
		try {
			con = getConnection();
			sql="UPDATE board SET readcount = readcount+1 WHERE num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}
}
