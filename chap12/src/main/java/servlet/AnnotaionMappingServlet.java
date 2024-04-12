package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AnnotaionMappingServlet
 */
@WebServlet("/AnnotationMapping.do")
public class AnnotaionMappingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("msg", "@WebServlet으로 매핑");
		request.getRequestDispatcher("./annotation.jsp").forward(request, response);
	}


}
