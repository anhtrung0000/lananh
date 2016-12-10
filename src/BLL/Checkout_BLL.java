package BLL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import DAL.MySQLconnection;
import DTO.Customer_DTO;
import DTO.Invoice_DTO;
import DTO.User_DTO;

public class Checkout_BLL {
	public MySQLconnection connect =new MySQLconnection();
	public PreparedStatement pres = null;
	public Connection conn=null;
	
	public boolean addInvoice(Invoice_DTO invoice){
		conn =connect.getConnectiontoSQL();
		try {
			pres =conn.prepareStatement("Insert Into tb_Invoice(ProductId, Total)"
					+ " Values (?,?)");
			
			pres.setInt(1, invoice.getProductId());
			pres.setInt(2, invoice.getTotal());
			if(pres.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean addInvoiceCustomer(){
		conn =connect.getConnectiontoSQL();
		try {
			ResultSet rs = null;
			int a = 0;
			int b = 0;
			Statement query = conn.createStatement();
			rs = query
					.executeQuery("select max(CustomerId) as id FROM [tb_Customer]");
			if(rs.next()) a = rs.getInt("id");
			rs = query
					.executeQuery("select max(InvoiceId) as id FROM tb_Invoice");
			if(rs.next()) b = rs.getInt("id");
				
			pres =conn.prepareStatement("Insert Into tb_Invoice_Customer(InvoiceId, CustomerId, [Check])"
					+ " Values ("+a+","+b+","+0+")");
			if(pres.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean addCustomer(Customer_DTO cus ){
		conn =connect.getConnectiontoSQL();
		try {
			pres =conn.prepareStatement("Insert Into tb_Customer(Email,FullName ,Phone,Address,Note,CreateDate)"
					+ " Values (?,?,?,?,?,?)");
			Date today = new Date();
			SimpleDateFormat timeFormat= new SimpleDateFormat("MM/dd/yyyy hh:mm:ss "); 
			pres.setString(1, cus.getEmail());
			pres.setString(2, cus.getFullName());
			pres.setString(3, cus.getPhone());
			pres.setString(4, cus.getAddress());
			pres.setString(5, cus.getNote());
			pres.setString(6, timeFormat.format(today));
			if(pres.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String args[]){
		Checkout_BLL check = new Checkout_BLL();
		Customer_DTO c = new Customer_DTO();
		c.setAddress("a");
		c.setEmail("email");
		c.setFullName("lan");
		c.setPhone("895895");
		c.setNote("");
		
		Invoice_DTO in = new Invoice_DTO();
		in.setProductId(1);
		in.setTotal(2);
		check.addCustomer(c);
		check.addInvoice(in);
		if(check.addInvoiceCustomer()){
			System.out.println("ok");
		}
	}
}
