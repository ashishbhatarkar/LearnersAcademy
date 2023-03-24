package com.Element.Operation;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Dbconnection.*;
import com.Elements.*;

public class TeacherOperation {

	
	private Connection con;
	private PreparedStatement ps;
	
	public TeacherOperation()
	{
		con = Dbconnection.GetConnection();
	}
	
	public String AddTea(Teachers tea)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("insert into teachers(teaid, teaname, teaemail, teaphone)value(?,?,?,?)");
			
			ps.setInt(1, tea.getTeaid());
			ps.setString(2, tea.getTeaname());
			ps.setString(3, tea.getTeaemail());
			ps.setInt(4, tea.getTeaphone());

			
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
	
	public List<Teachers> ShowAllTea()
	{
		List<Teachers> teainfo = new ArrayList<Teachers>();
		Teachers tea = null;
		
		try
		{
			ps = con.prepareStatement("select * from teachers order by teaid desc");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				tea = new Teachers();
				tea.setTeaid(rs.getInt("teaid"));
				tea.setTeaname(rs.getString("teaname"));
				tea.setTeaemail(rs.getString("teaemail"));
				tea.setTeaphone(rs.getInt("teaphone"));
				teainfo.add(tea);
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return teainfo;
	}

	public String DeleteTea(int eno)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("delete from teachers where teaid=?");
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
	
	public List<Teachers> ShowTeaname()
	{
		List<Teachers> teainfo = new ArrayList<Teachers>();
		Teachers tea = null;
		
		try
		{
			ps = con.prepareStatement("select teaname from teachers where teaid=?");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				tea = new Teachers();
				
				tea.setTeaname(rs.getString("teaname"));
				teainfo.add(tea);
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return teainfo;
	}
	
}
