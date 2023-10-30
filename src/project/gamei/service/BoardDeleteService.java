package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.Board_CommentDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);	
		// 게시글을 지우기 전에, 해당 게시글의 child record인 댓글도 함께 지워야 함.
		Board_CommentDao bcDao = Board_CommentDao.getInstance();
		bcDao.deleteAllComment(bno);
		System.out.println(bno + "의 모든 댓글 삭제 완료");
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.deleteBoard(bno);
		if (result == BoardDao.SUCCESS) {
			request.setAttribute("boardDeleteResult", "글 삭제 성공");			
		} else {
			request.setAttribute("boardDeleteResult", "글 삭제 실패");
		}

	}

}
