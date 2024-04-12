package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.one")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// resp.getWriter().append("Served at: ").append(req.getContextPath());
		
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf('/');
		String cmdStr = uri.substring(lastSlash);
		
		if (cmdStr.equals("/regist.one")) {
			regist(req);
		} else if (cmdStr.equals("/login.one")) {
			login(req);
		} else if (cmdStr.equals("/bbs.one")) {
			bbs(req);
		} else {
			defaultFunc(req);
		}
		req.setAttribute("uri", uri);
		req.setAttribute("cmdStr", cmdStr);
		req.getRequestDispatcher("controller.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	void regist(HttpServletRequest req) {
		req.setAttribute("result", "<h2>회원가입 페이지</h2>");
	}
	
	void login(HttpServletRequest req) {
		req.setAttribute("result", "<h2>로그인 페이지</h2>");
	}
	
	void bbs(HttpServletRequest req) {
		req.setAttribute("result", "<h2>게시판 페이지</h2>");
	}
	void defaultFunc(HttpServletRequest req) {
		req.setAttribute("result", "<h2>접근정보가 올바르지 않습니다.</h2>");
	}

}
