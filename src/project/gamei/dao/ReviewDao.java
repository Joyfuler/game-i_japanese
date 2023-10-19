package project.gamei.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import project.gamei.dto.ReviewDto;

public class ReviewDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;	
	private DataSource ds;
	private static ReviewDao INSTANCE = new ReviewDao();
	
	public static ReviewDao getInstance() {
		return INSTANCE;
	}

	public ReviewDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// review.jsp에서 출력되는 순서대로 입력함.
	// (1) 평점을 남긴 총 인원수와 각 별점별 인원수를 출력하는 용도.
	public ReviewDto getScoreByGid(String gid) {
		ReviewDto scoreInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT" + 
				"    (SELECT COUNT(*) FROM REVIEW WHERE GID = ?) ALLCOUNT," + 
				"    (SELECT COUNT(*) FROM REVIEW WHERE GID = ? AND RSCORE = 1) SCORE1," + 
				"    (SELECT COUNT(*) FROM REVIEW WHERE GID = ? AND RSCORE = 2) SCORE2," + 
				"    (SELECT COUNT(*) FROM REVIEW WHERE GID = ? AND RSCORE = 3) SCORE3," + 
				"    (SELECT COUNT(*) FROM REVIEW WHERE GID = ? AND RSCORE = 4) SCORE4," + 
				"    (SELECT COUNT(*) FROM REVIEW WHERE GID = ? AND RSCORE = 5) SCORE5" + 
				"    FROM DUAL";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, gid);
			pstmt.setString(2, gid);
			pstmt.setString(3, gid);
			pstmt.setString(4, gid);
			pstmt.setString(5, gid);
			pstmt.setString(6, gid);		
			rs = pstmt.executeQuery();
			if (rs.next()) {			
				int allCount = rs.getInt("allcount");
				int score1 = rs.getInt("score1");
				int score2 = rs.getInt("score2");
				int score3 = rs.getInt("score3");
				int score4 = rs.getInt("score4");
				int score5 = rs.getInt("score5");								
				scoreInfo = new ReviewDto(allCount, score1, score2, score3, score4, score5);
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
		return scoreInfo;
	}
	
	// (2) 특정 gid의 리뷰 목록을 출력한다. 한 페이지당 5개씩 출력되며 유저의 정렬순 입력에 따라 정렬방식이 달라짐.
	public ArrayList<ReviewDto> reviewListSortByScore(String gid, int startRow, int endRow){
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM "
				+ "(SELECT R.*, M.MPHOTO, M.MNICKNAME FROM REVIEW R, MEMBER M "
				+ "WHERE M.MID = R.MID AND GID = ? ORDER BY RSCORE DESC) A) WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, gid);			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				int rid = rs.getInt("rid");
				int rscore = rs.getInt("rscore");
				String rtext = rs.getString("rtext");
				String mid = rs.getString("mid");				
				String mphoto = rs.getString("mphoto");
				String mnickname = rs.getString("mnickname");
				Timestamp rrdate = rs.getTimestamp("rrdate");				
				list.add(new ReviewDto(rid, rscore, rtext, mid, mphoto, mnickname, gid, rrdate));
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
		return list;
	}
	
	// (2) 특정 gid의 리뷰 목록을 출력한다. 한 페이지당 5개씩 출력되며 유저의 정렬순 입력에 따라 정렬방식이 달라짐.
	public ArrayList<ReviewDto> reviewListSortByDate(String gid, int startRow, int endRow){
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM "
				+ "(SELECT R.*, M.MPHOTO, M.MNICKNAME FROM REVIEW R, MEMBER M "
				+ "WHERE M.MID = R.MID AND GID = ? ORDER BY RRDATE DESC) A) WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, gid);			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				int rid = rs.getInt("rid");
				int rscore = rs.getInt("rscore");
				String rtext = rs.getString("rtext");
				String mid = rs.getString("mid");				
				String mphoto = rs.getString("mphoto");
				String mnickname = rs.getString("mnickname");
				Timestamp rrdate = rs.getTimestamp("rrdate");				
				list.add(new ReviewDto(rid, rscore, rtext, mid, mphoto, mnickname, gid, rrdate));
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
		return list;
	}
	
	
	
	// (3) 리뷰를 등록
	public int writeReview(ReviewDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;		
		String sql = "INSERT INTO REVIEW (RID, RSCORE, RTEXT, MID, GID)" + 
				" VALUES (REVIEW_SEQ.NEXTVAL, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, dto.getRscore());
			pstmt.setString(2, dto.getRtext());
			pstmt.setString(3, dto.getMid());
			pstmt.setString(4, dto.getGid());			
			result = pstmt.executeUpdate();
			System.out.println(dto.getMid() + "의 리뷰가 등록됨");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + dto);			
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
	
	// (4) 해당 리뷰아이디로 리뷰를 삭제
	public int deleteReview(int rid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;		
		String sql = "DELETE FROM REVIEW WHERE RID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, rid);						
			result = pstmt.executeUpdate();
			System.out.println(rid + "번 리뷰 삭제");
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
