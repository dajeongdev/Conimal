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

	public List<FileUploadCommand> upload(MultipartHttpServletRequest request, String path) {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String resource_path = "resources/upload";
		
		// 업로드한 파일 정보를 담고 있는 Command
		List<FileUploadCommand> files = new ArrayList<FileUploadCommand>();
		Iterator<String> file_names = request.getFileNames();
		
		while(file_names.hasNext()) {
			List<MultipartFile> upload_files = request.getFiles(file_names.next());
			
			for (MultipartFile file : upload_files) {
				FileUploadCommand fileCom = new FileUploadCommand();
				String origin_name = file.getOriginalFilename();
				System.out.println("origin_name :: " + origin_name);
				
				String ext_name = origin_name.substring(origin_name.lastIndexOf("."), origin_name.length());
				Long size = file.getSize();
				
				// 저장할 파일 이름을 랜덤하게 변경
				String save_file_name = getSaveFileName(ext_name);
				
				// 실제 저장 경로
				String save_file_path = root_path + resource_path + path;
				System.out.println("save_file_path :: " + save_file_path);
				
				try {
					writeFile(file, save_file_name, save_file_path);
					fileCom.setFile_name(origin_name);
					System.out.println(origin_name);
					fileCom.setFile_path(save_file_path);
					System.out.println(save_file_path);
					fileCom.setFile_size(size);
					files.add(fileCom);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return files;
	}
	
	private void writeFile(MultipartFile multFile, String save_file_name, String path) throws IOException {
		File dest = new File(path + save_file_name);
		File folder = new File(path);
		
		if(!folder.exists()) {
			folder.mkdirs();
			System.out.println("폴더 생성");
		} else {
			System.out.println("존재하는 폴더");
		}
		
		try {
			multFile.transferTo(dest);
			System.out.println("파일 저장 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getSaveFileName(String ext_name) {
		return System.currentTimeMillis() + ((int) (Math.random() * 1000)) + ext_name;
	}
}
