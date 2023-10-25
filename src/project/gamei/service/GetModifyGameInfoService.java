package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;
import project.gamei.dto.GameDto;

public class GetModifyGameInfoService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		GameDao gDao = GameDao.getInstance();
		GameDto gameInfo = gDao.getGameInfo(gid);
		request.setAttribute("modifyGameInfo", gameInfo);
	}

}
