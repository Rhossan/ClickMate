<%@ page import ="java.sql.*" %>
<%
String id=request.getParameter("postID");

String text = request.getParameter("editPost");
Class.forName("com.mysql.jdbc.Driver");
    
    System.out.println(id);
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
   	
    Statement st = con.createStatement();
	
   	String sql = "UPDATE PostData SET Content = '"+text+"' "+
   			"WHERE PostID = '"+id+"'";
   			
   	st.executeUpdate(sql);
   	
    response.sendRedirect("homep.jsp");
%>