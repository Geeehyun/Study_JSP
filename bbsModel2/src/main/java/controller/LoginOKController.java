package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/bbs/loginOK.do")
public class LoginOKController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginOKController() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.removeAttribute("errMsg");
		// 로그인 처리 로직
		String user_id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(user_id, pwd);
		dao.close();

		if(dto != null && dto.getMemberId() != null && dto.getPwd() != null) {
			session.setAttribute("user_id", dto.getMemberId());
			response.sendRedirect("list.do");
		} else {
			System.out.println("로그인 자체 실패");
			request.setAttribute("errMsg", "로그인 오류");
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);  
		}
	}

}
