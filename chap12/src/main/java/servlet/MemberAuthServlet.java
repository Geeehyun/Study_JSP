package servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

/**
 * Servlet implementation class MemberAuthServlet
 */
public class MemberAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO dao;
	// 필요한 메서드에서 하나씩 생성해서 쓸 수도 있지만 공통으로 뽑고 필요한데 갖다 쓰는게 자월 활용에 더 유리함.
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		
		dao = new MemberDAO(application); 
	}
	
	@Override
	public void  service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String admin_id = this.getInitParameter("ADMIN_ID");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDTO dto = dao.getMemberInfo(id, pwd);
		String name = dto.getName();
		if (name != null) {
			request.setAttribute("authMsg", "환영하오 " + name + "!");
		} else {
			if(admin_id.equals(id)) {
				request.setAttribute("authMsg", "환영하오 관리자 " + id + "!");
			} else {
				request.setAttribute("authMsg", id + " 너는 비회원이다 삐빅");
			}
		}
		
		request.getRequestDispatcher("member.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		dao.close();
		// destroy는 GC가 청소할 때 실행되는데, GC가 언제 청소할지 일정하지 않음 따라서 자원 효율성이 별로임 쓸때 마다 다 쓰고 바로바로 닫아주는게 좋음
	}

}
