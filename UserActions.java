package com.flyaway;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserActions {
	JDBCConnection dbobj = new JDBCConnection();

	public  boolean insert(String name,String email, String password)
	{
		boolean result = true;
		
	String sql = "insert into users(email_id,password,name) values(?,?,?)";
		
		try(Connection con = dbobj.getConnection();) {
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(3, name);
			ps.setString(1, email);
			ps.setString(2, password);			
			ps.executeUpdate();
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}
				
		return result;
	}

	public boolean validateCustomer(String email,String Password) {
		boolean found = false;
		
		String sql = "select email_id,password From users where email_id = '"+email+"' and password = '"+Password+"'";
		
		try(Connection con = dbobj.getConnection();)
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) 
			{
			System.out.println("Email:"+rs.getString("email_id"));
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
	
	public void bookingOrderInsert( String userEmail, String travelingDate, int flightno, int nooftravllers)
	{
		String sqlquery = "insert into bookings(email,date_of_booking,flight_no, no_of_pax) values(?,?,?,?)";
		try(Connection con = dbobj.getConnection();) {
			
			
			PreparedStatement ps = con.prepareStatement(sqlquery);
			ps.setString(1, userEmail);
			ps.setString(2, travelingDate);
			ps.setInt(3,flightno );
			ps.setInt(4,nooftravllers );  
			
			ps.executeUpdate();
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		
	}

}
