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
		int existent = 0;
		int count = 0;
		int result = FavoriteDao.FAIL;
		if (method.equals("add")) {
			// 만일 추가하기 전에 해당 게임이 이미 즐겨찾기가 추가되어 있다면 추가하지 않도록 함.
			existent = fDao.favoriteConfirm(gid, mid);
			if (existent == 1) {
				request.setAttribute("modifyResult", "이미 즐겨찾기에 추가되어 있습니다");
				return;
			}
			// 만일 즐겨찾기가 이미 5개 이상 추가되어 있다면 더 이상 추가하지 않도록 함.
			count = fDao.countFavoriteList(mid);		
			if (count >= 5) {
				request.setAttribute("modifyResult", "더이상 추가할 수 없습니다");
				return;
			}						
			result = fDao.insertFavorite(gid, mid);
			if (result == FavoriteDao.SUCCESS) {
				request.setAttribute("modifyResult", "즐겨찾기 수정 완료");
			} else {
				request.setAttribute("modifyResult", "즐겨찾기 수정 실패");
			}
			// method가 add가 아닌 경우, 즉 삭제시
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