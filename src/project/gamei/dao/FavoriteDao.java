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

import project.gamei.dto.BoardDto;
import project.gamei.dto.FavoriteDto;

public class FavoriteDao {
	public final static int SUCCESS = 1;
	public final static int FAIL = 0;
	private DataSource ds;
	private static FavoriteDao INSTANCE = new FavoriteDao();

	public static FavoriteDao getInstance() {
		return INSTANCE;
	}

	public FavoriteDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}

	// 1) 특정 멤버의 즐겨찾기 목록을 출력. 게임 정보에는 게임 이름과 게임 아이콘이 함께 필요함.
	public ArrayList<FavoriteDto> getFavoriteList(String mid) {
		ArrayList<FavoriteDto> list = new ArrayList<FavoriteDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT F.*, G.GNAME, G.GICON, G.GGENRE " + "FROM FAVORITE F, GAME G "
				+ "WHERE F.GID = G.GID AND MID = ? ORDER BY F.FRDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int fid = rs.getInt("fid");
				Timestamp frdate = rs.getTimestamp("frdate");
				String gid = rs.getString("gid");
				String gname = rs.getString("gname");
				String gicon = rs.getString("gicon");
				String ggenre = rs.getString("ggenre");
				list.add(new FavoriteDto(fid, frdate, gid, mid, gname, gicon, ggenre));
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

	// 2) 특정 멤버가 즐겨찾기 목록을 추가할 때의 메소드.
	public int insertFavorite(String gid, String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FAVORITE (FID, FRDATE, GID, MID) " + "VALUES (FAVORITE_SEQ.NEXTVAL, SYSDATE, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			pstmt.setString(2, mid);
			result = pstmt.executeUpdate();
			System.out.println(mid + " 회원이 " + gid + " 게시판 즐겨찾기 완료");
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

	// 3) 특정 멤버가 즐겨찾기 목록을 삭제할 때의 메소드.
	public int deleteFavorite(String gid, String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM FAVORITE WHERE GID = ? AND MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			pstmt.setString(2, mid);
			result = pstmt.executeUpdate();
			System.out.println(mid + " 회원이 " + gid + " 게시판 즐겨찾기 삭제함");
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

	// 4) 즐겨찾기를 추가할지, 삭제할지 나누기 위해 해당 회원 + 게시판 즐겨찾기 여부 확인작업.
	public int favoriteConfirm(String gid, String mid) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM FAVORITE WHERE GID = ? AND MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
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
		return count;
	}

	// 5) 현재 등록된 즐겨찾기가 몇 개인지를 확인하는 메소드.
	public int countFavoriteList(String mid) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM FAVORITE " + "WHERE MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("CNT");
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
		return count;
	}
}
