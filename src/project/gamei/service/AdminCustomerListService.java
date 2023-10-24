package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class AdminCustomerListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao mDao = MemberDao.getInstance();
		String pageNum = request.getParameter("pageNum");		
		if (pageNum == null) {			
				pageNum = "1";			
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5; // 페이지 별 게시글 갯수
		final int BLOCKSIZE = 5;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;		
		request.setAttribute("memberList", mDao.getMemberList(startRow, endRow));
		int totCnt = mDao.getMemberTotCnt();
		int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
		int startPage = ((currentPage -1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageCnt", pageCnt);
	}
}
