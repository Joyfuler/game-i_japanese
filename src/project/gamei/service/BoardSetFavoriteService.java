package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.FavoriteDao;

public class BoardSetFavoriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String gid = request.getParameter("gid");
		FavoriteDao fDao = FavoriteDao.getInstance();
		int count = fDao.favoriteConfirm(gid, mid);
		int result = FavoriteDao.FAIL;
		if (count == 0) {
			result = fDao.insertFavorite(gid, mid);
			if (result == FavoriteDao.SUCCESS) {
				request.setAttribute("modifyFavoResult", "즐겨찾기 추가 완료");
			} else {
				request.setAttribute("modifyFavoResult", "즐겨찾기 추가 실패");
			}
		} else {
			result = fDao.deleteFavorite(gid, mid);
			if (result == FavoriteDao.SUCCESS) {
				request.setAttribute("modifyFavoResult", "즐겨찾기 삭제 완료");
			} else {
				request.setAttribute("modifyFavoResult", "즐겨찾기 삭제 실패");
			}
		}
	}
}
