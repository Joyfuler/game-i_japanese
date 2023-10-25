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
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int EXISTENT = 1;
	public static final int NONEXISTENT = 0;
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

	// (2) 회원 이메일 중복체크 메소드
	public int memailConfirm(String memail) {
		int result = EXISTENT; // 이미 있는 경우가 최악의 상황.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM MEMBER WHERE MEMAIL = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memail);
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

	// (3) 회원가입
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

	// (4) 로그인
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

	// (5) mid로 dto 가져오기
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

	// (6) 회원정보수정
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

	// (7) 회원 리스트 출력 (관리자모드 출력용)
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

	// (8) 회원수 (관리자모드 회원리스트 출력용)
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
	
	// (9) 회원 차단 기능. mlevel이 -2가 된 유저는 게시글 / 댓글 작성이 불가능함.
	public int setMemberBlock(int mlevel, String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		if (mlevel == 0) {
		sql = "UPDATE MEMBER SET MLEVEL = -2 WHERE MID = ?";
		} else if (mlevel == -2) {
		sql = "UPDATE MEMBER SET MLEVEL = 0 WHERE MID = ?";	
		}
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);			
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

	// (10) 관리자 등록 / 해제 기능. 들어온 method가 add라면 관리자로, remove라면 일반유저로.
	public int adminSetup(String method, String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		if (method.equals("add")) {
			sql = "UPDATE MEMBER SET MLEVEL = 1 WHERE MID = ?";
		} else {
			sql = "UPDATE MEMBER SET MLEVEL = 0 WHERE MID = ?";
		}
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);			
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

	// (11) 아이디 찾기. mquest / manswer / memail 3개의 값이 필요.

	public String findAccount(int mquest, String manswer, String memail) {
		String accountInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MQUEST = ? " + "AND MANSWER = ? AND MEMAIL = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mquest);
			pstmt.setString(2, manswer);
			pstmt.setString(3, memail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				accountInfo = rs.getString("mid");
			}
		} catch (Exception e) {
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
		return accountInfo;
	}
	
	// (12) 비밀번호 찾기. mid / mquest / manswer / memail 4개의 값이 필요.
	public String findPassword(String mid, int mquest, String manswer, String memail) {
		String accountInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE MID = ? AND MQUEST = ? " + 
		"AND MANSWER = ? AND MEMAIL = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, mquest);
			pstmt.setString(3, manswer);
			pstmt.setString(4, memail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				accountInfo = rs.getString("mpw");
			}
		} catch (Exception e) {
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
		return accountInfo;
	}
	

	// (13) 회원탈퇴
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
