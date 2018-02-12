<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date;" %>
<%
	String postContent = request.getParameter("newPost");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String id = (String)session.getAttribute("accountID");
    String sql = "select max(PostID) as total from postdata; ";
   	rs = st.executeQuery(sql);
   	int total=0;
   	if (rs.next()) {
   	  total = rs.getInt(1);
   	}
    total++;
    out.println(total);
    Statement st1=con.createStatement();;
    String sql1 = "INSERT INTO postdata VALUES ("+total+ ","+session.getAttribute("pageid")+", "+ id +"," + "now(), 0, '"+ postContent+"');";
    if(st1.executeUpdate(sql1)==1){
        response.sendRedirect("homep.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>