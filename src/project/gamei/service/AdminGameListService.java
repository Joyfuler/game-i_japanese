package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class AdminGameListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원 리스트 서비스에서도 동일한 패러미터를 전달하니 setAttribute시 주의할 것
		GameDao gDao = GameDao.getInstance();
		String pageNum = request.getParameter("pageNum");		
		if (pageNum == null) {			
				pageNum = "1";			
		}
		int gameCurrentPage = Integer.parseInt(pageNum);
		final int GAMEPAGESIZE = 5; // 페이지 별 게시글 갯수
		final int GAMEBLOCKSIZE = 5;
		int startRow = (gameCurrentPage - 1) * GAMEPAGESIZE + 1;
		int endRow = startRow + GAMEPAGESIZE - 1;		
		request.setAttribute("gameList", gDao.gameListSortByDate(startRow, endRow));
		int gameTotCnt = gDao.getQueryGameCnt("");
		int gamePageCnt = (int) Math.ceil((double) gameTotCnt / GAMEPAGESIZE);		
		request.setAttribute("gamePageCnt", gamePageCnt);
		int gameStartPage = ((gameCurrentPage -1) / GAMEBLOCKSIZE) * GAMEBLOCKSIZE + 1;
		int gameEndPage = gameStartPage + GAMEBLOCKSIZE - 1;
		if (gameEndPage > gamePageCnt) {
			gameEndPage = gamePageCnt;
		}		
		request.setAttribute("gameTotCnt", gameTotCnt);		
		request.setAttribute("gamePageCnt", gamePageCnt);
		request.setAttribute("gameCurrentPage", gameCurrentPage);
		request.setAttribute("gameStartPage", gameStartPage);
		request.setAttribute("gameEndPage", gameEndPage);
		request.setAttribute("GAMEBLOCKSIZE", GAMEBLOCKSIZE);
		request.setAttribute("GAMEPAGESIZE", GAMEPAGESIZE);		
	}
}
