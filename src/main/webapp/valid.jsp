<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>validation page</title>
</head>
<body>
<% String id,pass;
	id=request.getParameter("id");
	pass=request.getParameter("pass");
	boolean va=false;
	
	PreparedStatement st=null;
	ResultSet rs=null;
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/two","root","Dhruthik10");
		
		String sql="select * from user where id =? and pass=?";
		
		st=conn.prepareStatement(sql);
		
		st.setInt(1,(Integer.parseInt(id)));
		st.setString(2,pass);
		
		rs= st.executeQuery();
		
		if(rs.next()){
			va=true;
			
		}
		conn.close();	
		}
	
		catch(Exception ex)
	{
			System.out.println(ex.getMessage());
	}
	
	
	
		if(va)
		{
			
			response.sendRedirect("Marking.jsp");
		}
		else{
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/two","root","Dhruthik10");
				
				String sql="select * from admin where id =? and pass=?";
				
				st=conn.prepareStatement(sql);
				
				st.setInt(1,(Integer.parseInt(id)));
				st.setString(2,pass);
				
				rs= st.executeQuery();
				
				if(rs.next()){
					va=true;
					
				}
				conn.close();	
				}
			
				catch(Exception ex)
			{
					System.out.println(ex.getMessage());
			}
			if(va)
			{
				
				response.sendRedirect("admin.jsp");
			}
			
			
			if(!va){
			response.sendRedirect("invalid.jsp");}
		}
%>




</body>
</html>