package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import project.gamei.dao.ReviewDao;
import project.gamei.dto.ReviewDto;

public class ReviewWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String rscoreStr = request.getParameter("rscore");
		int rscore = 5;
		if (rscoreStr == null) {
			rscore = 5;	
		}		
		if (rscoreStr != null) {
			rscore = Integer.parseInt(rscoreStr);
		}
		String rtext = request.getParameter("rtext");
		String mid = request.getParameter("mid");		
		String gid = request.getParameter("gid");
		ReviewDao rDao = ReviewDao.getInstance();
		ReviewDto previousReviewInfo = rDao.getUserReviewWriteDate(mid, gid);		
		if (previousReviewInfo != null) {
			request.setAttribute("reviewWriteErrorMsg", "한 아이디당 한 번만 리뷰를 작성할 수 있습니다");			
		} else {
			ReviewDto dto = new ReviewDto(rscore, rtext, mid, gid); 
			int result = rDao.writeReview(dto);
			if (result == ReviewDao.SUCCESS) {
				request.setAttribute("reviewWriteResult", "리뷰를 작성했습니다.");		
			} else {
				request.setAttribute("reviewWriteErrorMsg", "리뷰 길이를 확인해주세요.");	
			}
		}		
	}
}	


