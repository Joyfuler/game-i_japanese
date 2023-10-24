package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class MFindAccountService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mquestStr = request.getParameter("mquest");
		int mquest = 1;
		if (mquestStr != null) {
			mquest = Integer.parseInt(mquestStr);
		}
		String manswer = request.getParameter("manswer");
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		String memberInfo = mDao.findAccount(mquest, manswer, memail);
		if (memberInfo == null) {
			request.setAttribute("findAccountResult", "해당하는 정보가 존재하지 않습니다.");
		} else {
			request.setAttribute("findAccountResult", "찾으신 아이디는 " + memberInfo + "입니다.");
		}
	}
}
