<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
        "root", "matth3w94wkawa");
	Statement st = con.createStatement();
	ResultSet rs;
	String id=request.getParameter("postID");
	String sql = "delete from postdata where PostID= "+id+";";
	if(st.executeUpdate(sql)==1){
        response.sendRedirect("homep.jsp");
    }
%>