package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bbs/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginController() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.removeAttribute("errMsg");
		if(request.getParameter("flag") == null){  
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);
		}else if (request.getParameter("flag").equals("logOut")) {
			session.invalidate();
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);
		} else if (request.getParameter("flag").equals("loginFail")) {
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);
		} 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
