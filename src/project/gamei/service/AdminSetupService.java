package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class AdminSetupService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getParameter("method");
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.adminSetup(method, mid);
		if (result == MemberDao.SUCCESS) {
			request.setAttribute("result", mid + "회원 등급조정 완료");
		}
	}
}
