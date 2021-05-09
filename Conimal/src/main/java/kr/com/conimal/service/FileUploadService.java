package kr.com.conimal.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.com.conimal.model.command.FileUploadCommand;

@Service
public class FileUploadService {

	public FileUploadCommand upload(MultipartHttpServletRequest request, String path) {
		System.out.println("upload() 호출");
		
		MultipartFile file = request.getFile("file");
		FileUploadCommand command = new FileUploadCommand();
		
		// 파일 경로 지정
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(rootPath);
		String resourcePath = "resources/upload";
		
		// 파일 이름 변경
		String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		System.out.println("fileName : " + fileName);
		
		String filePath = rootPath + resourcePath + path;
		System.out.println("filePath : " + filePath + fileName);
		
		// 저장할 폴더, 저장할 파일 이름
		File saveFile = new File(filePath + fileName);
		
		try {
			file.transferTo(saveFile);
			command.setFile_name(fileName);
			command.setFile_path(filePath);
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return command;
	}
	
	public List<FileUploadCommand> uploadList(MultipartHttpServletRequest request, String path) {
		System.out.println("uploadList() 호출");
		
		List<FileUploadCommand> files = new ArrayList<>();
		Iterator<String> fileNames = request.getFileNames();
		
		// 파일 경로 지정 
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String uploadPath = "resources/upload";
	
		while(fileNames.hasNext()) {
			List<MultipartFile> uploadFiles = request.getFiles(fileNames.next());
			
			for(MultipartFile file : uploadFiles) {
				FileUploadCommand command = new FileUploadCommand();
				
				// 파일 이름 변경 
				String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
				System.out.println("fileName : " + fileName);
				
				String filePath = rootPath + uploadPath + path;
				System.out.println("filePath : " + filePath + fileName);
			
				// 저장할 폴더, 저장할 파일 이름 
				File saveFile = new File(filePath + fileName); 
				
				try {
					file.transferTo(saveFile);
					command.setFile_name(fileName);
					command.setFile_path(filePath);
					System.out.println("command : " + command);
				} catch(IOException e) {
					e.printStackTrace();
				} catch(Exception e) {
					e.printStackTrace();
				}
				files.add(command);
			}
		}
		System.out.println("files : " + files);
		return files;
	}
}