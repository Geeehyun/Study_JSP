package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import common.MyErr;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.bbs.BbsDAO;
import model2.bbs.BbsDTO;


@WebServlet("/bbs/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ViewController() {}


	protected void doGet(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 뷰에 보낼 Map 객체 만들기
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 값 초기화
		int read_cnt = 0;
		String user_id = "";
		String reg_date = "";
		String title = "";
		String content = "";
		int idx = 0;
		
		// 검색조건 및 현재 페이지 번호 
		// 초기화
		String search_category = "";
		String search_word = "";
		int page_selected = 1;
		// Map에 추가
		if (request.getParameter("search_category") != null) {
			search_category = request.getParameter("search_category");
		}
		if(request.getParameter("search_word") != null) {
			search_word = request.getParameter("search_word");
		}
		if (request.getParameter("page_selected") != null) {
			page_selected = Integer.parseInt(request.getParameter("page_selected"));
		}
		param.put("search_category", search_category);
		param.put("search_word", search_word);
		param.put("page_selected", page_selected);
		//QreryString 만들
		String queryStringPCW = "page_selected=" + page_selected + "&search_category=" + search_category + "&search_word=" + search_word;
		String queryStringCW = "search_category=" + search_category + "&search_word=" + search_word;
		param.put("queryStringPCW", queryStringPCW);
		param.put("queryStringCW", queryStringCW);


		try {
			//게시글 숫자아닌 값 들어올 때 걸러내기
			if (request.getParameter("idx") != null) {
				idx = Integer.parseInt(request.getParameter("idx"));
			}
			param.put("idx", idx);
			
			BbsDAO dao = new BbsDAO();
			BbsDTO bbsView = dao.bbsView(idx);
			System.out.println("있냐?"+bbsView.getUser_id());
			if (bbsView.getUser_id() == null || bbsView.getUser_id().equals("null")) {
				throw new MyErr("없는 게시글 입니다.");
			}
			dao.close();
			

			//게시글 정보 불러오기
			if (bbsView != null) {
				read_cnt = bbsView.getRead_cnt();
				user_id = bbsView.getUser_id();
				reg_date = (bbsView.getReg_date() != null)? bbsView.getReg_date().toString() : "";
				title = bbsView.getTitle();
				content = bbsView.getContent();
				content = (content != null) ? content.replace("\r\n", "<br>") : "";
				content = (content != null) ? content.replace(" ", "&nbsp") : "";
			}
			param.put("read_cnt", read_cnt);
			param.put("user_id", user_id);
			param.put("reg_date", reg_date);
			param.put("title", title);
			param.put("content", content);
			
			if (bbsView.getUser_id() == null) {
				throw new MyErr("없는 게시글 입니다.");
			}
			
		} catch(NumberFormatException e) {
			System.out.println("err1");
			param.put("err", e.getMessage());
		} catch(MyErr e) {
			System.out.println("err2");
			param.put("err", e.getMessage());
		}
		
		request.setAttribute("param",param);
		
		request.getRequestDispatcher("view.jsp").forward(request, response);
	}

}
