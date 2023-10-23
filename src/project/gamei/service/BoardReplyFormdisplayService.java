package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.GameDao;

public class BoardReplyFormdisplayService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		String bnoStr = request.getParameter("bno");
		int bno = Integer.parseInt(bnoStr);
		GameDao gDao = GameDao.getInstance();
		BoardDao bDao = BoardDao.getInstance();
		// 표시될 게임의 정보
		request.setAttribute("replyFormInfo", gDao.getGameInfo(gid));
		// 원본의 게시글 데이터를 가져와서 re: 형식으로 타이틀에 입력. 또한 bgroup 지정을 위해서도 필요.
		request.setAttribute("originInfo", bDao.getBoardContent(gid, bno));
	}

}
