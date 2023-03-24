package com.Dbconnection;
import java.sql.*;

	public class Dbconnection {
		
		public static Connection GetConnection()
		{
			Connection con =  null;
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academy", "root", "Vishu@687");
				
			}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
			return con;
		}
}
