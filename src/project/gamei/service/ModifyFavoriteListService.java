package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.gamei.dao.FavoriteDao;
import project.gamei.dto.MemberDto;

public class ModifyFavoriteListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FavoriteDao fDao = FavoriteDao.getInstance();
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		String mid = "";
		if (member != null) {
			mid = member.getMid();
			request.setAttribute("favoriteList", fDao.getFavoriteList(mid));
		}
	}
}
