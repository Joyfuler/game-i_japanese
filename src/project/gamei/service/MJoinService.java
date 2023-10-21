package project.gamei.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

import project.gamei.dao.MemberDao;
import project.gamei.dto.MemberDto;

public class MJoinService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024 * 1024 * 5; // 5mb
		String mphoto = "";
		int result = MemberDao.FAIL;
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			if (params.hasMoreElements()) {
				String param = params.nextElement();
				mphoto = mRequest.getFilesystemName(param);
				String mid = mRequest.getParameter("mid");
				String mnickname = mRequest.getParameter("mnickname");
				String mpw = mRequest.getParameter("mpw");
				String memail = mRequest.getParameter("memail");
				mphoto = (mphoto == null ? "noimg.png" : mphoto);
				// 만일 첨부된 것이 없다면 noimg.png로 자동설정.				
				String mquestStr = mRequest.getParameter("mquest");
				int mquest = 1;				
				if (!mquestStr.equals("")) {
					mquest = Integer.parseInt(mquestStr);
				}				
				String mlevelStr = mRequest.getParameter("mlevel");
				int mlevel = 0;							
				String manswer = mRequest.getParameter("manswer");
				String mphone = mRequest.getParameter("mphone");
				MemberDao mDao = MemberDao.getInstance();
				MemberDto newMember = new MemberDto(mid, mnickname, mpw, memail, mphone, mphoto, mquest, manswer, mlevel);
				result = mDao.joinMember(newMember);
					if (result == MemberDao.SUCCESS) {
						HttpSession session = request.getSession();
						session.setAttribute("mid", mid);
						request.setAttribute("joinResult", "회원가입이 완료되었습니다.");						
					} else {
						request.setAttribute("joinErrorMsg", "가입시 입력한 정보의 길이를 확인해주세요");
					}			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("joinErrorMsg", "첨부파일의 용량 제한은 5MB 이하입니다");
		}
		// 가입 작업 완료 후 파일 복사 작업.
		File serverFile = new File(path + "/" + mphoto);
		if (serverFile.exists() && !mphoto.equals("noimg.jpg") && result == MemberDao.SUCCESS) {
		// 가입시 프로필 사진을 올렸고, 가입도 무사히 성공했다면
		InputStream is = null;
		OutputStream os = null;			
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:\\webPro\\source\\08_1stProject\\game-i_1stProject\\WebContent\\memberPhotoUp\\" + mphoto);
				byte[] bs = new byte[(int) serverFile.length()];
				while (true) {
					int readByteCnt = is.read(bs);
					if (readByteCnt == -1)
						break;
					os.write(bs, 0, readByteCnt);					
				}	
				System.out.println(mphoto + "복사됨");
			} catch (FileNotFoundException e) {
				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (os != null)
						os.close();
					if (is != null)
						is.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}	
			}			
		}		
	}
}