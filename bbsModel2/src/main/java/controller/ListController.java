package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.PageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.bbs.BbsDAO;
import model2.bbs.BbsDTO;


@WebServlet("/bbs/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListController() { }


	protected void doGet(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BbsDAO dao = new BbsDAO();
		
		// 뷰에 보낼 Map 객체 만들기
		Map<String, Object> param = new HashMap<String, Object>();
		
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
		
		// 총 게시글 수
		int total_count = dao.bbsTotalCount(param);
		param.put("total_count", total_count);
		
		// 게시글 조회
		List<BbsDTO> bbsList = dao.bbsPagingList(param);
		dao.close();		
		// 게시글 html 생성
		String boardList = PageUtil.makeList(bbsList, total_count, page_selected, queryStringPCW);
		param.put("boardList", boardList);
		
		// 총 페이지 개수
		int total_page = (int) Math.ceil((double)total_count / 10);
		param.put("total_page", total_page);
		String pageList = PageUtil.makeMageNumber(total_page, 10, page_selected, queryStringCW);
		param.put("pageList", pageList);
		
		// Request 영역에 Map 저장
		request.setAttribute("param",param);		
		
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}

}
