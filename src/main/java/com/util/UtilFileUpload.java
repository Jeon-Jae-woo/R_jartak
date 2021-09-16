package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class UtilFileUpload {
	
	public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadfile, String uploadPath) {
		String path = "";
		String fileName = "";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		try {
			//중복 파일명 UUID 제거 위해 사용
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"_"+uploadfile.getOriginalFilename();
			
			byte[] bytes = uploadfile.getBytes();
			path = request.getSession().getServletContext().getRealPath(uploadPath);
			
			if(! new File(uploadPath).exists()) {
				new File(uploadPath).mkdirs();
			}
			//System.out.println(request.getSession().getServletContext().getRealPath(uploadPath));
			File file = new File(path, fileName);
			
			out = new FileOutputStream(file);
			out.write(bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return fileName;
	}
	
}
