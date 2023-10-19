package project.gamei.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.service.MLoginService;
import project.gamei.service.MLogoutService;
import project.gamei.service.MainDisplayService;
import project.gamei.service.ReviewListService;
import project.gamei.service.Service;
import project.gamei.service.reviewDeleteService;
import project.gamei.service.reviewWriteService;

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
		} else if (command.equals("/review.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			service = new ReviewListService();
			service.execute(request, response);
			viewPage = "main/review.jsp";
		} else if (command.equals("/reviewWrite.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			service = new reviewWriteService();
			service.execute(request, response);
			viewPage = "review.do";
		} else if (command.equals("/deleteReview.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			service = new reviewDeleteService();
			service.execute(request, response);
			viewPage = "review.do";			
		} else if (command.equals("/loginView.do")) {
			service = new MainDisplayService();
			service.execute(request, response);			
			viewPage = "main/loginForm.jsp";
		} else if (command.equals("/login.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new MLoginService();
			service.execute(request, response);
			if (!request.getParameter("next").equals("")) {
				viewPage = request.getParameter("next");
			} else {				
				viewPage = "main.do";
			}	
		} else if (command.equals("/logout.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main.do";
		}
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
