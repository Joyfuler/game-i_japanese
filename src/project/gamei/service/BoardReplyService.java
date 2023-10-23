package project.gamei.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.gamei.dao.BoardDao;
import project.gamei.dto.BoardDto;
import project.gamei.dto.MemberDto;

public class BoardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024 * 1024 * 10; // 사진 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String bimg = "";
		int result = BoardDao.FAIL;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bimg = mRequest.getFilesystemName(param);
			// 멤버 정보와 게시글 정보를 받는 작업. 로그인이 아닐 경우에만 db와 상호작용
			HttpSession httpSession = request.getSession();
			MemberDto member = (MemberDto) httpSession.getAttribute("member");
			if (member != null) {		
				String mid = member.getMid();
				String btitle = mRequest.getParameter("btitle");
				String bcontent = mRequest.getParameter("bcontent");
				String bip = request.getRemoteAddr();
				int bgroup = Integer.parseInt(mRequest.getParameter("bgroup"));
				int bstep = Integer.parseInt(mRequest.getParameter("bstep"));
				int bindent = Integer.parseInt(mRequest.getParameter("bindent"));
				String bnoStr = mRequest.getParameter("bno");
				String pageNumStr = mRequest.getParameter("pageNum");
				int bno = 0;
				int pageNum = 1;
				if (bnoStr != null) {
					bno = Integer.parseInt(bnoStr);
				}
				if (pageNumStr != null) {
					pageNum = Integer.parseInt(pageNumStr);
				}
				BoardDao boardDao = BoardDao.getInstance();
				String gid = mRequest.getParameter("gid"); // 글을 작성할 게시판 gid
				BoardDto boardDto = new BoardDto(btitle, bcontent, bimg, bgroup, bstep, bindent, bip);
				result = boardDao.replyBoard(gid, mid, boardDto);
				// gid, pageNum 패러미터를 넘겨 viewPage에서 해당 게시판 + 페이지로 이동하도록 함.
				request.setAttribute("pageNum", pageNum);				
				request.setAttribute("gid", gid);
				if (result == BoardDao.SUCCESS) {
					request.setAttribute("boardReplyResult", "답변글 작성 성공");
				} else {
					request.setAttribute("boardReplyResult", "답변글 작성 실패");
				}
			} else {
				request.setAttribute("boardReplyResult", "로그인을 해야 글 답변이 가능합니다.");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("boardReplyResult", "답변글 작성 실패");
		}
		// 서버에 올라간 파일을 소스폴더에 filecopy
		if (bimg != null && result == BoardDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path + "/" + bimg);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream(
						"D:\\webPro\\source\\08_1stProject\\game-i_1stProject\\WebContent\\memberPhotoUp\\" + bimg);
				byte[] bs = new byte[(int) serverFile.length()];
				while (true) {
					int ByteCnt = is.read(bs);
					if (ByteCnt == -1)
						break;
					os.write(bs, 0, ByteCnt);
					System.out.println(serverFile + "복사 완료");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (os != null)
						os.close();
					if (is != null)
						is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

	}


