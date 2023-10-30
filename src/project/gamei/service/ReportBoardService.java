package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.ReportDao;

public class ReportBoardService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String rreasonStr = request.getParameter("rreason");
		int rreason = 1;
		if (rreasonStr != null) {
			rreason = Integer.parseInt(rreasonStr);
		}
		String mid = request.getParameter("reportermid");
		String bnoStr = request.getParameter("bno");
		int bno = 0;
		if (bnoStr != null) {
			bno = Integer.parseInt(bnoStr);			
		}
		
		ReportDao reDao = ReportDao.getInstance();
		int result = reDao.reportBoard(rreason, mid, bno);
		if (result == ReportDao.SUCCESS) {
			request.setAttribute("reportResult", "신고가 완료되었습니다");			
		} else {
			request.setAttribute("reportResult", "게시글 신고 실패");
		}
	}
}
