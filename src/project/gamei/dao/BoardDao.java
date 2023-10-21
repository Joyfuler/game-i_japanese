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

public class BoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds;
	private static BoardDao INSTANCE = new BoardDao();

	public static BoardDao getInstance() {
		return INSTANCE;
	}

	public BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}

	// (1) 특정 gid의 게시글 목록을 출력함. 회원의 닉네임과 프로필사진, 레벨 정보 포함하고 게임명 / 게임아이콘을 포함해야 함. 페이징 처리 - 게시글은 10개씩.
	public ArrayList<BoardDto> listBoard(String gid, int startRow, int endRow) {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.*" + 
				"				FROM (SELECT G.GNAME, G.GICON, M.MNICKNAME, M.MPHOTO, M.MLEVEL, M.MEMAIL" + 
				"				, B.* FROM MEMBER M, BOARD B, GAME G"+ 
				"				WHERE B.MID=M.MID AND B.GID=G.GID AND G.GID = ? ORDER BY BRDATE DESC) A)" + 
				"				WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {				
				String gname = rs.getString("gname");
				String gicon = rs.getString("gicon");
				String mnickname = rs.getString("mnickname");
				String mphoto = rs.getString("mphoto");
				int mlevel = rs.getInt("mlevel");
				String memail = rs.getString("memail");				
				int bno = rs.getInt("bno");				
				String btitle = rs.getString("btitle");				
				String bcontent = rs.getString("bcontent");				
				Timestamp brdate = rs.getTimestamp("brdate");				
				String bimg = rs.getString("bimg");				
				String bip = rs.getString("bip");	
				int bgroup = rs.getInt("bgroup");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");
				int bhit = rs.getInt("bhit");
				String mid = rs.getString("mid");								
				list.add(new BoardDto(gname, gicon, bno, btitle, bcontent, brdate, bimg, bip, bgroup, bstep, bindent, bhit, gid, mid, mphoto, mnickname, mlevel, memail));				
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
	
	// (1) 특정 gid의 게시글의 총 숫자가 몇 개인지를 셈. 페이징을 위한 count
	public int boardCntByGid(String gid) {
		int boardCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM BOARD WHERE GID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			rs = pstmt.executeQuery();			
			rs.next();
			boardCnt = rs.getInt("CNT");
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
		return boardCnt;
	}
	
	// (2) 특정 게시판에 원글을 작성.
	public int writeBoard(String gid, String mid, BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD "
				+ "(BNO, BTITLE, BCONTENT, BIMG, BGROUP, BSTEP, BINDENT, GID, MID, BIP) " 
				+ "VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, BOARD_SEQ.CURRVAL, 0, 0, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());			
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBimg());
			pstmt.setString(4, gid);
			pstmt.setString(5, mid);
			pstmt.setString(6, dto.getBip());
			result = pstmt.executeUpdate();
			System.out.println(gid + "게시판에 글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + gid + "게시판에 글쓰기 실패 - " + dto);
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
