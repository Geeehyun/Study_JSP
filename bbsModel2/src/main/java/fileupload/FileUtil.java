package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	public static String uploadFile(HttpServletRequest req, String dir) throws ServletException, IOException {
			Part part = req.getPart("file");
			String pHeader = part.getHeader("content-disposition");
			System.out.println("pHeader : " + pHeader );
			
			String[] attPartHeader = pHeader.split("filename=");
			String orgFileName = attPartHeader[1].trim().replace("\"", "");
			
			if(!orgFileName.isEmpty()) {
				part.write(dir + File.separator + orgFileName);
			}
			return orgFileName;

		
	}
	
	public static String renameFile (String dir, String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		
		String newFileName = now+ext;
		
		File oldFile = new File(dir + File.separator + fileName);
		File newFile = new File(dir + File.separator + newFileName);
		
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
	
	public static ArrayList<String> uploadFile2 (HttpServletRequest req, String dir) throws ServletException, IOException {
		ArrayList<String> list = new ArrayList<String>();
		
		Collection<Part> parts = req.getParts();
		System.out.println("넌 들어오는가??"+parts);
		for(Part p : parts) {
			System.out.println("난 p name 이야"+p.getName());
			if(!p.getName().equals("file")) {continue;}
			String partHeader = p.getHeader("content-disposition");
			System.out.println("partHeader=" + partHeader);
			
			String[] arrPartHeader = partHeader.split("filename=");
			String orgFileName = arrPartHeader[1].trim().replace("\"", "");
			System.out.println("orgFileName : " + orgFileName);
			
			if(!orgFileName.isEmpty()) {
				p.write(dir + File.separator + orgFileName);
			}
			list.add(orgFileName);
		}
		
		return list;
	}
}
