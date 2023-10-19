package project.gamei.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;
import project.gamei.dao.ReviewDao;

public class ReviewListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 게임 데이터 및 해당 평점 데이터. 
		String gid = request.getParameter("gid");
		if (gid == null || gid.isEmpty()) {
			try {
				response.sendRedirect("index.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("gameData", gDao.getGameInfo(gid));
		
		// 해당 gid의 review를 count하여 뿌린다.
		ReviewDao rDao = ReviewDao.getInstance();
		request.setAttribute("scoreCount", rDao.getScoreByGid(gid));		
		
		// 리뷰 리스트를 출력한다. 한 페이지당 5개까지 출력하고 페이징 처리함.
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.isEmpty()) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5;
		final int BLOCKSIZE = 3;		
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;
		String sortBy = request.getParameter("sortBy");
		if (sortBy == null || sortBy.isEmpty() || sortBy.equals("new")) {			
			request.setAttribute("reviewList", rDao.reviewListSortByDate(gid, startRow, endRow));			
		} else if (sortBy.equals("score")) {
			request.setAttribute("reviewList", rDao.reviewListSortByScore(gid, startRow, endRow));			
		}
		request.setAttribute("sortBy", sortBy);
		int allReviewCnt = rDao.getScoreByGid(gid).getAllCount();
		int pageCnt = (int)Math.ceil((double)allReviewCnt/PAGESIZE);
		int startPage = ((currentPage -1)/BLOCKSIZE)*BLOCKSIZE +1;
		int endPage = startPage + BLOCKSIZE -1;
		if (endPage >pageCnt) {
			endPage = pageCnt;
		}		
		request.setAttribute("PAGESIZE", PAGESIZE);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("pageNum", currentPage);		
	}

}
