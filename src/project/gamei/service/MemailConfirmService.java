package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class MemailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.memailConfirm(memail);
		if (result == MemberDao.EXISTENT){ //존재하는 이메일이면
			request.setAttribute("memailConfirmResult", "중복된 이메일입니다.");
		} else {
			request.setAttribute("memailConfirmResult", "사용 가능한 이메일입니다.");

		}
	}
}
