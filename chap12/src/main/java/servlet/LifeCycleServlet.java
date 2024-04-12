package servlet;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LifeCycleServlet
 */
@WebServlet("/LifeCycle.do")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@PostConstruct
	public void lifePostConstruct() {
		System.out.println("lifePostConstruct() 호출");
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 호출");
		super.service(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		request.getRequestDispatcher("life.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		request.getRequestDispatcher("life.jsp").forward(request, response);
	}
	
	/**
	 * @see Servlet#destroy()
	 */
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
		// GC가 일정 시간마다 파괴하고 다니는데 그 때 실행 됨!, 근데 테스트 해보고 싶으면 냅다 서버(톰캣) 죽여보면 됨
	}

}
