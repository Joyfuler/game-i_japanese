package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.gamei.dao.MemberDao;
import project.gamei.dto.MemberDto;

public class MLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		MemberDao mDao = MemberDao.getInstance();
		int withdrawalLevel = mDao.getMember(mid).getMlevel();
		if (withdrawalLevel == -1) {
			request.setAttribute("withdrawalMemberMsg", "탈퇴했거나 없는 회원입니다.");
		} else {
			int result = mDao.loginCheck(mid, mpw);
			if (result == MemberDao.SUCCESS) {
				HttpSession session = request.getSession();
				MemberDto member = mDao.getMember(mid);
				session.setAttribute("member", member);
				request.setAttribute("loginResult", "로그인 되었습니다");
			} else {	
				request.setAttribute("loginErrorMsg", "아이디와 비밀번호를 확인해주세요");			
			}
		}
	}
}
