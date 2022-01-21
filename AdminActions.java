package com.flyaway;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AdminActions {
	JDBCConnection dbobj = new JDBCConnection();
	
	public boolean validateAdmin(String email,String Password) {
		boolean found = false;
		
		String sql = "select admin_email,admin_password From admins where admin_email = '"+email+"' and admin_password = '"+Password+"'";
		
		try(Connection con = dbobj.getConnection();)
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) 
			{
			System.out.println("Email:"+rs.getString("admin_email"));
			found = true;
			}
			con.close();
		}
	    catch(SQLException e)
		{
			e.printStackTrace();
		
		}
		
		return found;
	}
}
