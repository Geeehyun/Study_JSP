package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model2.bbs.BbsDAO;
import model2.bbs.BbsDTO;


@WebServlet("/bbs/post.do")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionId = (session.getAttribute("user_id") != null) ? (String) session.getAttribute("user_id") : null ;
		
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
		
		
		String flag = request.getParameter("flag");
		
		
		if(sessionId == null) {
			response.sendRedirect("login.do?flag=loginFail");
		} else {
			request.setAttribute("param", param);
			System.out.println(param);
			if (flag.equals("regist")) {
				title = request.getParameter("title");
				content = request.getParameter("content");
				request.getRequestDispatcher("/bbs/register.jsp").forward(request, response);
			} else if (flag.equals("modify")) {
				BbsDAO dao = new BbsDAO();
				idx = Integer.parseInt(request.getParameter("idx"));
				param.put("idx", idx + "");
				BbsDTO bbsView = dao.bbsView(idx);
				dao.close();
				if (bbsView != null) {
					read_cnt = bbsView.getRead_cnt();
					param.put("read_cnt",read_cnt);
					user_id = bbsView.getUser_id();
					param.put("user_id",user_id);
					reg_date = bbsView.getReg_date().toString();
					param.put("reg_date",reg_date);
					title = bbsView.getTitle();
					param.put("title",title);
					content = bbsView.getContent();
					content = (content != null) ? content.replace("<br>", "\r\n") : "";
					content = (content != null) ? content.replace(" ", "&nbsp") : "";
					param.put("content",content);
				}
				request.getRequestDispatcher("/bbs/modify.jsp").forward(request, response);
			} else if (flag.equals("delete")) {
				idx = Integer.parseInt(request.getParameter("idx"));
				param.put("idx", idx + "");
				request.getRequestDispatcher("postOK.do?flag=delete").forward(request, response);
			}
		}		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
