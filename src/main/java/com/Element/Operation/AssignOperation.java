package com.Element.Operation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Dbconnection.*;
import com.Elements.*;

public class AssignOperation {
	
	private Connection con;
	private PreparedStatement ps;
	
	public AssignOperation()
	{
		con = Dbconnection.GetConnection();
	}
	
	public String Assign(Assign ass)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("insert into assignteacher(teaid, classid, subid)value(?,?,?)");
			
			ps.setInt(1, ass.getTeaid());
			ps.setInt(2, ass.getClassid());
			ps.setInt(3, ass.getSubid());
			
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
	
	public List<Assign> ShowAllAssign()
	{
		List<Assign> assinfo = new ArrayList<Assign>();
		Assign ass = null;
		
		try
		{
			ps = con.prepareStatement("select * from assignteacher order by teaid desc");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				ass = new Assign();
				ass.setTeaid(rs.getInt("teaid"));
				ass.setClassid(rs.getInt("classid"));
				ass.setSubid(rs.getInt("subid"));
				assinfo.add(ass);
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return assinfo;
	}
	
	public String AssignClsSub(Assign ase)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("insert into assignclass(classid, subid)value(?,?)");
			
			ps.setInt(1, ase.getClassid());
			ps.setInt(2, ase.getSubid());
			
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
	
	public List<Assign> ShowAllAssignClsSub()
	{
		List<Assign> assinfo = new ArrayList<Assign>();
		Assign ass = null;
		
		try
		{
			ps = con.prepareStatement("select * from assignclass order by classid desc");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				ass = new Assign();
				ass.setClassid(rs.getInt("classid"));
				ass.setSubid(rs.getInt("subid"));
				assinfo.add(ass);
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return assinfo;
	}
	
	public String DeleteAssignTea(int eno)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("delete from assignteacher where teaid=?");
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
	
	public String DeleteAssignClsSub(int eno)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("delete from assignclass where classid=?");
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
	
	public List<ClassReport> ClsReport()
	{
		
	List<ClassReport> clsrpt = new ArrayList<ClassReport>();
	ClassReport clsR = null;
	
		try {
			
			ps = con.prepareStatement("select student.stdroll, student.stdname, sclass.classname, subjects.subname, teachers.teaname\r\n"
					+ "from teachers inner join assignteacher\r\n"
					+ "on teachers.teaid = assignteacher.teaid\r\n"
					+ "inner join subjects on assignteacher.subid = subjects.subid\r\n"
					+ "inner join sclass on assignteacher.classid = sclass.classid\r\n"
					+ "inner join student on sclass.classid = student.stdclsid");
			
			ResultSet rs = ps.executeQuery();
		
	
				
				
				while(rs.next())
				{
					
				clsR = new ClassReport();
				
				clsR.setStdroll(rs.getInt("student.stdroll"));
				clsR.setStdname(rs.getString("student.stdname"));
				clsR.setClassname(rs.getString("sclass.classname"));
				clsR.setSubname(rs.getString("subjects.subname"));
				clsR.setTeaname(rs.getString("teachers.teaname"));
				clsrpt.add(clsR);
					
			}
		}
	
			catch(Exception ex)
			{
				
			}
		return clsrpt;
	}
		
				

	}
