package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class MidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.midConfirm(mid);
		if (result == MemberDao.EXISTENT) {
			request.setAttribute("joinConfirmResult","このIDは既に使用されています");			
		} else {
			request.setAttribute("joinConfirmResult","使用可能なIDです");
		}
	}
}
