package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.gamei.dao.MemberDao;
import project.gamei.dto.MemberDto;

public class WithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = null;
		MemberDto sessionMember = (MemberDto) session.getAttribute("member");
		if (sessionMember != null) {
			mid = sessionMember.getMid();
		}
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.withdrawalMember(mid);
		if (result == MemberDao.SUCCESS) {
			request.setAttribute("withdrawalResult", "회원 탈퇴가 완료되었습니다");
			session.invalidate();
		} else {
			request.setAttribute("withdrawalResult", "로그인되어있지 않습니다");
		}
	}

}
