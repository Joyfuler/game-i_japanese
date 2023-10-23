package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.Board_CommentDao;
import project.gamei.dto.Board_CommentDto;

public class CommentReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bcno = Integer.parseInt(request.getParameter("bcno"));		
		String bctext = request.getParameter("bctext");
		String bcip = request.getRemoteAddr();
		String bcgroupStr = request.getParameter("bcgroup");
		int bcgroup =0; int bcstep = 0; int bcindent = 0;
		if (bcgroupStr != null) {
			bcgroup = Integer.parseInt(bcgroupStr);
		}
		String bcstepStr = request.getParameter("bcindent");
		if (bcstepStr != null) {
			bcstep = Integer.parseInt(bcstepStr);
		}
		String bcindentStr = request.getParameter("bcindent");
		if (bcindentStr != null) {
			bcindent = Integer.parseInt(bcindentStr);
		}
		
		String mid = request.getParameter("mid");
		Board_CommentDao bcDao = new Board_CommentDao();
		Board_CommentDto dto = new Board_CommentDto(bctext, bcip, bcgroup, bcstep, bcindent, mid);
		int result = bcDao.replyComment(bno, dto);
	}

}
