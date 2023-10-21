package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.GameDao;

public class boardListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String gid = request.getParameter("gid");
		if (pageNum == null) {
//			if (request.getAttribute("pageNum") != null ) {
//				pageNum = (String) request.getAttribute("pageNum");
//			} else {
				pageNum = "1";
//			}
		}
		
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10; // 페이지 별 게시글 갯수
		final int BLOCKSIZE = 5;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		// 게임 정보 출력을 위해 게임 gid를 받아 dto를 가져감.
		GameDao gDao = GameDao.getInstance();
		gDao.gameViewUp(gid);
		request.setAttribute("gameInfo", gDao.getGameInfo(gid));
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("boardList", bDao.listBoard(gid, startRow, endRow));		
		int totCnt = bDao.boardCntByGid(gid);
		int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
		int startPage = ((currentPage -1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt) { // 총 15페이지밖에 없는데 20페이지를 표시 x, 15페이지까지만 표시하게
			endPage = pageCnt;
		}
		request.setAttribute("gid", gid);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE); // '이전' 을 출력할지를 확인 필요 (startPage가 BLOCKSIZE보다 크다면)
		request.setAttribute("startPage", startPage); // 시작과 마지막 페이지도 전달.
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", currentPage); // 현재 페이지에서 a태그를 빼는 용도로 사용.
		request.setAttribute("pageCnt", pageCnt); // '다음을 출력할지 확인 필요 (endPage가 pageCnt보다 작다면)
	}		
}

