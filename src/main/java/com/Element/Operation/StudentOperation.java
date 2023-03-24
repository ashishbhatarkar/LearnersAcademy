package com.Element.Operation;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Dbconnection.*;
import com.Elements.*;

public class StudentOperation {
	
	private Connection con;
	private PreparedStatement ps;
	
	public StudentOperation()
	{
		con = Dbconnection.GetConnection();
	}
	
	public String Addstd(Student std)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("insert into student(stdroll, stdname, stdclsid)value(?,?,?)");
			
			ps.setInt(1, std.getStdroll());
			ps.setString(2, std.getStdname());
			ps.setInt(3, std.getStdclsid());
		
			
			int res = ps.executeUpdate();
			
			if(res>=1)
				chk = "Success";
			
		}
		catch(Exception ex)
		{
			chk = ex.getMessage();	
			
		}
		return chk;
				
	}
	
	public List<Student> ShowAllStd()
	{
		List<Student> stdinfo = new ArrayList<Student>();
		Student std = null;
		
		try
		{
			ps = con.prepareStatement("select * from student order by stdroll desc");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				std = new Student();
				std.setStdroll(rs.getInt("stdroll"));
				std.setStdname(rs.getString("stdname"));
				std.setStdclsid(rs.getInt("stdclsid"));
				stdinfo.add(std);
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return stdinfo;
	}
	
	
	public String Deletestd(int eno)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("delete from student where stdroll=?");
			ps.setInt(1, eno);
			
			int res = ps.executeUpdate();
			
			if(res>=1)
				chk = "Success";
			
		}
		catch(Exception ex)
		{
			chk = ex.getMessage();	
			
		}
		return chk;
				
	}

}
