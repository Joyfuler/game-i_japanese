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

import project.gamei.dao.ArticleDao;
import project.gamei.dao.BoardDao;
import project.gamei.dto.BoardDto;
import project.gamei.dto.MemberDto;

public class ArticleModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("img");
		int maxSize = 1024 * 1024 * 10; // 사진 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String img1 = "";
		int result = ArticleDao.FAIL;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			img1 = mRequest.getFilesystemName(param);
			String dbimg1 = mRequest.getParameter("dbimg1");
			img1 = (img1 == null ? dbimg1 : img1);				
				String artidStr = mRequest.getParameter("artid");
				int artid = 0;
				if (artidStr != null){
					artid = Integer.parseInt(artidStr);
				}
				String link1 = mRequest.getParameter("link1");				
				ArticleDao aDao = ArticleDao.getInstance();
				result = aDao.modifyArticle(img1, link1, artid);				
				if (result == ArticleDao.SUCCESS) {
					request.setAttribute("result", "기사 수정이 완료되었습니다");
				} else {
					request.setAttribute("result", "기사수정 실패");
				}			
		} catch (IOException e) {
			System.out.println(e.getMessage());			
		}
		if (img1 != null && result == ArticleDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path + "/" + img1);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream(
						"D:\\webPro\\source\\08_1stProject\\game-i_1stProject\\WebContent\\img\\" + img1);
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
