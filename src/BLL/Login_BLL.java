package BLL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DAL.MySQLconnection;
import DTO.User_DTO;

public class Login_BLL {
	MySQLconnection connect =new MySQLconnection();
	Connection conn =null;
	ResultSet rs = null;
	User_DTO user= null;
	
	public ArrayList<User_DTO> LayDuLieu(){
		ArrayList<User_DTO> list= new ArrayList<User_DTO>();
		conn =connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			 rs  = query.executeQuery("select UserId,UserName,Password, FullName from tb_User ");
			 while (rs.next()) {
				 user= new User_DTO();
				 user.setUserid(rs.getInt(1));
				 user.setUserName(rs.getString(2));
				 user.setPassword(rs.getString(3));
				 user.setFullname(rs.getNString(4));
				 list.add(user);
			}
			 conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return list;
	}
	
	public String getName(String id){
		String name=null;
		ArrayList<User_DTO> list= new ArrayList<User_DTO>();
		conn =connect.getConnectiontoSQL();
		try {
			Statement query = conn.createStatement();
			 rs  = query.executeQuery("select FullName from tb_User Where UserId='"+id+"'");
			 while (rs.next()) {
				 name = rs.getNString("FullName");
			}
			 conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return name;
	}
	
	
	public static void main(String args[]){
		Login_BLL a= new Login_BLL();
		System.out.println(a.login("1", "1"));
	}
	
	public boolean login(String username, String password) {
		int count = 0;
		ArrayList<User_DTO> listAccount= LayDuLieu();
		int lenght = listAccount.size();
		for (int i = 0; i < lenght; i++) {
			if (listAccount.get(i).getUserName().equals(username)
					&& listAccount.get(i).getPassword().equals(password)) {
				count=count+1;
			}
		}
		if (count >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
