package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class AdminBlockControlService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mlevelStr = request.getParameter("mlevel");
		int mlevel = 0;
		if (mlevelStr != null) {
			mlevel = Integer.parseInt(mlevelStr);
		}
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.setMemberBlock(mlevel, mid);
		if (result == MemberDao.SUCCESS) {
			request.setAttribute("result", "회원등급 조정 완료");
		}
	}
}
