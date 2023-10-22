package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class BoardWriteFormDisplayService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 글작성 페이지에서 어떤 게시판인지 정보를 출력 위해 게임 dto를 가져온다. 
		String gid = request.getParameter("gid");
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("writeForminfo", gDao.getGameInfo(gid));		
		// 프로필사진은 session에서 가져올 수 있으므로 여기선 필요하지 않음.
	}
}
