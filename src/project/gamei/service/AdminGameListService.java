package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class AdminGameListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원 리스트 서비스에서도 totCnt, pageCnt를 전달하니 setAttribute시 주의할 것
		GameDao gDao = GameDao.getInstance();
		String pageNum = request.getParameter("pageNum");		
		if (pageNum == null) {			
				pageNum = "1";			
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5; // 페이지 별 게시글 갯수
		final int BLOCKSIZE = 5;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;		
		request.setAttribute("gameList", gDao.gameListSortByDate(startRow, endRow));
		int gameTotCnt = gDao.getQueryGameCnt("");
		int gamePageCnt = (int) Math.ceil((double) gameTotCnt / PAGESIZE);
		
		request.setAttribute("gamePageCnt", gamePageCnt);
		int startPage = ((currentPage -1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > gamePageCnt) {
			endPage = gamePageCnt;
		}		
		request.setAttribute("gameTotCnt", gameTotCnt);		
		request.setAttribute("gamePageCnt", gamePageCnt);			
	}
}
