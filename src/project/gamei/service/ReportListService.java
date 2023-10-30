package project.gamei.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.dao.ReportDao;
import project.gamei.dto.ReportDto;

public class ReportListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReportDao reDao = ReportDao.getInstance();
		ArrayList<ReportDto> list = reDao.getReportList();
		request.setAttribute("reportList", list);
	}
}
