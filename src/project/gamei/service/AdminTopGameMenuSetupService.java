package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.ArticleDao;
import project.gamei.dao.GameDao;

public class AdminTopGameMenuSetupService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("topGameList", gDao.topGameList());
		// 상단 메뉴 및 기사 내용을 가져와 상단 메뉴 관리 이미지 영역에 출력.
		ArticleDao aDao = ArticleDao.getInstance();
		request.setAttribute("articleList", aDao.getArticle());
	}
}
