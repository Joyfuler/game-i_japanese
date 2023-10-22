package project.gamei.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.ReviewDao;

public class ReviewDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String ridStr = request.getParameter("rid");
		if (ridStr == null || ridStr.isEmpty()) {
			try {
				response.sendRedirect("main.do");
				return;
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}			
		} else {
			int rid = Integer.parseInt(ridStr);		
			ReviewDao rDao = ReviewDao.getInstance();
			int result = rDao.deleteReview(rid);
				if (result == ReviewDao.SUCCESS) {
					request.setAttribute("reviewDeleteResult", "리뷰가 삭제되었습니다.");	
				}
		}
	}
}