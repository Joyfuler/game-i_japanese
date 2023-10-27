package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.GameDao;

public class BoardModifyFormDisplayService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 게임의 정보와 함께 원글의 정보를 가져와 글제목 / 글내용에 추가해야 함. 필요한 것은 gid, bno
		String gid = request.getParameter("gid");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("modifyFormInfo", gDao.getGameInfo(gid));
		// 원글의 정보를 dto로 가져온다. 이후 수정시 게시글의 게시글의 원본 제목, 내용과 첨부 파일 정보를 출력한다.
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("originInfo", bDao.getBoardContent(gid, bno));		
	}
}
