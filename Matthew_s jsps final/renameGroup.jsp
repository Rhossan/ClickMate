<%@ page import ="java.sql.*" %>
<%
String groupID = (String)session.getAttribute("groupID"); 
String newName = request.getParameter("name");
    Class.forName("com.mysql.jdbc.Driver");
    
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    
   	Statement st6 = con.createStatement();
   	String sql = "UPDATE GroupData SET GroupName = '"+newName+"' where GroupID = '"+groupID+"'";
   			
   			
   	st6.executeUpdate(sql);
   	
    response.sendRedirect("homep.jsp");
%>