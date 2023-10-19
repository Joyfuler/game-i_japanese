package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.ArticleDao;
import project.gamei.dao.GameDao;

public class MainDisplayService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {		
		// 메인 페이지 최상단 18개 리스트를 전달.
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("lists", gDao.topGameList());
		// 메인 페이지 상단 article 영역 사진과 a태그 정보를 전달.		
		ArticleDao aDao = ArticleDao.getInstance();
		request.setAttribute("articles", aDao.getArticle());
		// 메인 페이지 중앙 body부분의 페이지 당 5개의 게임 리스트를 전달. pageNum이 없다면 1페이지로써 출력.
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.isEmpty()) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5;
		final int BLOCKSIZE = 5;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;
		// 메인 페이지의 정렬 방식을 패러미터로 받고, 이를 출력하는 동시에 해당 sortBy 패러미터도 다시 리턴함.
		String sortBy = request.getParameter("sortBy");
		if (sortBy == null ||sortBy.isEmpty()||sortBy.equals("highScore")) {			
			request.setAttribute("listSortby", gDao.gameListSortByScore(startRow, endRow));		
		} else if (sortBy.equals("new")) {			
			request.setAttribute("listSortby", gDao.gameListSortByDate(startRow, endRow));	
		}
		request.setAttribute("sortBy", sortBy);
		//view단에서의 출력을 및 페이징 처리를 위한 패러미터도 넘기기.
		int allGameCnt = gDao.allGameCnt();
		int pageCnt = (int)Math.ceil((double)allGameCnt/PAGESIZE);
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

		// rightArea의 순위 정보 전달 영역.
		request.setAttribute("rightAreaViewTop10", gDao.rightAreaViewTop10());
		request.setAttribute("rightAreaNewReview", gDao.rightAreaNewReview());
	}
}
