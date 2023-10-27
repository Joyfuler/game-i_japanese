package project.gamei.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import project.gamei.dto.SearchWordDto;

public class SearchWordDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds;
	private static SearchWordDao INSTANCE = new SearchWordDao();	
	
	public static SearchWordDao getInstance() {
		return INSTANCE;
	}
	
	public SearchWordDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// (1) 검색바에 등록될 리스트를 출력. 관리자 모드 확인용, 최대 4개까지
	public ArrayList<SearchWordDto> getSearchWordList(){
		ArrayList<SearchWordDto> lists = new ArrayList<SearchWordDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM SEARCHWORD WHERE ROWNUM BETWEEN 1 AND 4";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				int sid = rs.getInt("sid");
				String sintro = rs.getString("sintro");
				String sword = rs.getString("sword");				
				lists.add(new SearchWordDto(sid, sintro, sword));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}	
		return lists;
	}
	
	// (2) 메인 상단에 보일 검색어. 보이는 문구는 랜덤으로 변경됨. (sid에 math.random 사용)
	public SearchWordDto randomSearchWord(int sid) {
		SearchWordDto word = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM SEARCHWORD WHERE SID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String sintro = rs.getString("sintro");
				String sword = rs.getString("sword");				
				word = new SearchWordDto(sid, sintro, sword);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}			
		return word;
	}
	
	// (3) 관리자 모드에서 검색어 데이터를 업데이트.
	public int modifySearchWord(int sid, String sintro, String sword) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE SEARCHWORD SET SINTRO = ?, SWORD = ? WHERE SID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sintro);
			pstmt.setString(2, sword);
			pstmt.setInt(3, sid);
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {				
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}				
		return result;
	}
}
