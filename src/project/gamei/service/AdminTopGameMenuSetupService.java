package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.ArticleDao;
import project.gamei.dao.GameDao;
import project.gamei.dao.SearchWordDao;

public class AdminTopGameMenuSetupService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 상단의 게임 메뉴 리스트를 가져와 출력.
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("topGameList", gDao.topGameList());
		// 상단 메뉴 및 기사 내용을 가져와 상단 메뉴 관리 이미지 영역에 출력.
		ArticleDao aDao = ArticleDao.getInstance();
		request.setAttribute("articleList", aDao.getArticle());
		// 상단 검색어 내용을 가져와 상단 메뉴 관리 영역에 출력.
		SearchWordDao sDao = SearchWordDao.getInstance();
		request.setAttribute("searchWordList", sDao.getSearchWordList());		
	}
}
