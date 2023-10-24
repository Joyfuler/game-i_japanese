package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;

public class MFindPasswordService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mquestStr = request.getParameter("mquest");
		int mquest = 1;
		if (mquestStr != null) {
			mquest = Integer.parseInt(mquestStr);			
		}
		String manswer = request.getParameter("manswer");
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		String accountInfo = mDao.findPassword(mid, mquest, manswer, memail);				
		if (accountInfo != null) {
			request.setAttribute("findPasswordResult", "찾으신" + mid + "의 비밀번호는" + accountInfo + "입니다.");			
		} else {
			request.setAttribute("findPasswordResult", "해당하는 정보가 존재하지 않습니다.");
		}
	}

}
