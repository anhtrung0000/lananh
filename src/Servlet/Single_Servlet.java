package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BLL.Single_BLL;
import DTO.DetailProduct_DTO;
import DTO.Product_DTO;

/**
 * Servlet implementation class Single_Servlet
 */
@WebServlet("/Single")
public class Single_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Single_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id= request.getParameter("ID");
		int a= Integer.parseInt(id);
		Single_BLL single = new Single_BLL();
		HttpSession session = request.getSession();
		session.setAttribute("listDetailProduct", single.LayDuLieu(a));
		session.setAttribute("inforProduct", single.getProduct(a));
		response.sendRedirect("single.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
