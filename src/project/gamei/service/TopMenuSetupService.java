package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.GameDao;

public class TopMenuSetupService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String gid = request.getParameter("gid");
		String method = request.getParameter("method");
		GameDao gDao = GameDao.getInstance();
		int result = gDao.topMenuSetUp(method, gid);
			if (result == GameDao.SUCCESS) {
				request.setAttribute("result", gid + "의 상단 목록이 조정되었습니다");
			}
		}
	}


