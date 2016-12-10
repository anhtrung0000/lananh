package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BLL.Single_BLL;
import DTO.Invoice_DTO;
import DTO.Product_DTO;

/**
 * Servlet implementation class Checkout_Servelet
 */
@WebServlet("/Checkout_Servelet")
public class Checkout_Servelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout_Servelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<Invoice_DTO> listInvoice = (ArrayList<Invoice_DTO>)session.getAttribute("listInvoice");
		if(request.getParameter("checkout") != null){
			String id= request.getParameter("checkout");
			int a= Integer.parseInt(id);
			Single_BLL single = new Single_BLL();
			Product_DTO pro = new Product_DTO();
			pro = single.getProduct(a);
			System.out.println(pro.toString());
			Invoice_DTO inv = new Invoice_DTO();
			if(pro != null){
				inv.setColor(pro.getColor());
				inv.setImages(pro.getImages());
				inv.setPrice(pro.getPrice());
				inv.setProductId(pro.getProductId());
				inv.setProductName(pro.getProductName());
				inv.setSize(pro.getSize());
				if(!listInvoice.contains(inv)){
					listInvoice.add(inv);
					session.setAttribute("listInvoice", listInvoice);
				}				
			}
		}
		else
		if(request.getParameter("remove") != null){
			String i = request.getParameter("remove");
			int indexi= Integer.parseInt(i);
			listInvoice.remove(indexi);
		}
		
		if(request.getParameter("submit") != null && request.getParameter("submit").equals("Update") ){
			for(int k = 0; k< listInvoice.size() ; k++){
				String inputname = "lines"+k;
				if(request.getParameter(inputname) != null){
					listInvoice.get(k).setTotal(Integer.parseInt(request.getParameter(inputname)));
				}
			}
			session.setAttribute("listInvoice", listInvoice);
		}
		if(session.getAttribute("thanhtien") == null){
			session.setAttribute("thanhtien",0);
		}else if(session.getAttribute("thanhtien") != null){
			float thanhtien = 0;
			for(int k = 0; k< listInvoice.size() ; k++){
				thanhtien += Float.parseFloat(listInvoice.get(k).money());
			}
			session.setAttribute("thanhtien",String.format("%.2f",thanhtien) );
		}
		if(session.getAttribute("error") == null){
			session.setAttribute("error","");
		}
		if(request.getParameter("thanhtoan") != null){
			if(Float.parseFloat(session.getAttribute("thanhtien").toString()) <= 0){
				session.setAttribute("error","Mời bạn chọn sản phẩm trước khi thanh toán");
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("dathang.jsp");
				rd.forward(request, response);
			}
		}
		else{
			session.setAttribute("error","");
		}

			response.sendRedirect("checkout.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
