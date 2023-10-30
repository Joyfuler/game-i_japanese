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
import project.gamei.dto.ReportDto;

public class ReportDao {
	public final static int SUCCESS = 1;
	public final static int FAIL = 0;
	private DataSource ds;
	private static ReportDao INSTANCE = new ReportDao();
	
	public static ReportDao getInstance() {
		return INSTANCE;
	}
	
	public ReportDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}	
	
	// 1. 게시글 신고하기.
	public int reportBoard(int rreason, String mid, int bno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REPORT (RNO, RREASON, MID, BNO) " + 
				"VALUES (REPORT_SEQ.NEXTVAL, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rreason);			
			pstmt.setString(2, mid);
			pstmt.setInt(3, bno);	
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
	
	// 신고된 게시글 리스트를 출력	
	public ArrayList<ReportDto> getReportList() {
		ArrayList<ReportDto> list = new ArrayList<ReportDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT BOARD.*, MEMBER.MID, MEMBER.MNICKNAME, REPORT.RNO, "
				+ "REPORT.RREASON, REPORT.MID AS REPORTERMID, REPORT.REPORTDATE FROM "
				+ "BOARD, MEMBER, REPORT WHERE BOARD.BNO = REPORT.BNO AND MEMBER.MID = REPORT.MID "
				+ "ORDER BY REPORTDATE DESC"; 
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Date brdate = rs.getDate("brdate");
				String mid = rs.getString("mid");
				String mnickname = rs.getString("mnickname");
				int rno = rs.getInt("rno");
				int rreason = rs.getInt("rreason");
				String reportermid = rs.getString("reportermid");
				Timestamp reportdate = rs.getTimestamp("reportdate");
				String gid = rs.getString("gid");
				list.add(new ReportDto(rno, rreason, mid, mnickname, bno, btitle, bcontent, brdate, reportermid, reportdate, gid));
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
	
	// 신고글 삭제 시 자식 RECORD 삭제
	public int deleteReport(int bno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM REPORT WHERE BNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
