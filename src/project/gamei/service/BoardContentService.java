package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		String bnoStr = request.getParameter("bno");
		int bno = 0;
		if (bnoStr != null){
			bno = Integer.parseInt(bnoStr);			
		}
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("boardContent", bDao.getBoardContent(gid, bno));
	}

}
