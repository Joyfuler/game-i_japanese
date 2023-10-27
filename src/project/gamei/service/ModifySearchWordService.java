package project.gamei.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.SearchWordDao;

public class ModifySearchWordService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sintro = request.getParameter("sintro");
		String sword = request.getParameter("sword");
		String sidStr = request.getParameter("sid");
		int sid = 0;
		if (sidStr != null) {
			sid = Integer.parseInt(sidStr);			
		}
		
		SearchWordDao sDao = SearchWordDao.getInstance();
		int result = sDao.modifySearchWord(sid, sintro, sword);
		if (result == SearchWordDao.SUCCESS) {
			request.setAttribute("modifySearchWordResult", sid+"번째 검색어가 수정되었습니다.");
		} else {
			request.setAttribute("modifySearchWordResult", sid+"번째 검색어 수정 실패");
		}
	}
}
