package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.Board_CommentDao;
import project.gamei.dao.ReportDao;

public class AdminReportDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = 0;
		String bnoStr = request.getParameter("bno");
		if (bnoStr != null) {
			bno = Integer.parseInt(bnoStr);
		}
		// 게시글을 삭제하기 전, 해당 게시글의 신고 데이터를 먼저 삭제해야 한다.
		ReportDao reDao = ReportDao.getInstance();
		reDao.deleteReport(bno);
		System.out.println(bno + "의 신고글 삭제");		
		
		// 해당 게시글에 있던 댓글도 삭제가 필요함.
		Board_CommentDao bcDao = Board_CommentDao.getInstance();
		bcDao.deleteAllComment(bno);
		System.out.println(bno + "의 모든 댓글 삭제");		
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.deleteBoard(bno);
		if (result == BoardDao.SUCCESS) {
			request.setAttribute("result", "신고된 게시글 삭제완료");
		} else {
			request.setAttribute("result", "신고된 게시글 삭제실패");
		}
	}
}
