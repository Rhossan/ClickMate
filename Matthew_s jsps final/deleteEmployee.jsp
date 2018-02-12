<%@ page import ="java.sql.*" %>
<%

	String id=request.getParameter("employeeID");
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    System.out.println(id);
   	Statement st6 = con.createStatement();
   	String sql = "DELETE FROM EmployeeData WHERE EmployeeID = '"+id+"'";
   	st6.executeUpdate(sql);
    //Statement st3 = con.createStatement();
   	//sql = "DELETE FROM PageData WHERE PageID = '"+pageID+"';";
   	//st3.executeUpdate(sql);
    response.sendRedirect("Add_Delete_Edit.jsp");
%>