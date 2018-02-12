<%@ page import ="java.sql.*" %>
<%

	String groupID = (String)session.getAttribute("groupID");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("delete " + groupID);
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    
    ResultSet rs1;
    Statement st1 = con.createStatement();
    String sql = "select pageid from grouppage where groupid = '"+groupID+"';";
   	rs1 = st1.executeQuery(sql);
   	int pageID = 0;
   	if (rs1.next()) {
   	  pageID = rs1.getInt(1);
	}
    
   	Statement st6 = con.createStatement();
   	sql = "DELETE FROM GroupMembers WHERE GroupID = '"+groupID+"'";
   	st6.executeUpdate(sql);
   	
   	Statement st5 = con.createStatement();
   	sql = "DELETE FROM GroupPage WHERE GroupID = '"+groupID+"'";
   	st5.executeUpdate(sql);
   	
   	Statement st4 = con.createStatement();
   	sql = "DELETE FROM GroupData WHERE GroupID = '"+groupID+"'";   			
   	st4.executeUpdate(sql);

    //Statement st3 = con.createStatement();
   	//sql = "DELETE FROM PageData WHERE PageID = '"+pageID+"';";
   	//st3.executeUpdate(sql);
	session.removeAttribute("groupID");
    response.sendRedirect("homep.jsp");
%>