package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.Board_CommentDao;
import project.gamei.dto.Board_CommentDto;

public class CommentReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		// 원본의 댓글 정보를 가져온다.
		int bcno = Integer.parseInt(request.getParameter("bcno"));		
		Board_CommentDao bcDao = Board_CommentDao.getInstance();
		int bcgroup = bcDao.getOriginReplyInfo(bcno).getBcgroup();
		int bcstep = bcDao.getOriginReplyInfo(bcno).getBcstep();
		int bcindent = bcDao.getOriginReplyInfo(bcno).getBcindent();
		// 이하 댓글을 작성한 회원 정보 및 댓글 정보.
		String mid = request.getParameter("mid");
		String bctext = request.getParameter("bctext");
		String bcip = request.getRemoteAddr();		
		Board_CommentDto dto = new Board_CommentDto(bctext, bcip, bcgroup, bcstep, bcindent, mid);
		int result = bcDao.replyComment(bno, dto);
		if (result == Board_CommentDao.SUCCESS) {
			request.setAttribute("commentReplyResult", "댓글 작성이 완료되었습니다");
		} else {
			request.setAttribute("commentReplyResult", "댓글 작성 실패");
		}
	}
}
