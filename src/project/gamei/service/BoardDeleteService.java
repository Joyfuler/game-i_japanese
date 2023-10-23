package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);		
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.deleteBoard(bno);
		if (result == BoardDao.SUCCESS) {
			request.setAttribute("boardDeleteResult", "글 삭제 성공");			
		} else {
			request.setAttribute("boardDeleteResult", "글 삭제 실패");
		}

	}

}
