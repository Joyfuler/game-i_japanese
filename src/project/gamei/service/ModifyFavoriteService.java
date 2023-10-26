package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.FavoriteDao;

public class ModifyFavoriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getParameter("method");
		String gid = request.getParameter("gid");
		String mid = request.getParameter("mid");
		FavoriteDao fDao = FavoriteDao.getInstance();
		int result = FavoriteDao.FAIL;
		if (method.equals("add")) {
			result = fDao.insertFavorite(gid, mid);
			if (result == FavoriteDao.SUCCESS) {
				request.setAttribute("modifyResult", "즐겨찾기 수정 완료");
			} else {
				request.setAttribute("modifyResult", "즐겨찾기 수정 실패");
			}
		} else {
			result = fDao.deleteFavorite(gid, mid);
			if (result == FavoriteDao.SUCCESS) {
				request.setAttribute("modifyResult", "즐겨찾기 삭제 완료");
			} else {
				request.setAttribute("modifyResult", "즐겨찾기 삭제 실패");
			}
		}
	}
}