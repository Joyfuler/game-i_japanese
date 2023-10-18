package project.gamei.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.service.MainDisplayService;
import project.gamei.service.Service;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		Service service = null;
		String viewPage = null;
		String uri = request.getRequestURI(); // /ch18_mvcMember/main.do
		String conPath = request.getContextPath(); // /ch18_mvcMember
		String command = uri.substring(conPath.length());
		if (command.equals("/main.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			viewPage = "main/main3.jsp";
		} else if (command.equals("/intro.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			viewPage = "main/intro.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	

}
