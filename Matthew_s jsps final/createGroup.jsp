<%@ page import ="java.sql.*" %>
<%
String type = request.getParameter("type");
String name = request.getParameter("name");
    Class.forName("com.mysql.jdbc.Driver");
    
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    
    ResultSet rs1;
    Statement st1 = con.createStatement();
    String sql = "select max(groupid) as total from grouppage;";
   	rs1 = st1.executeQuery(sql);
   	int groupID=0;
   	if (rs1.next()) {
   	  groupID = rs1.getInt(1) + 1;
		}
	
   	ResultSet rs2;
    Statement st2 = con.createStatement();

    sql = "select max(pageid) as total from pagedata;";
   	rs2 = st2.executeQuery(sql);
   	int pageID=0;
   	if (rs2.next()) {
   	  pageID = rs2.getInt(1) + 1;
		}
    
    Statement st3 = con.createStatement();

   	sql = "INSERT INTO PageData(PageID, PostCount, OwnerID)"+
   			"VALUES ('"+pageID+"', 0,'"+session.getAttribute("accountID")+"');";
   			
   	st3.executeUpdate(sql);
	
   	Statement st4 = con.createStatement();

   	sql = "INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)"+
   			"VALUES ('"+groupID+"', '"+type+"', '"+session.getAttribute("accountID")+"', '"+name+"');";
   			
   			
   	st4.executeUpdate(sql);
   	
   	Statement st5 = con.createStatement();

   	sql = "INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)"+
   	   			"VALUES ('"+groupID+"', '"+pageID+"', '"+new java.sql.Timestamp(new java.util.Date().getTime())+"');";
   			
   			
   	st5.executeUpdate(sql);
   	
   	Statement st6 = con.createStatement();

   	sql = "INSERT INTO GroupMembers(GroupID, AccountNumber)"+
   	 			"VALUES ('"+groupID+"', '"+session.getAttribute("accountID")+"');";
   			
   			
   	st6.executeUpdate(sql);
   	
    response.sendRedirect("homep.jsp");
%>