package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.BoardDao;
import project.gamei.dao.Board_CommentDao;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		String bnoStr = request.getParameter("bno");
		int bno = 0;		
		String pageNumStr = request.getParameter("pageNum");
		int pageNum = 1;
		if (gid == null) {
			gid = (String)request.getAttribute("gid");
		}
		if (bnoStr == null) {
			bno = (int) request.getAttribute("bno");
		} else {
			bno = Integer.parseInt(bnoStr);
		}
		if (pageNumStr == null || pageNumStr.equals("")) {
			pageNum = (int) request.getAttribute("pageNum");
		} else if (request.getAttribute("pageNum") == null) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(pageNumStr);
		}		
		
		BoardDao bDao = BoardDao.getInstance();
		Board_CommentDao bcDao = Board_CommentDao.getInstance();
		bDao.hitup(bno);
		request.setAttribute("boardContent", bDao.getBoardContent(gid, bno));
		
		// 댓글을 확인하기 위해 bno를 받아 댓글도 출력이 필요.
		String commentPageNum = request.getParameter("commentPageNum");
		if (commentPageNum == null || commentPageNum.equals("")) {
			commentPageNum = "1";
		}
		
		int currentPage = Integer.parseInt(commentPageNum);
		final int PAGESIZE = 5;
		final int BLOCKSIZE = 3;
		int startRow = (currentPage -1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;		
		request.setAttribute("boardComment", bcDao.listComment(bno, startRow, endRow));
		int totCnt = bcDao.boardCommentCnt(bno);
		int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
		int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE -1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}		
		
		request.setAttribute("bno", bno);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("commentPageNum", currentPage);
		request.setAttribute("pageCnt", pageCnt); //		
	}
}