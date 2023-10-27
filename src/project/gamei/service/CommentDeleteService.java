package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.Board_CommentDao;

public class CommentDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		String bno = request.getParameter("bno");
		String bcnoStr = request.getParameter("bcno");
		int bcno = 0;
		if (bcnoStr != null) {
			bcno = Integer.parseInt(bcnoStr);
		}		
		Board_CommentDao bcDao = Board_CommentDao.getInstance();
		int result = bcDao.deleteComment(bcno);		
		if (result == Board_CommentDao.SUCCESS) {
			request.setAttribute("commentDeleteResult", "댓글이 삭제되었습니다.");
		} else {
			request.setAttribute("commentDeleteResult", "댓글 삭제 실패");
		}
		request.setAttribute("gid", gid);
		request.setAttribute("bno", bno);
	}
}
