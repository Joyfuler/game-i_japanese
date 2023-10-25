package project.gamei.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import project.gamei.dao.GameDao;
import project.gamei.dto.GameDto;

public class AdminModifyGameService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("img");
		int maxSize = 1024 * 1024 * 10; // 사진 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String gicon = "";
		int result = GameDao.FAIL;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			gicon = mRequest.getFilesystemName(param);
			String dbGicon = mRequest.getParameter("dbGicon");			
			gicon = (gicon == null? dbGicon : gicon);
			String gid = mRequest.getParameter("gid");
			String gname = mRequest.getParameter("gname");
			String ggenre = mRequest.getParameter("ggenre");
			String gpub = mRequest.getParameter("gpub");
			String gpdateStr = mRequest.getParameter("gpdate");			
			Date gpdate = null;
			if (gpdateStr != null) {
				gpdate = Date.valueOf(gpdateStr);
			}
			String gdesc = mRequest.getParameter("gdesc");
			GameDao gDao = GameDao.getInstance();
			GameDto gameInfo = new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc);			
			if (gdesc == null || gdesc.equals("")) {
				result = gDao.adminModifyGameInfo("noDesc", gid, gameInfo);
			} else {
				result = gDao.adminModifyGameInfo("haveDesc", gid, gameInfo);
			}
			
			if (result == GameDao.SUCCESS) {
				request.setAttribute("result", "게임정보 수정 완료");
			} else {
				request.setAttribute("result", "게임정보 수정 실패");
			}		
		} catch (IOException e) {
			System.out.println(e.getMessage());			
		}
		
		// 서버에 올라간 파일을 소스폴더에 filecopy
		if (gicon != null && result == GameDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path + "/" + gicon);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream(
						"D:\\webPro\\source\\08_1stProject\\game-i_1stProject\\WebContent\\img\\" + gicon);
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
