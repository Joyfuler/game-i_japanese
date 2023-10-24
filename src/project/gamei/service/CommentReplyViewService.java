package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.Board_CommentDao;

public class CommentReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bcno = Integer.parseInt(request.getParameter("bcno"));		
		request.setAttribute("bno", bno);
		request.setAttribute("bcno", bcno);		
	}
}
