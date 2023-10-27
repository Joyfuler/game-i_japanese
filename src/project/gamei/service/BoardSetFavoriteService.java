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
		// 먼저 해당 게시판 (gid)가 이미 추가되어 있는지를 확인 후, 없다면 추가 / 있다면 제거.
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
