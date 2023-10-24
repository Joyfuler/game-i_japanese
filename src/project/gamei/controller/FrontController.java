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
import project.gamei.service.BoardContentService;
import project.gamei.service.BoardDeleteService;
import project.gamei.service.BoardListService;
import project.gamei.service.BoardModifyFormDisplayService;
import project.gamei.service.BoardModifyService;
import project.gamei.service.BoardReplyFormdisplayService;
import project.gamei.service.BoardReplyService;
import project.gamei.service.BoardWriteFormDisplayService;
import project.gamei.service.BoardWriteService;
import project.gamei.service.CommentDeleteService;
import project.gamei.service.CommentReplyService;
import project.gamei.service.CommentReplyViewService;
import project.gamei.service.CommentWriteService;
import project.gamei.service.AdminAddGameService;
import project.gamei.service.AdminBlockControlService;
import project.gamei.service.AdminCustomerListService;
import project.gamei.service.MFindAccountService;
import project.gamei.service.MFindPasswordService;
import project.gamei.service.ReviewDeleteService;
import project.gamei.service.ReviewWriteService;
import project.gamei.service.WithdrawalService;


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
			service = new ReviewWriteService();
			service.execute(request, response);
			viewPage = "review.do";		
		} else if (command.equals("/deleteReview.do")) {			
			service = new ReviewDeleteService();
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
		} else if (command.equals("/findAccountView.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			viewPage = "member/findAccount.jsp";	
		} else if (command.equals("/findAccount.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new MFindAccountService();
			service.execute(request, response);
			viewPage = "member/findAccountResult.jsp";
		} else if (command.equals("/findPassword.do")) {
			service = new MainDisplayService();
			service.execute(request, response);
			service = new MFindPasswordService();
			service.execute(request, response);
			viewPage = "member/findAccountResult.jsp";
		} else if (command.equals("/withdrawal.do")) {
			service = new WithdrawalService();
			service.execute(request, response);
			viewPage = "main.do";			
		// 게시판 관련 영역	
		} else if (command.equals("/boardList.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/list.jsp";
		} else if (command.equals("/boardWriteView.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new BoardWriteFormDisplayService();
			service.execute(request, response);			
			viewPage = "board/write.jsp";			
		} else if (command.equals("/boardWrite.do")) {
			service = new BoardWriteService();
			service.execute(request, response);			
			viewPage = "boardList.do";			
		} else if (command.equals("/boardContent.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/content.jsp";
		} else if (command.equals("/boardModifyView.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new BoardModifyFormDisplayService();
			service.execute(request, response);			
			viewPage = "board/modify.jsp";			
		} else if (command.equals("/boardModify.do")) {			
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardContent.do";
		} else if (command.equals("/boardDelete.do")) {
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		} else if (command.equals("/boardReplyView.do")) {
			service = new MainDisplayService(); 
			service.execute(request, response);
			service = new BoardReplyFormdisplayService();
			service.execute(request, response);
			viewPage = "board/reply.jsp";
		} else if (command.equals("/boardReply.do")) {
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		} else if (command.equals("/commentWrite.do")) {
			service = new CommentWriteService();
			service.execute(request, response);
			viewPage = "boardContent.do";
		} else if (command.equals("/commentDelete.do")) {
			service = new CommentDeleteService();
			service.execute(request, response);
			viewPage = "boardContent.do";
		} else if (command.equals("/commentReplyView.do")) {
			//service = new CommentReplyService();
			service = new CommentReplyViewService();
			service.execute(request, response);
			viewPage = "board/commentReplyView.jsp";	
		} else if (command.equals("/commentReply.do")) {
			service = new CommentReplyService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			// 관리자모드 관련 영역
		} else if (command.equals("/admin.do")){
			service = new AdminCustomerListService();
			service.execute(request, response);
			viewPage = "admin/admin.jsp";
		} else if (command.equals("/adminBlockUser.do")) {
			service = new AdminBlockControlService();
			service.execute(request, response);
			viewPage = "admin.do?idx=0";
		} else if (command.equals("/adminAddGame.do")) {
			service = new AdminAddGameService();
			service.execute(request, response);
			viewPage = "admin.do?idx=1";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}