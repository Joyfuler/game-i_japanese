package project.gamei.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
import project.gamei.dao.MemberDao;
import project.gamei.dto.GameDto;

public class AdminAddGameService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("img");
		int maxSize = 1024 * 1024 * 5; // 5mb 제한.
		String gicon = "";
		int result = GameDao.FAIL;
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			if (params.hasMoreElements()) {
				String param = params.nextElement();
				gicon = mRequest.getFilesystemName(param);
				String gid = mRequest.getParameter("gid");
				String gname = mRequest.getParameter("gname");
				String ggenre = mRequest.getParameter("ggenre");
				String gpub = mRequest.getParameter("gpub");
				String gpdateStr = mRequest.getParameter("gpdate");
				Date gpdate = Date.valueOf(gpdateStr);
				String gdesc = mRequest.getParameter("gdesc");
				GameDto dto = new GameDto(gid, gname, ggenre, gpub, gpdate, gicon, gdesc);
				GameDao gDao = GameDao.getInstance();
				result = gDao.addNewGame(dto);
				if (result == GameDao.SUCCESS) {
					request.setAttribute("result", gname + "게임 추가 완료");
				} else {
					request.setAttribute("result", gname + "게임 추가 실패");
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("result", "빈 칸이 존재하거나, 이미지 용량이 초과되었습니다.");
		}		
		File serverFile = new File(path + "/" + gicon);
		if (serverFile.exists() && result == MemberDao.SUCCESS) {
		// 가입시 프로필 사진을 올렸고, 가입도 무사히 성공했다면
		InputStream is = null;
		OutputStream os = null;			
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:\\webPro\\source\\08_1stProject\\game-i_1stProject\\WebContent\\img\\" + gicon);
				byte[] bs = new byte[(int) serverFile.length()];
				while (true) {
					int readByteCnt = is.read(bs);
					if (readByteCnt == -1)
						break;
					os.write(bs, 0, readByteCnt);					
				}	
				System.out.println(gicon + "img 폴더에 복사됨");
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
