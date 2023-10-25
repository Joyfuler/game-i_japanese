package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.MemberDao;
import project.gamei.dto.MemberDto;

public class GetAccountInfoService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto userInfo = mDao.getMember(mid);
		request.setAttribute("userInfo", userInfo);
	}

}
