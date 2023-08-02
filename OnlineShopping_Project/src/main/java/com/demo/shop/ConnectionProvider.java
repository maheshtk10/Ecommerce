package com.demo.shop;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection getcon()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","maheshtk");
			return con;
		}
		catch (Exception e) 
		{
			
		}
		return null;
		
	}

}
