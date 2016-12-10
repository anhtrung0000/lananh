package BLL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DAL.MySQLconnection;
import DTO.DetailProduct_DTO;
import DTO.Product_DTO;

public class Single_BLL {
	MySQLconnection connect = new MySQLconnection();
	Connection conn = null;
	ResultSet rs = null;
	DetailProduct_DTO detailproduct = null;

	public ArrayList<DetailProduct_DTO> LayDuLieu(int productId) {
		ArrayList<DetailProduct_DTO> list = new ArrayList<DetailProduct_DTO>();
		conn = connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			rs = query
					.executeQuery("Select * from tb_DetailProduct where ProductId= "
							+ productId);
			while (rs.next()) {
				detailproduct = new DetailProduct_DTO();
				detailproduct.setImages(rs.getString("Images"));
				list.add(detailproduct);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public Product_DTO getProduct(int productId) {
		Product_DTO product = new Product_DTO();
		conn = connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			rs = query
					.executeQuery("Select * from tb_Product where ProductId= "
							+ productId);
			if(rs.next()){
				product.setColor(rs.getString("Color"));
				product.setImages(rs.getString("Images"));
				product.setProductId(rs.getInt("ProductCategoryId"));
				product.setProductName(rs.getString("ProductName"));
				product.setPrice(rs.getFloat("Price"));
				product.setDecription(rs.getString("Decription"));
				product.setSize(rs.getString("Size"));
				product.setProductId(rs.getInt("ProductId"));
			}
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	public static void main(String args[]){
		Single_BLL single= new Single_BLL();
//		ArrayList<DetailProduct_DTO> list = single.LayDuLieu(1);
		Product_DTO pro = single.getProduct(1);
		System.out.println(pro.getProductId());
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i).getImages());
//		}
	}
}
