<%@ page import ="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
System.out.println(username+ " " + password);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String sql = "SELECT employeeID, authenicationlevel, FirstName, LastName FROM employeedata "+
   		"where Username = '"+username+"' and EPassword = '"+password+"'"; 

    rs = st.executeQuery(sql);
    if (rs.next()) {
    	//set the attribute
    	int employeeid = rs.getInt("employeeid");
    	String lvl = rs.getString("authenicationlevel");
    	String name = rs.getString("FirstName") + " " + rs.getString("LastName");
        session.setAttribute("employeeid", employeeid+"");
        session.setAttribute("level", lvl);
        session.setAttribute("name", name);
        if(lvl.equals("M")){
            response.sendRedirect("Manage_page.jsp");
        }
        else{
            response.sendRedirect("CRPage.jsp");
        }
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>