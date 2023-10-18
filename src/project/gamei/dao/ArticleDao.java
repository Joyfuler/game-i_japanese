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

import project.gamei.dto.ArticleDto;

public class ArticleDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds;
	private static ArticleDao INSTANCE = new ArticleDao();	
	
	public static ArticleDao getInstance() {
		return INSTANCE;
	}
	
	public ArticleDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 1. 상단에 기사 리스트 출력
	public ArrayList<ArticleDto> getArticle(){
		ArrayList<ArticleDto> lists = new ArrayList<ArticleDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ARTICLE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				int artid = rs.getInt("artid");
				String img1 = rs.getString("img1");
				String link1 = rs.getString("link1");				
				lists.add(new ArticleDto(artid, img1, link1));
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
	
	// 2. 상단 기사 리스트 변경
	
}
