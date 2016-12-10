package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BLL.Checkout_BLL;
import DTO.Customer_DTO;
import DTO.Invoice_DTO;

/**
 * Servlet implementation class InforInvoice_Servlet
 */
@WebServlet("/InforInvoice_Servlet")
public class InforInvoice_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InforInvoice_Servlet() {
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
		
		if(request.getParameter("submit") != null){
			Customer_DTO customer = new Customer_DTO();
			customer.setEmail(request.getParameter("Email"));
			customer.setAddress(request.getParameter("Address"));
			customer.setFullName(request.getParameter("Name"));
			customer.setNote(request.getParameter("note"));
			customer.setPhone("Phone");
			Checkout_BLL checkbll = new Checkout_BLL();
			int dem = 0;
			if(checkbll.addCustomer(customer)){
				for(int i = 0; i< listInvoice.size(); i++){
					Invoice_DTO in = new Invoice_DTO();
					in = listInvoice.get(i);
					if(checkbll.addInvoice(in)){
						if(checkbll.addInvoiceCustomer()){
							dem++;
						}
					}
				}
			}
				session.setAttribute("mess", "Đặt hàng thành công");
		}
		
		response.sendRedirect("dathang.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
