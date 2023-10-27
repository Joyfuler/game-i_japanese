package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.Board_CommentDao;
import project.gamei.dao.GameDao;

public class BoardListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String gid = request.getParameter("gid");
		if(gid==null) {
			gid = (String)request.getAttribute("gid");
		}
		if (pageNum == null) {
			pageNum = "1";
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
		// 검색한 데이터가 있는지를 확인하고 없다면 일반 리스트를, 없다면 검색 리스트를 출력.
		int totCnt = 0;
		String query = request.getParameter("query");
		String searchWord = request.getParameter("searchWord");		
		if (query != null && query.equals("btitle")) {
			request.setAttribute("boardList", bDao.listBoardBySearchTitle(searchWord, gid, startRow, endRow));
			totCnt = bDao.boardCntByGidSearchByTitle(searchWord, gid);
		} else if (query != null && query.equals("mname")) {
			request.setAttribute("boardList", bDao.listBoardBySearchWriter(searchWord, gid, startRow, endRow));
			totCnt = bDao.boardCntByGidSearchByWriter(searchWord, gid);
		} else {		
			request.setAttribute("boardList", bDao.listBoard(gid, startRow, endRow));		
			totCnt = bDao.boardCntByGid(gid);
		}		
			int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
			int startPage = ((currentPage -1) / BLOCKSIZE) * BLOCKSIZE + 1;
			int endPage = startPage + BLOCKSIZE - 1;
			if (endPage > pageCnt) { // 총 15페이지밖에 없는데 20페이지를 표시 x, 15페이지까지만 표시하게
				endPage = pageCnt;
			}			
			// 공지사항 게시판을 제외한 모든 게시판에, 공지사항 게시글의 상위 2개를 출력시킴.
			request.setAttribute("noticeList", bDao.listBoard("notice", 1, 2));
			
			request.setAttribute("gid", gid);
			request.setAttribute("BLOCKSIZE", BLOCKSIZE); 
			request.setAttribute("startPage", startPage); 
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageNum", currentPage); 
			request.setAttribute("pageCnt", pageCnt);
		}	
}

