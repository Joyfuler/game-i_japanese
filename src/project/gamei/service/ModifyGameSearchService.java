package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class ModifyGameSearchService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gname = request.getParameter("gname");
		GameDao gDao = GameDao.getInstance();
		request.setAttribute("gameInfo", gDao.getGameInfoByGname(gname));
	}
}
