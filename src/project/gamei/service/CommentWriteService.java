package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.Board_CommentDao;
import project.gamei.dto.Board_CommentDto;

public class CommentWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String mid = request.getParameter("mid");
		String bctext = request.getParameter("bctext");
		String bcip = request.getRemoteAddr();
		Board_CommentDao bcDao = Board_CommentDao.getInstance();
		Board_CommentDto dto = new Board_CommentDto(mid, bctext, bcip);		
		int result = bcDao.writeComment(bno, dto);
		if (result == Board_CommentDao.SUCCESS) {
			request.setAttribute("commentWriteResult", "댓글 작성 완료");			
		} else {
			request.setAttribute("commentWriteResult", "댓글 작성 실패, 댓글 길이를 확인해주세요");
		}
	}
}
