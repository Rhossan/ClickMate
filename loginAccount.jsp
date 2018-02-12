<%@ page import ="java.sql.*" %>
<%
String username = request.getParameter("email");
String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String sql = "SELECT AccountNumber FROM userdata U, accounts A WHERE "+
   		 "U.EmailAddress = '"+ username +"'AND U.UPassword = '" + password+"' AND A.UserID = U.UserID";
    rs = st.executeQuery(sql);
    if (rs.next()) {
    	//set the attribute
    	int accountID = rs.getInt("AccountNumber");
        session.setAttribute("accountID", rs.getInt("AccountNumber")+"");
        
        ResultSet res;
        sql = "SELECT PageID FROM pagedata p WHERE OwnerID = '" + accountID +
        		"'AND NOT EXISTS (select pageid from grouppage g where p.pageid = g.pageid)"; 
        res = st.executeQuery(sql);
        if (res.next()) {
        	session.setAttribute("pageid", res.getInt("PageID"));
        	System.out.println(res.getInt("PageID"));
            response.sendRedirect("homep.jsp");
        }
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>