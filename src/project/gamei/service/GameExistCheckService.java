package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class GameExistCheckService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		GameDao gDao = GameDao.getInstance();
		int result = gDao.existCheck(gid);
		if (result == GameDao.EXISTENT) {
			request.setAttribute("existCheck", "존재하는 아이디입니다.");			
		} else {
			request.setAttribute("existCheck", "사용 가능한 아이디입니다.");
		}
	}
}