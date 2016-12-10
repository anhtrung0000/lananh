package BLL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.org.apache.regexp.internal.recompile;

import DAL.MySQLconnection;
import DTO.Product_DTO;

public class index_BLL {
	MySQLconnection connect =new MySQLconnection();
	ResultSet rst =null;
	ArrayList<Product_DTO> listpro = null;
	Connection conn= null;
	Product_DTO pro = null;
	
	
	public ArrayList<Product_DTO> getListbestseller(){
		listpro = new ArrayList<Product_DTO>();
		conn=connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			rst= query.executeQuery("Select * from tb_Product  where ProductCategoryId=1");
			while(rst.next()){
				pro =new Product_DTO();
				pro.setImages(rst.getString("Images"));
				pro.setProductId(rst.getInt("ProductId"));
				pro.setProductName(rst.getString("ProductName"));
				listpro.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listpro;
	}
	
	public ArrayList<Product_DTO> getListnewProduct(){
		listpro = new ArrayList<Product_DTO>();
		conn=connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			rst= query.executeQuery("Select * from tb_Product where ProductCategoryId =2");
			while(rst.next()){
				pro =new Product_DTO();
				pro.setImages(rst.getString("Images"));
				pro.setProductId(rst.getInt("ProductId"));
				pro.setProductName(rst.getString("ProductName"));
				pro.setPrice(rst.getFloat("Price"));
				listpro.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listpro;
	}
	
	public static void main(String args[]){
		
		index_BLL main= new index_BLL();
		ArrayList<Product_DTO> listpro = main.getListbestseller();
		for(int i =0 ;i<listpro.size();i++){
			System.out.println(listpro.get(i).getImages());
		}
		
	}
}


