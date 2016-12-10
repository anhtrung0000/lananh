package BLL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DAL.MySQLconnection;
import DTO.DetailProduct_DTO;
import DTO.Product_DTO;

public class SearchProduct_BLL {
	MySQLconnection connect = new MySQLconnection();
	Connection conn = null;
	ResultSet rs = null;
	DetailProduct_DTO detailproduct = null;

	public ArrayList<Product_DTO> getProduct(String searchName) {
		
		ArrayList<Product_DTO> listSearch = new ArrayList<>();
		conn = connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			rs = query
					.executeQuery("Select * from tb_Product where ProductName like N'%"
							+ searchName +"%'");
			while (rs.next()) {
				Product_DTO product = new Product_DTO();
				product.setColor(rs.getString("Color"));
				product.setImages(rs.getString("Images"));
				product.setProductId(rs.getInt("ProductCategoryId"));
				product.setProductName(rs.getString("ProductName"));
				product.setPrice(rs.getFloat("Price"));
				product.setDecription(rs.getString("Decription"));
				product.setSize(rs.getString("Size"));
				product.setProductId(rs.getInt("ProductId"));
				listSearch.add(product);
			}
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSearch;
	}
	
	public static void main(String args[]){			
			SearchProduct_BLL sp = new SearchProduct_BLL();
			ArrayList<Product_DTO> listpro = sp.getProduct("xo");
			for(int i =0 ;i<listpro.size();i++){
				System.out.println(listpro.get(i).getImages());
			}
			
		}
}
