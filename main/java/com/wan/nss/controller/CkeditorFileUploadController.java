package com.wan.nss.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.wan.nss.biz.board.BoardVO;

@Controller
public class CkeditorFileUploadController {

	@ResponseBody
	@RequestMapping("/fileupload.do")
	public void fileUpload(BoardVO bvo, HttpSession session, HttpServletResponse response,
			MultipartHttpServletRequest request) throws IOException {

		// Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;

		String projectPath = session.getServletContext().getRealPath("/"); // 파일 경로 ".../webapp/" 까지
		projectPath = projectPath.substring(0, projectPath.indexOf(".metadata"));
		System.out.println("projectPath: " + projectPath);
		System.out.println();

		// 파일을 가져오기 위해 MultipartHttpServletRequest 의 getFileMap 메서드 사용
		Map<String, MultipartFile> fileMap = request.getFileMap();
		
		MultipartFile file = fileMap.get("upload");
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
//				if (file.getContentType().toLowerCase().startsWith("image/")) {

				try {
					// 파일 이름 설정
					String fileName = UUID.randomUUID().toString();
					System.out.println("fileName: " + fileName);

					// 바이트 타입설정
					byte[] bytes;
					// 파일을 바이트 타입으로 변경
					bytes = file.getBytes();

					// ★★★ 지금부터 파일을 두 군데에 저장하는 과정임
					// 1. 에디터 사용중 이미지를 띄우기 위한 프로젝트 임시파일 경로에 저장
					// 2. 나중에 사용할 실제 이미지를 프로젝트 내부 경로에 저장
					
					// 파일이 실제로 저장되는 경로
    				String uploadPath1 = request.getServletContext().getRealPath("/img/200");
					String uploadPath2 = projectPath + "NYANGSINSA2/src/main/webapp/img/200";
					System.out.println("uploadPath1 for Dir: " + uploadPath1);
					System.out.println("uploadPath2 for Dir: " + uploadPath2);

					// 저장되는 파일에 경로 설정
					File uploadDir1 = new File(uploadPath1);
					if (!uploadDir1.exists()) {
						uploadDir1.mkdirs();
						System.out.println("없는 경로이므로 디렉토리 생성");
					}
					
					File uploadDir2 = new File(uploadPath2);
					if (!uploadDir2.exists()) {
						uploadDir2.mkdirs();
						System.out.println("없는 경로이므로 디렉토리 생성");
					}
					
					// 업로드 경로 + 파일이름을 줘서 데이터를 서버에 전송
					uploadPath1 = uploadPath1 + "/" + fileName;
					System.out.println("uploadPath1 for File: " + uploadPath1);
					File uploadFile1 = new File(uploadPath1);
//					if (uploadFile1.exists()) {
//						uploadFile1.delete();
//						System.out.println("파일이 이미 있으면 삭제");
//					}

					uploadPath2 = uploadPath2 + "/" + fileName;
					System.out.println("uploadPath2 for File: " + uploadPath2);
					File uploadFile2 = new File(uploadPath2);
//					if (uploadFile2.exists()) {
//						uploadFile2.delete();
//						System.out.println("파일이 이미 있으면 삭제");
//					}
					
					// 이미지 파일 생성
					out = new FileOutputStream(uploadFile1);
					// 저장 경로에 바이트 타입의 이미지 저장
					out.write(bytes);
					
					// 이미지 파일 생성
					out = new FileOutputStream(uploadFile2);
					// 저장 경로에 바이트 타입의 이미지 저장
					out.write(bytes);

					// 클라이언트에 이벤트 추가
					printWriter = response.getWriter();
					response.setContentType("text/html");

					// 파일이 연결되는 Url 주소 설정
					String fileUrl = request.getContextPath() + "/img/200/" + fileName;
					System.out.println("fileUrl " + uploadPath1);

					// 생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
					json.addProperty("uploaded", 1);
					json.addProperty("fileName", fileName);
					json.addProperty("url", fileUrl);
					printWriter.println(json);

				} catch (IOException e) {

					e.printStackTrace();
					printWriter.println("<SCRIPT>alert('이미지 넣기 실패...'</SCRIPT>");

				} finally {

					if (out != null) {
						out.close();
					}
					if (printWriter != null) {
						printWriter.close();

					}
				}
//				}
			}
		}

	}

}