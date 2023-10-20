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

import project.gamei.dao.MemberDao;
import project.gamei.dto.MemberDto;

public class MModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024 * 1024 * 5;
		String mphoto = "";
		int result = MemberDao.FAIL;
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			while (params.hasMoreElements()) {
				String param = params.nextElement(); // params가 한개이므로 String. 여러개라면 String[] 사용
				mphoto = mRequest.getFilesystemName(param); // 첨부한 파일명
				String dbmphoto = mRequest.getParameter("dbMphoto");
				mphoto = mphoto == null ? dbmphoto : mphoto;
				String mid = mRequest.getParameter("mid");
				String mnickname = mRequest.getParameter("mnickname");
				String mpw = mRequest.getParameter("mpw");
				String memail = mRequest.getParameter("memail");
				String mphone = mRequest.getParameter("mphone");
				String mquestStr = mRequest.getParameter("mquest");
				int mquest = 1;
				if (mquestStr!=null && !mquestStr.equals("")) {
					mquest = Integer.parseInt(mquestStr);
				}
				String manswer = mRequest.getParameter("manswer");
				MemberDao mDao = MemberDao.getInstance();
				MemberDto dto = new MemberDto(mid, mnickname, mpw, memail, mphone, mphoto, mquest, manswer);
				result = mDao.modifyMember(dto);
				if (result == MemberDao.SUCCESS) {
					HttpSession session = request.getSession();
					session.setAttribute("member", dto);
					request.setAttribute("modifyResult", "회원정보수정완료");
				} else {
					request.setAttribute("modifyErrorMsg", "회원정보수정실패");
				}
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		File serverFile = new File(path + "/" + mphoto);
		if (serverFile.exists() && !mphoto.equals("noimg.jpg") && result == MemberDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream(
						"D:\\webPro\\source\\08_1stProject\\game-i_1stProject\\WebContent\\memberPhotoUp\\" + mphoto);
				byte[] bs = new byte[(int) serverFile.length()];
				while (true) {
					int readByteCnt = is.read(bs);
					if (readByteCnt == -1)
						break;
					os.write(bs, 0, readByteCnt);
				}
				System.out.println(mphoto + "폴더로 복사 완료");
			} catch (Exception e) {
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
