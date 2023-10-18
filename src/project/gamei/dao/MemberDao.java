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

import project.gamei.dto.MemberDto;

public class MemberDao {
	private final int SUCCESS = 1;
	private final int FAIL = 0;
	private final int EXISTENT = 1;
	private final int NONEXISTENT = 0;
	private DataSource ds;
	private static MemberDao INSTANCE = new MemberDao();

	public static MemberDao getInstance() {
		return INSTANCE;
	}

	public MemberDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}

	// (1) 회원 mid 중복체크 - 있으면 EXISTENT 리턴, 없으면 NONEXISTENT 리턴
	public int midConfirm(String mid) {
		int result = EXISTENT; // 이미 있는 경우가 최악의 상황.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM MEMBER WHERE MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt("CNT") == 0) {
				result = NONEXISTENT;
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
		return result;
	}

	// (2)회원가입
	public int joinMember(MemberDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (MID, MNICKNAME, MPW, MEMAIL, MPHONE, MPHOTO, MQUEST, MANSWER) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMnickname());
			pstmt.setString(3, dto.getMpw());
			pstmt.setString(4, dto.getMemail());
			pstmt.setString(5, dto.getMphone());
			pstmt.setString(6, dto.getMphoto());
			pstmt.setInt(7, dto.getMquest());
			pstmt.setString(8, dto.getManswer());
			result = pstmt.executeUpdate();
			System.out.println(dto.getMid() + "가입완료");
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

	// 3. 로그인
	public int loginCheck(String mid, String mpw) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MID = ? AND MPW= ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = SUCCESS;
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
		return result;
	}

	// (4) mid로 dto 가져오기
	public MemberDto getMember(String mid) {
		MemberDto member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mpw = rs.getString("mpw");
				String mnickname = rs.getString("mnickname");
				String memail = rs.getString("memail");
				String mphone = rs.getString("mphone");
				String mphoto = rs.getString("mphoto");
				int mquest = rs.getInt("mquest");
				String manswer = rs.getString("manswer");
				int mlevel = rs.getInt("mlevel");
				Timestamp mrdate = rs.getTimestamp("mrdate");
				member = new MemberDto(mid, mnickname, mpw, memail, mphone, mphoto, mquest, manswer, mlevel, mrdate);
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
		return member;
	}

	// 5. 회원정보수정
	public int modifyMember(MemberDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET MNICKNAME=?, MPW=?, MEMAIL=?, MPHONE=?, "
				+ "MPHOTO=?, MQUEST=?, MANSWER=? WHERE MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMnickname());
			pstmt.setString(2, dto.getMpw());
			pstmt.setString(3, dto.getMemail());
			pstmt.setString(4, dto.getMphone());
			pstmt.setString(5, dto.getMphoto());
			pstmt.setInt(6, dto.getMquest());
			pstmt.setString(7, dto.getManswer());
			pstmt.setString(8, dto.getMid());
			result = pstmt.executeUpdate();
			System.out.println(dto.getMid() + "수정완료");
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

	// (6) 회원 리스트 출력 (관리자모드 출력용)
	public ArrayList<MemberDto> getMemberList(int startRow, int endRow) {
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM "
				+ "(SELECT * FROM MEMBER ORDER BY MRDATE) A) WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String mid = rs.getString("mid");
				String mpw = rs.getString("mpw");
				String mnickname = rs.getString("mnickname");
				String memail = rs.getString("memail");
				String mphone = rs.getString("mphone");
				String mphoto = rs.getString("mphoto");
				int mquest = rs.getInt("mquest");
				String manswer = rs.getString("manswer");
				int mlevel = rs.getInt("mlevel");
				Timestamp mrdate = rs.getTimestamp("mrdate");
				members.add(
						new MemberDto(mid, mnickname, mpw, memail, mphone, mphoto, mquest, manswer, mlevel, mrdate));
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
		return members;
	}

	// (7) 회원수 (관리자모드 회원리스트 출력용)
	public int getMemberTotCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM MEMBER";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt("CNT");
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
		return totCnt;
	}
	
	public int withdrawalMember(String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;		
		String sql = "UPDATE MEMBER SET MLEVEL=-1 WHERE MID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, mid);			
			result = pstmt.executeUpdate();
			System.out.println(mid + "회원을 탈퇴회원 등급으로 변경");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + mid);			
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
