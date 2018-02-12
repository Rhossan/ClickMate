<%@ page import ="java.sql.*" %>
<%
String id=request.getParameter("postID");
String accountID = (String)session.getAttribute("accountID");
System.out.println(id + " " + accountID);
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    
    ResultSet res;
   	Statement st = con.createStatement();
   	String sql = "SELECT * FROM LikePost Where AccountNumber = '"+accountID+"' and PostID = '"+id+"'";		
    res = st.executeQuery(sql);
    if (res.next()) {
    	Statement st6 = con.createStatement();
       	sql = "DELETE FROM LikePost WHERE "+
       	"AccountNumber ='"+accountID+"' AND PostID = '"+id+"'";		
       	st6.executeUpdate(sql);
    }
    else{
	   	Statement st6 = con.createStatement();
	   	sql = "INSERT INTO LikePost(AccountNumber, PostID) "+
	   	"VALUES ('"+accountID+"','"+id+"');";		
	   	st6.executeUpdate(sql);
    }
    response.sendRedirect("homep.jsp");
%>