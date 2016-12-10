package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BLL.SearchProduct_BLL;
import DTO.Product_DTO;

/**
 * Servlet implementation class SearchProduct_Servlet
 */
@WebServlet("/SearchProduct_Servlet")
public class SearchProduct_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProduct_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		SearchProduct_BLL sp = new SearchProduct_BLL();
		ArrayList<Product_DTO> listSearch = new ArrayList<>();
		
		System.out.println(request.getParameter("search1"));
		if(request.getParameter("submit") != null && request.getParameter("submit").equals("1")){
			if(request.getParameter("search1") != null){
				
				listSearch = sp.getProduct(request.getParameter("search1").toString());
				System.out.println(listSearch.size());
				session.setAttribute("listSearch", listSearch);
			}
		}
		response.sendRedirect("searchproduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
