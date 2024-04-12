package fileupload;

import java.util.List;
import java.util.Vector;

import common.ConnectPool;

public class FileDAO extends ConnectPool {
	 public FileDAO() {} 
	
	public int registFile(FileDTO dto) {
		int result = 0;
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO tbl_files(title, category, orgfile, savefile)");
			sb.append(" VALUES (?, ?, ?, ?)");
			
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCategory());
			psmt.setString(3, dto.getOrgFile());
			psmt.setString(4, dto.getSaveFile());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("FILE 등록 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<FileDTO> fileList() {
		List<FileDTO> fList = new Vector<FileDTO>();
		
		String sql = "SELECT * FROM tbl_files ORDER BY idx DESC";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				FileDTO dto = new FileDTO();
				dto.setIdx(String.valueOf(rs.getInt("idx")));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setOrgFile(rs.getString("orgfile"));
				dto.setSaveFile(rs.getString("savefile"));
				dto.setReg_date(rs.getString("reg_date"));
				
				fList.add(dto);
			}
		} catch(Exception e) {
			System.out.println("파일 목록 조회시 에러 발생");
		}
		
		return fList;
	}
}
