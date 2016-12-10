package Servlet;

import java.io.IOException;

import javafx.scene.control.Alert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import BLL.Register_BLL;
import DTO.User_DTO;

/**
 * Servlet implementation class register_Servlet
 */
@WebServlet("/register")
public class register_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Register_BLL register =new Register_BLL();
		User_DTO user = new User_DTO();
		String pass= request.getParameter("pass");
		String confirm= request.getParameter("confirm");
		String fristName= request.getParameter("fName");
		String lastName= request.getParameter("lName");

		if (pass.equals(confirm)) {
			user.setEmail(request.getParameter("email"));
			user.setUserName(request.getParameter("UserId"));
			user.setPassword(request.getParameter("pass"));
			
			register.addMember(user, fristName, lastName);
			
			response.sendRedirect("register.jsp");
		}
	}

}
