package com.Element.Operation;
import com.Dbconnection.*;
import com.Elements.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubOperation {
	
	private Connection con;
	private PreparedStatement ps;
	
	public SubOperation()
	{
		con = Dbconnection.GetConnection();
	}
	
	public String Addsub(Subjects subs)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("insert into Subjects(subid, subname)value(?,?)");
			
			ps.setInt(1, subs.getSubid());
			ps.setString(2, subs.getSubname());
		
		
		
			
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
	
	public List<Subjects> ShowAllSub()
	{
		List<Subjects> subinfo = new ArrayList<Subjects>();
		Subjects sub = null;
		
		try
		{
			ps = con.prepareStatement("select * from Subjects order by subid desc");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				sub = new Subjects();
				
				sub.setSubid(rs.getInt("subid"));
				sub.setSubname(rs.getString("subname"));
				
				subinfo.add(sub);
				
				
			}
		}
		catch(Exception ex)
		{
			
		}
		return subinfo;
	}
	
	public String DeleteSub(int eno)
	{
		String chk="err";
		
		try {
			
			ps = con.prepareStatement("delete from Subjects where subid=?");
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
