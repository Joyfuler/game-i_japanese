package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class AdminTopGameMenuSetupService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("topGameList", gDao.topGameList());
	}
}
