<%@ page import ="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String sql = "SELECT employeeid, authenicationlevel from employeedata"+
    		"where Username = '"+username+"' and EPassword = '"+password+"'; ";
    		
    rs = st.executeQuery(sql);
    if (rs.next()) {
    	//set the attribute
    	int employeeid = rs.getInt("employeeid");
    	String lvl = rs.getString("authenicationlevel");
        session.setAttribute("employeeid", employeeid+"");
        session.setAttribute("level", lvl);
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