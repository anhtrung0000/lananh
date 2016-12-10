package BLL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DAL.MySQLconnection;
import DTO.User_DTO;

public class Register_BLL {
	public MySQLconnection connect =new MySQLconnection();
	public PreparedStatement pres = null;
	public Connection conn=null;
	
	public void addMember(User_DTO user, String fristName,String lastName ){
		user.setFullname(fristName+" "+lastName);
		conn =connect.getConnectiontoSQL();
		try {
			pres =conn.prepareStatement("Insert Into tb_User(UserName,AdMin,Password,Email,FullName)"
					+ " Values (?,?,?,?,?)");
			
			pres.setString(1, user.getUserName());
			pres.setString(2, "false");
			pres.setString(3, user.getPassword());
			pres.setString(4, user.getEmail());
			pres.setString(5, user.getFullname());
			pres.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]){
		Register_BLL rg= new Register_BLL();
		User_DTO user =new User_DTO("d","d","d.com");
		rg.addMember(user,"Phung","Cuong");
	}
}
