package project.gamei.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import project.gamei.dto.GameDto;

public class GameDao {
	public static final int EXISTENT = 0;
	public static final int NONEXISTENT = 1;
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds;
	private static GameDao INSTANCE = new GameDao();
	
	public static GameDao getInstance() {
		return INSTANCE;
	}
	
	public GameDao() {
		// ds에 connectionPool에 있는 ds를 할당
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// (1) 현재 GHIT에 등록된 수가 18개인지를 확인하기 위한 메소드. 관리자 페이지에서 상단 리스트 추가할 때 18개 이상이면 등록 제한.
	
	public int ghitCountChk() {
		int ghitCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM GAME WHERE GHIT = 1";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			rs.next();			
			ghitCount = rs.getInt("CNT");			
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
		
		return ghitCount;
	}
	
	// (2) 게임의 총 숫자를 셈. 페이징 처리를 위함
	public int allGameCnt() {
		int allGameCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM GAME";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			rs.next();			
			allGameCnt = rs.getInt("CNT");			
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
		return allGameCnt;
	}
	
	
	// 메인화면의 관리자 추천 게임 리스트 출력 -- 차후 편집 기능 추가 필요
	public ArrayList<GameDto> topGameList(){
		ArrayList<GameDto> lists = new ArrayList<GameDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM GAME WHERE GHIT = 1";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				String gid = rs.getString("gid");
				String gname = rs.getString("gname");
				String ggenre = rs.getString("ggenre");
				String gpub = rs.getString("gpub");
				Date gpdate = rs.getDate("gpdate");
				String gicon = rs.getString("gicon");
				String gdesc = rs.getString("gdesc");
				int ghit = rs.getInt("ghit");				
				lists.add(new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc, ghit));
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
	
	// (4) 게임을 평점이 높은 순서대로 출력. 한 페이지당 5개씩 출력됨.
	public ArrayList<GameDto> gameListSortByScore(int startRow, int endRow){
		ArrayList<GameDto> lists = new ArrayList<GameDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT GAME.*, NVL((SELECT AVG(RSCORE) FROM REVIEW "
				+ "WHERE GID=GAME.GID), 0) AVG FROM GAME ORDER BY AVG DESC) A) WHERE RN BETWEEN ? AND ?";		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				String gid = rs.getString("gid");
				String gname = rs.getString("gname");
				String ggenre = rs.getString("ggenre");
				String gpub = rs.getString("gpub");
				Date gpdate = rs.getDate("gpdate");
				String gicon = rs.getString("gicon");
				String gdesc = rs.getString("gdesc");
				int ghit = rs.getInt("ghit");				
				double avg = rs.getDouble("avg");				
				lists.add(new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc, ghit, avg));
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

	// (5) 게임을 최근 출시 순으로 출력. 한 페이지당 5개씩 출력됨.	
	public ArrayList<GameDto> gameListSortByDate(int startRow, int endRow){
		ArrayList<GameDto> lists = new ArrayList<GameDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT GAME.*, NVL((SELECT AVG(RSCORE) FROM REVIEW "
				+ "WHERE GID=GAME.GID), 0) AVG FROM GAME ORDER BY GPDATE DESC) A) WHERE RN BETWEEN ? AND ?";		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				String gid = rs.getString("gid");
				String gname = rs.getString("gname");
				String ggenre = rs.getString("ggenre");
				String gpub = rs.getString("gpub");
				Date gpdate = rs.getDate("gpdate");
				String gicon = rs.getString("gicon");
				String gdesc = rs.getString("gdesc");
				int ghit = rs.getInt("ghit");				
				double avg = rs.getDouble("avg");				
				lists.add(new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc, ghit, avg));
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
	
	// (5) 특정 게임의 DTO 및 평균 평점을 가져온다.
	public GameDto getGameInfo(String gid) {
		GameDto gameInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT GAME.*, NVL((SELECT AVG(RSCORE) "
				+ "FROM REVIEW WHERE GID=GAME.GID), 0) AVG  "
				+ "FROM GAME WHERE GID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, gid);
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				String gname = rs.getString("gname");
				String ggenre = rs.getString("ggenre");
				String gpub = rs.getString("gpub");
				Date gpdate = rs.getDate("gpdate");
				String gicon = rs.getString("gicon");
				String gdesc = rs.getString("gdesc");
				int ghit = rs.getInt("ghit");				
				double avg = rs.getDouble("avg");
				gameInfo = new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc, ghit, avg);
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
		return gameInfo;
	}
	
	// (6) 특정 게임 리뷰 / 게시판 페이지 입장 시, VIEW 수가 1씩 증가함.
	public void gameViewUp(String gid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE GAME SET GVIEWCOUNT = GVIEWCOUNT +1 WHERE GID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			pstmt.executeUpdate();
			System.out.println(gid + "아이디 게임 view수 +1");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("view +1 실패");
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
	}
	
	// (7) 게임을 View 수 상위 10개까지 출력함. (우측 순위 표시용)
	public ArrayList<GameDto> rightAreaViewTop10() {
		ArrayList<GameDto> lists = new ArrayList<GameDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, G.* FROM GAME G ORDER BY GVIEWCOUNT DESC) WHERE ROWNUM BETWEEN 1 AND 10";		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				String gid = rs.getString("gid");
				String gname = rs.getString("gname");
				String ggenre = rs.getString("ggenre");
				String gpub = rs.getString("gpub");
				Date gpdate = rs.getDate("gpdate");
				String gicon = rs.getString("gicon");
				String gdesc = rs.getString("gdesc");
				int ghit = rs.getInt("ghit");				
				int gviewCount = rs.getInt("gviewCount");				
				lists.add(new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc, ghit, gviewCount));
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
	// 게임을 최근 댓글이 남겨진 순서 top10으로 출력함. (우측 순위 표시용)
	public ArrayList<GameDto> rightAreaNewReview() {
		ArrayList<GameDto> lists = new ArrayList<GameDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM "
				+ "(SELECT G.GID, G.GNAME, G.GPUB, G.GICON, MAX(R.RRDATE) AS MAXDATE "
				+ "FROM GAME G, REVIEW R WHERE G.GID=R.GID "
				+ "GROUP BY G.GID, G.GNAME, G.GPUB, G.GICON ORDER BY MAXDATE DESC) A) "
				+ "WHERE RN BETWEEN 1 AND 10";		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				String gid = rs.getString("gid");
				String gname = rs.getString("gname");				
				String gpub = rs.getString("gpub");
				String gicon = rs.getString("gicon");
				Timestamp maxdate = rs.getTimestamp("maxdate");					
				lists.add(new GameDto(gid, gname, gicon, gpub, maxdate));
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
	
}