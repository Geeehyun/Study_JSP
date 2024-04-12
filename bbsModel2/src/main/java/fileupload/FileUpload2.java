package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/FileUpload2.do")
@MultipartConfig(
		maxFileSize = 1024*1024 * 1,
		maxRequestSize =1024*1024 * 10 
)
public class FileUpload2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String directory = "C:\\JSP\\chap13\\src\\main\\webapp\\Upload";
			System.out.println("이거다???????????"+directory);
			
			ArrayList<String> arrFileName = FileUtil.uploadFile2(request, directory);
			System.out.println("이거다???????????"+arrFileName);
			for(String orgFileName : arrFileName) {
				String savedFileName = FileUtil.renameFile(directory, orgFileName);
				System.out.println("이거다????"+savedFileName);
				
				//DB 저장하기
				registFile(request, orgFileName, savedFileName);
			}
	
			// 페이지 이동
			response.sendRedirect("./fileList.jsp");
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
			request.setAttribute("errMsg", "파일 업로드에 실패");
			request.getRequestDispatcher("file.jsp").forward(request, response);
		}
	}
	
	private void registFile(HttpServletRequest request, String orgFileName, String sFileName) {
		String title = request.getParameter("title");
		String[] categoriesArr = request.getParameterValues("category");
		
		StringBuffer cb = new StringBuffer();
		if (categoriesArr == null) {
			cb.append("선택 항목 없음");
		} else {
			for(String e : categoriesArr) {
				cb.append(e + ", ");
			}
		}
		System.out.println("파일 외 폼 값 : " + title + "\n" + cb.toString());
		
		FileDTO dto = new FileDTO();
		dto.setTitle(title);
		dto.setCategory(cb.toString());
		dto.setOrgFile(orgFileName);
		dto.setSaveFile(sFileName);
		
		FileDAO dao = new FileDAO();
		dao.registFile(dto);
		dao.close();

	}

}
