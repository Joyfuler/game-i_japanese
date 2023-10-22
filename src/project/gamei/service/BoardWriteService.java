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

public class BoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024*1024*10; // 사진 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String bimg = "";
		int result = BoardDao.FAIL;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", 
												new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bimg = mRequest.getFilesystemName(param);
			// mId, fTitle, fContent,  fileName, fIp
			HttpSession httpSession = request.getSession();
			MemberDto member = (MemberDto)httpSession.getAttribute("member");
			if(member!=null) {
				String mid = member.getMid(); // 로그인 한 사람의 mid
				String btitle = mRequest.getParameter("btitle");
				String bcontent = mRequest.getParameter("bcontent");				
				String bip = request.getRemoteAddr();
				BoardDao boardDao = BoardDao.getInstance();				
				String gid = mRequest.getParameter("gid"); // 글을 작성할 게시판 gid
				BoardDto boardDto = new BoardDto(0, btitle, bcontent, bimg, bip, gid, mid);
				result = boardDao.writeBoard(gid, mid, boardDto);
				// 글작성에 성공하든, 실패하든 gid 패러미터를 넘겨 viewPage에서 이동할 수 있도록 한다.
				String next = mRequest.getParameter("next");
				request.setAttribute("next", next);
				request.setAttribute("gid", gid);
				
				if(result == BoardDao.SUCCESS) {
					request.setAttribute("boardWriteResult", "글쓰기 성공");
					
				}else {
					request.setAttribute("boardWriteResult", "글쓰기 실패");
				}
			}else {
				request.setAttribute("boardWriteResult", "로그인을 해야 글 작성이 가능합니다.");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("boardWriteResult", "글쓰기 실패");
		}
		// 서버에 올라간 파일을 소스폴더에 filecopy
		if (bimg != null && result == BoardDao.SUCCESS) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+bimg);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\Users\\user_20230926\\Desktop\\webpro\\game_i\\WebContent\\memberPhotoUp\\" + bimg);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int ByteCnt = is.read(bs);
					if(ByteCnt==-1) break;
					os.write(bs, 0, ByteCnt);
					System.out.println(serverFile + "복사 완료");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}
}