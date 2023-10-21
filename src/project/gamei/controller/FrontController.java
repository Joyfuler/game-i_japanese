package project.gamei.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.gamei.service.MJoinService;
import project.gamei.service.MLoginService;
import project.gamei.service.MLogoutService;
import project.gamei.service.MModifyCheckService;
import project.gamei.service.MModifyService;
import project.gamei.service.MainDisplayService;
import project.gamei.service.MemailConfirmService;
import project.gamei.service.MidConfirmService;
import project.gamei.service.ReviewListService;
import project.gamei.service.Service;
import project.gamei.service.boardListService;
import project.gamei.service.boardWriteFormDisplayService;
import project.gamei.service.boardWriteService;
import project.gamei.service.reviewDeleteService;
import project.gamei.service.reviewWriteService;
import project.gamei.service.withdrawalService;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int writeMode = 0;
  
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
		// 메인페이지 영역.
		if (command.equals("/main.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			viewPage = "main/main3.jsp";
		} else if (command.equals("/intro.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			viewPage = "main/intro.jsp";
		// 리뷰페이지 영역.	
		} else if (command.equals("/reviewWrite.do")) {			
			service = new reviewWriteService();
			service.execute(request, response);
			viewPage = "review.do";		
		} else if (command.equals("/deleteReview.do")) {			
			service = new reviewDeleteService();
			service.execute(request, response);
			viewPage = "review.do";		
		} else if (command.equals("/review.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			service = new ReviewListService();
			service.execute(request, response);
			viewPage = "main/review.jsp";	
		// Member 관련 페이지 영역
		} else if (command.equals("/joinView.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			viewPage = "member/joinForm.jsp";
		} else if (command.equals("/midConfirm.do")) {
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/midConfirm.jsp";		
		} else if (command.equals("/memailConfirm.do")) {
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/memailConfirm.jsp";			
		} else if (command.equals("/join.do")) {			
			service = new MainDisplayService();
			service.execute(request, response);			
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "member/loginForm.jsp";			
		} else if (command.equals("/loginView.do")) {
			service = new MainDisplayService();
			service.execute(request, response);			
			viewPage = "member/loginForm.jsp";
		} else if (command.equals("/login.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main.do";
			if (!request.getParameter("next").equals("")) {
				viewPage = request.getParameter("next");
			}				
		} else if (command.equals("/modifyChk.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			service = new MModifyCheckService();
			service.execute(request, response);
			viewPage = "member/modifyChk.jsp"; 
		} else if (command.equals("/modifyView.do")) {
			service = new MainDisplayService();
			service.execute(request, response);		
			viewPage = "member/modifyForm.jsp";
		} else if (command.equals("/modify.do")) {
			service = new MModifyService();
			service.execute(request, response);		
			viewPage = "main.do";
		} else if (command.equals("/logout.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main.do";
		} else if (command.equals("/withdrawal.do")) {
			service = new withdrawalService();
			service.execute(request, response);
			viewPage = "main.do";
			
		// 게시판 관련 영역	
		} else if (command.equals("/boardList.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new boardListService();
			service.execute(request, response);
			viewPage = "board/list.jsp";
		} else if (command.equals("/boardWriteView.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new boardWriteFormDisplayService();
			service.execute(request, response);			
			viewPage = "board/write.jsp";
			writeMode = 1;
		} else if (command.equals("/boardWrite.do")) {
			if (writeMode == 1) {				
				service = new boardWriteService();
				service.execute(request, response);
				writeMode = 0;				
			}				
				service = new MainDisplayService();
				service.execute(request, response);
				if (request.getParameter("gid")!= null) {
					viewPage= "boardList.do?gid="+request.getParameter("gid");
				} else {
					viewPage = "main.do";
			}								
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
