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


@WebServlet("/bbs/postOK.do")
public class PostOKController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionId = (session.getAttribute("user_id") != null) ? (String) session.getAttribute("user_id") : null ;
		
		// 뷰에 보낼 Map 객체 만들기
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 값 초기화
		String user_id = "";
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
			BbsDTO dto = new BbsDTO();
			BbsDAO dao = new BbsDAO();
			
			user_id = request.getParameter("user_id");
			title = request.getParameter("title");
			content = request.getParameter("content");
			System.out.println("null이면 하지말라고 병신아"+request.getParameter("idx"));
			idx = (request.getParameter("idx") != null) ? Integer.parseInt(request.getParameter("idx")) : 0;
			if (flag.equals("regist")) {
				dto.setUser_id(user_id);
				dto.setTitle(title);
				dto.setContent(content);
				int result = dao.bbsRegister(dto);
				dao.close();
				// 결과 반환
				if (result > 0) {
					response.sendRedirect("list.do?"+queryStringPCW);
				} else {
					request.setAttribute("errMsg", "게시글 등록 실패하였습니다.");
					request.getRequestDispatcher("post.do?flag=regist").forward(request, response);
				}
			} else if (flag.equals("modify")) {
				if (sessionId.equals(user_id)) {
					// 업데이할 정보 생성
					dto.setIdx(idx);
					System.out.print("idx : "+ idx);
					dto.setUser_id(user_id);
					System.out.print("user_id : "+ user_id);
					dto.setTitle(title);
					System.out.print("title : "+ title);
					dto.setContent(content);
					System.out.print("content : "+ content);
					// 업데이트문 실행
					int result = dao.bbsModify(dto);
					dao.close();
					// 결과 반환
					if (result > 0) {
						response.sendRedirect("list.do");
					} else {
						request.setAttribute("errMsg", "게시글 수정 실패하였습니다.");
						request.getRequestDispatcher("post.do?flag=modify").forward(request, response);
					}
				} else {
					response.sendRedirect("login.do?flag=loginFail");
				}
	
			} else if (flag.equals("delete")) {
				// 업데이할 정보 생성
				dto.setIdx(idx);
				// 델리트문 실행
				int result = dao.bbsDelete(idx);
				dao.close();
				// 결과 반환
				if (result > 0) {
					response.sendRedirect("list.do");
				} else {
					request.setAttribute("errMsg", "게시글 수정 실패하였습니다.");
					request.getRequestDispatcher("view.do?idx="+idx).forward(request, response);
				}
			} 
		}
	}

}
